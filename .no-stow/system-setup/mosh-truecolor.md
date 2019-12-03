Mosh Truecolor support
======================

As of 2019-12-03, mosh does not support truecolor in any released version.
However mosh does support truecolors if built from master.

There's a PPA for ubuntu family at ppa:keithw/mosh-dev

    sudo add-apt-repository ppa:keithw/mosh-dev
    sudo apt-get update
    sudo apt-get install mosh

Note that both mosh client and server must have truecolor support for this to work.
