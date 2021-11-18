worldwideweb Core
=============

Setup
---------------------
worldwideweb Core is the original worldwideweb client and it builds the backbone of the network. It downloads and, by default, stores the entire history of worldwideweb transactions, which requires a few hundred gigabytes of disk space. Depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download worldwideweb Core, visit [worldwidewebcore.org](https://worldwidewebcore.org/en/download/).

Running
---------------------
The following are some helpful notes on how to run worldwideweb Core on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/worldwideweb-qt` (GUI) or
- `bin/worldwidewebd` (headless)

### Windows

Unpack the files into a directory, and then run worldwideweb-qt.exe.

### macOS

Drag worldwideweb Core to your applications folder, and then run worldwideweb Core.

### Need Help?

* See the documentation at the [worldwideweb Wiki](https://en.worldwideweb.it/wiki/Main_Page)
for help and more information.
* Ask for help on [worldwideweb StackExchange](https://worldwideweb.stackexchange.com).
* Ask for help on #worldwideweb on Libera Chat. If you don't have an IRC client, you can use [web.libera.chat](https://web.libera.chat/#worldwideweb).
* Ask for help on the [worldwidewebTalk](https://worldwidewebtalk.org/) forums, in the [Technical Support board](https://worldwidewebtalk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build worldwideweb Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [FreeBSD Build Notes](build-freebsd.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Android Build Notes](build-android.md)

Development
---------------------
The worldwideweb repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Productivity Notes](productivity.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://doxygen.worldwidewebcore.org/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [JSON-RPC Interface](JSON-RPC-interface.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [worldwidewebTalk](https://worldwidewebtalk.org/) forums, in the [Development & Technical Discussion board](https://worldwidewebtalk.org/index.php?board=6.0).
* Discuss project-specific development on #worldwideweb-core-dev on Libera Chat. If you don't have an IRC client, you can use [web.libera.chat](https://web.libera.chat/#worldwideweb-core-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [worldwideweb.conf Configuration File](worldwideweb-conf.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [I2P Support](i2p.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [Managing Wallets](managing-wallets.md)
- [PSBT support](psbt.md)
- [Reduce Memory](reduce-memory.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
