## NAME
**covuss** - CVSS parser and calculator

## SYNOPSIS
    covus [-h|--help] [-d|--detail] ([-i|--interactive] | CVSS_VECTOR)

## DESCRIPTION
covuss  is a CVSS (Common Vulnerability Scoring System) parser and calculator with two main functions. When given CVSS vector as an  argument on  a  command line, covuss will calculate CVSS score for given vector. Alternatively, you can enter interactive mode to  create  new  CVSS  by answering  bunch  of questions. You will be given score and CVSS vector of your input at the end.

Currently only CVSS v2 is supported.

## OPTIONS
### -h, --help
Show usage and exit

### -d, --detail
Apart  from  overall  score,  display  also  detailed   scoring. Includes  (if  applicable)  impact  score, exploitability score, base score, adjusted impact score, adjusted base score, adjusted temporal  score  and environmental score.  Automatically enabled in interactive mode.

### -i, --interactive
Enter interactive mode. Enabled  if  no  cvss  vector  has  been given. Automatically enables detailed output (-d).

In this mode, you have a vulnerability (e.g. CVE) which you wish to evaluate with CVSS. You will be asked  about  value  of  each CVSS  metric  for  your  specific  vulnerability,  starting with (mandatory) base metrics group, followed by (optional)  temporal and environmental metrics groups.

When inquired, you either select one of offered values or invoke a help for given metric/group by entering '?'. The  help  output is  formatted and paged so it would fit standard 80x25 screen. You may exit the interactive mode at any time by entering 'q' or CTRL-C. For your convenience, you don't have to enter the values upper case (all the input is uppercased and stripped  of  white space).

### *CVSS_VECTOR*
CVSS vector you wish to get score of.

## EXAMPLES
### Get overall CVSS score of a vector
    $ covuss AV:N/AC:L/Au:N/C:N/I:N/A:C
    7.8

### Get detailed CVSS score of a vector
    $ ./covuss -d AV:A/AC:M/Au:S/C:C/I:P/A:P/CDP:LM/TD:L/CR:ND/IR:M/AR:M
    Impact score:8.5
    Exploitability score:4.4
    Base score:6.3
    Adjusted impact score:8.5
    Adjusted base score:6.3
    Adjusted temporal score:6.3
    Environmental score:1.9
    Overall CVSS score:1.9

## BUGS
When found, please report them to https://github.com/mkopta/covuss/issues

## AUTHOR
Martin Kopta <martin@kopta.eu>

## SEE ALSO
* https://www.first.org/cvss/v2/guide
A Complete Guide to The Common Vulnerability Scoring System Version 2.0.
