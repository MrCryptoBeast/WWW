#!/usr/bin/env bash
#
# Copyright (c) 2018-2020 The worldwideweb Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

if [ -n "$ANDROID_TOOLS_URL" ]; then
  DOCKER_EXEC make distclean || true
  DOCKER_EXEC ./autogen.sh
  DOCKER_EXEC ./configure $worldwideweb_CONFIG --prefix=$DEPENDS_DIR/aarch64-linux-android || ( (DOCKER_EXEC cat config.log) && false)
  DOCKER_EXEC "make $MAKEJOBS && cd src/qt && ANDROID_HOME=${ANDROID_HOME} ANDROID_NDK_HOME=${ANDROID_NDK_HOME} make apk"
  exit 0
fi

worldwideweb_CONFIG_ALL="--enable-suppress-external-warnings --disable-dependency-tracking --prefix=$DEPENDS_DIR/$HOST --bindir=$BASE_OUTDIR/bin --libdir=$BASE_OUTDIR/lib"
if [ -z "$NO_WERROR" ]; then
  worldwideweb_CONFIG_ALL="${worldwideweb_CONFIG_ALL} --enable-werror"
fi
DOCKER_EXEC "ccache --zero-stats --max-size=$CCACHE_SIZE"

if [ -n "$CONFIG_SHELL" ]; then
  DOCKER_EXEC "$CONFIG_SHELL" -c "./autogen.sh"
else
  DOCKER_EXEC ./autogen.sh
fi

DOCKER_EXEC mkdir -p "${BASE_BUILD_DIR}"
export P_CI_DIR="${BASE_BUILD_DIR}"

DOCKER_EXEC "${BASE_ROOT_DIR}/configure" --cache-file=config.cache $worldwideweb_CONFIG_ALL $worldwideweb_CONFIG || ( (DOCKER_EXEC cat config.log) && false)

DOCKER_EXEC make distdir VERSION=$HOST

export P_CI_DIR="${BASE_BUILD_DIR}/worldwideweb-$HOST"

DOCKER_EXEC ./configure --cache-file=../config.cache $worldwideweb_CONFIG_ALL $worldwideweb_CONFIG || ( (DOCKER_EXEC cat config.log) && false)

set -o errtrace
trap 'DOCKER_EXEC "cat ${BASE_SCRATCH_DIR}/sanitizer-output/* 2> /dev/null"' ERR

if [[ ${USE_MEMORY_SANITIZER} == "true" ]]; then
  # MemorySanitizer (MSAN) does not support tracking memory initialization done by
  # using the Linux getrandom syscall. Avoid using getrandom by undefining
  # HAVE_SYS_GETRANDOM. See https://github.com/google/sanitizers/issues/852 for
  # details.
  DOCKER_EXEC 'grep -v HAVE_SYS_GETRANDOM src/config/worldwideweb-config.h > src/config/worldwideweb-config.h.tmp && mv src/config/worldwideweb-config.h.tmp src/config/worldwideweb-config.h'
fi

DOCKER_EXEC make $MAKEJOBS $GOAL || ( echo "Build failure. Verbose build follows." && DOCKER_EXEC make $GOAL V=1 ; false )

DOCKER_EXEC "ccache --version | head -n 1 && ccache --show-stats"
DOCKER_EXEC du -sh "${DEPENDS_DIR}"/*/
DOCKER_EXEC du -sh "${PREVIOUS_RELEASES_DIR}"
