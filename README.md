# covuss

covuss is a CVSS (Common Vulnerability Scoring System) parser and calculator with two main functions. When given CVSS vector as an argument on a command line, covuss will calculate CVSS score for given vector. Alternatively, you can enter interactive mode to create new CVSS by answering bunch of questions. You will be given score and CVSS vector of your input at the end.

Currently only CVSS v2 is supported.

## Implementation

Covuss has been implemented according to the "Complete Guide to The Common Vulnerability Scoring System Version 2.0" (https://www.first.org/cvss/v2/guide).

Covuss is written in Python and has been tested on Python 2.7.10 and Python 3.4.3.

## Download

Go to https://github.com/mkopta/covuss/releases

You can choose from these options:

* RPM package for Fedora 22 (covuss-1.2-1.fc22.noarch.rpm)
* RPM package for CentOS 7 (covuss-1.2-1.el7.centos.noarch.rpm)
* RPM package for CentOS 6 (covuss-1.2-1.el6.noarch.rpm)
* Source distribution (covuss-1.2.tgz)

## Installation

### Using rpm package

On CentOS 6:

    $ sudo yum install covuss-1.2-1.el6.noarch.rpm

On CentOS 7:

    $ sudo yum install covuss-1.2-1.el7.centos.noarch.rpm

On Fedora 22:

    $ sudo dnf install covuss-1.2-1.fc22.noarch.rpm

### From source

First unpack source and enter the directory.

    $ tar xf covuss-1.2.tgz
    $ cd covuss-1.2

To install system-wide to `/usr/local`, simply call `make install` as root or with sudo.

    $ sudo make install

If you wish to install anywhere else, use `DESTDIR` variable.

    $ sudo make install DESTDIR=/usr

To uninstall, you can use `make uninstall`. In case you have used non-default `DESTDIR`, you must provide it also.

    $ sudo make uninstall DESTDIR=/usr

Note that you don't need to have root to install covuss when you specify `DESTDIR` writeable by you.

## Example usage

### Get overall CVSS score of a vector

    $ covuss AV:N/AC:L/Au:N/C:N/I:N/A:C
    7.8

### Get detailed CVSS score of a vector

    $ covuss -d AV:A/AC:M/Au:S/C:C/I:P/A:P/CDP:LM/TD:L/CR:ND/IR:M/AR:M
    Impact score:8.5
    Exploitability score:4.4
    Base score:6.3
    Adjusted impact score:8.5
    Adjusted base score:6.3
    Adjusted temporal score:6.3
    Environmental score:1.9
    Overall CVSS score:1.9


### Interactive mode

    $ covuss
    Let's build some CVSS!

    Acess Vector (AV)
        (L)ocal
        (A)djacent Network
        (N)etwork
        (?)
    > n

    Acess Complexity (AC)
        (H)igh
        (M)edium
        (L)ow
        (?)
    > m

    Authentication (Au)
        (M)ultiple
        (S)ingle
        (N)one
        (?)
    > s

    Confidentiality impact (C)
        (N)one
        (P)artial
        (C)omplete
        (?)
    > p

    Integrity impact (I)
        (N)one
        (P)artial
        (C)omplete
        (?)
    > p

    Availability impact (A)
        (N)one
        (P)artial
        (C)omplete
        (?)
    > c

    Continue with Temporal metrics group? [y/N/?]:

    Continue with Environmental metrics group? [y/N/?]:

    Vector: AV:N/AC:M/Au:S/C:P/I:P/A:C
    Impact score:8.5
    Exploitability score:6.8
    Base score:7.5
    Overall CVSS score:7.5
