#!/usr/bin/env bash
# Copyright (c) 2016-2020 The worldwideweb Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

worldwidewebD=${worldwidewebD:-$BINDIR/worldwidewebd}
worldwidewebCLI=${worldwidewebCLI:-$BINDIR/worldwideweb-cli}
worldwidewebTX=${worldwidewebTX:-$BINDIR/worldwideweb-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/worldwideweb-wallet}
worldwidewebUTIL=${worldwidewebQT:-$BINDIR/worldwideweb-util}
worldwidewebQT=${worldwidewebQT:-$BINDIR/qt/worldwideweb-qt}

[ ! -x $worldwidewebD ] && echo "$worldwidewebD not found or not executable." && exit 1

# Don't allow man pages to be generated for binaries built from a dirty tree
DIRTY=""
for cmd in $worldwidewebD $worldwidewebCLI $worldwidewebTX $WALLET_TOOL $worldwidewebUTIL $worldwidewebQT; do
  VERSION_OUTPUT=$($cmd --version)
  if [[ $VERSION_OUTPUT == *"dirty"* ]]; then
    DIRTY="${DIRTY}${cmd}\n"
  fi
done
if [ -n "$DIRTY" ]
then
  echo -e "WARNING: the following binaries were built from a dirty tree:\n"
  echo -e $DIRTY
  echo "man pages generated from dirty binaries should NOT be committed."
  echo "To properly generate man pages, please commit your changes to the above binaries, rebuild them, then run this script again."
fi

# The autodetected version git tag can screw up manpage output a little bit
read -r -a BTCVER <<< "$($worldwidewebCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for worldwidewebd if --version-string is not set,
# but has different outcomes for worldwideweb-qt and worldwideweb-cli.
echo "[COPYRIGHT]" > footer.h2m
$worldwidewebD --version | sed -n '1!p' >> footer.h2m

for cmd in $worldwidewebD $worldwidewebCLI $worldwidewebTX $WALLET_TOOL $worldwidewebUTIL $worldwidewebQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
