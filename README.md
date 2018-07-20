Sirius Core
-------------
https://getsirius.io

What is Sirius?
-------------
Sirius is a new smart contract platform that offers the same anonymity guarantees as Bitcoin by virtue of its UTXO model. To encourage developer participation, Sirius is distributed for free among developers and blockchain enthusiasts. Among its consensus-building features are decentralized governance, enabling fast adaptation of blockchain parameters to changing conditions, and the Mutualized Proof-of-Stake algorithm. To encourage adoption, Sirius will feature a smart contract wizard. This feature will enable bets, lotteries and token crowdsales to be easily organised. This can be done even with no programming experience, finally putting the power of smart contracts in the hands of users, not just coders.

Communication
-------------
The Sirius slack can be found at: https://sirx.slack.com


Building Sirius Core
----------

### Build on Ubuntu

    This is a quick start script for compiling Sirius on  Ubuntu


    sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils git cmake libboost-all-dev
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:bitcoin/bitcoin
    sudo apt-get update
    sudo apt-get install libdb4.8-dev libdb4.8++-dev

    # If you want to build the Qt GUI:
    sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler qrencode

    git clone https://github.com/siriusproject/sirius --recursive
    cd sirius

    # Note autogen will prompt to install some more dependencies if needed
    ./autogen.sh
    ./configure 
    make -j2
    
### Build on CentOS

Here is a brief description for compiling Sirius on CentOS, for more details please refer to [the specific document](https://github.com/siriusproject/sirius/blob/master/doc/build-unix.md)

    # Compiling boost manually
    sudo yum install python-devel bzip2-devel
    git clone https://github.com/boostorg/boost.git
    cd boost
    git checkout boost-1.66.0
    git submodule update --init --recursive
    ./bootstrap.sh --prefix=/usr --libdir=/usr/lib64
    ./b2 headers
    sudo ./b2 -j4 install
    
    # Installing Dependencies for Sirius
    sudo yum install epel-release
    sudo yum install libtool libdb4-cxx-devel openssl-devel libevent-devel
    
    # If you want to build the Qt GUI:
    sudo yum install qt5-qttools-devel protobuf-devel qrencode-devel
    
    # Building Sirius
    git clone --recursive https://github.com/siriusproject/sirius.git
    cd sirius
    ./autogen.sh
    ./configure
    make -j4

### Build on OSX

The commands in this guide should be executed in a Terminal application.
The built-in one is located in `/Applications/Utilities/Terminal.app`.

#### Preparation

Install the OS X command line tools:

`xcode-select --install`

When the popup appears, click `Install`.

Then install [Homebrew](https://brew.sh).

#### Dependencies

    brew install cmake automake berkeley-db4 libtool boost --c++11 --without-single --without-static miniupnpc openssl pkg-config protobuf qt5 libevent imagemagick --with-librsvg qrencode

NOTE: Building with Qt4 is still supported, however, could result in a broken UI. Building with Qt5 is recommended.

#### Build Sirius Core

1. Clone the sirius source code and cd into `sirius`

        git clone --recursive https://github.com/siriusproject/sirius.git
        cd sirius

2.  Build sirius-core:

    Configure and build the headless sirius binaries as well as the GUI (if Qt is found).

    You can disable the GUI build by passing `--without-gui` to configure.

        ./autogen.sh
        ./configure
        make

3.  It is recommended to build and run the unit tests:

        make check

### Run

Then you can either run the command-line daemon using `src/siriusd` and `src/sirius-cli`, or you can run the Qt GUI using `src/qt/sirius-qt`

For in-depth description of Sparknet and how to use Sirius for interacting with contracts, please see [sparknet-guide](doc/sparknet-guide.md).

License
-------

Sirius is GPLv3 licensed.

