# covuss

covuss is a CVSS (Common Vulnerability Scoring System) parser and calculator with two main functions. When given CVSS vector as an argument on a command line, covuss will calculate CVSS score for given vector. Alternatively, you can enter interactive mode to create new CVSS by answering bunch of questions. You will be given score and CVSS vector of your input at the end.

Currently only CVSS v2 is supported.

## Implementation

Covuss has been implemented according to the "Complete Guide to The Common Vulnerability Scoring System Version 2.0" (https://www.first.org/cvss/v2/guide).

Covuss is written in Python and has been tested on Python 2.7.10 and Python 3.4.3.

## Installation

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
    == Base metrics group (required) ==
    Acess Vector (AV) [(L)ocal, (A)djacent Network, (N)etwork, (?)]: N
    Acess Complexity (AC) [(H)igh, (M)edium, (L)ow, (?)]: L
    Authentication (Au) [(M)ultiple, (S)ingle, (N)one, (?)]: N
    Confidentiality impact (C) [(N)one, (P)artial, (C)omplete, (?)]: C
    Integrity impact (I) [(N)one, (P)artial, (C)omplete, (?)]: C
    Availability impact (A) [(N)one, (P)artial, (C)omplete, (?)]: C
    
    Continue with (optional) Temporal metrics group? [y/N/?]: y
    Exploitability (E) [(U)nproven, Proof-of-Concept (POC), (F)unctional, (H)igh, Not Defined (ND), (?)]: H
    Remedation Level (RL) [Official Fix (OF), Temporary Fix (TF), (W)orkaround, (U)navailable, Not Defined (ND), (?)]: of
    Report Confidence (RC) [Unconfirmed (UC), Uncorroborated (UR), (C)onfirmed, Not Defined (ND), (?)]: c
    
    Continue with (optional) Environmental metrics group? [y/N/?]: y
    Collateral Damage Potential (CDP) [(N)one, (L)ow, Low-Medium (LM), Medium-High (MH), (H)igh, Not Defined (ND), (?)]: h
    Target Distribution (TD) [(N)one, (L)ow, (M)edium, (H)igh, Not Defined (ND), (?)]: h
    Confidentiality Requirement (CR) [(L)ow, (M)edium, (H)igh, Not Defined (ND), (?)]: h
    Integrity Requirement (CR) [(L)ow, (M)edium, (H)igh, Not Defined (ND), (?)]: h
    Availability Requirement (CR) [(L)ow, (M)edium, (H)igh, Not Defined (ND), (?)]: h
    
    Vector: AV:N/AC:L/Au:N/C:C/I:C/A:C/E:H/RL:OF/RC:C/CDP:H/TD:H/CR:H/IR:H/AR:H
    Impact score:10.0
    Exploitability score:10.0
    Base score:10.0
    Temporal score:8.7
    Adjusted impact score:10
    Adjusted base score:10.0
    Adjusted temporal score:8.7
    Environmental score:9.3
    Overall CVSS score:9.3

