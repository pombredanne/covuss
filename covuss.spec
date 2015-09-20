Name:		covuss
Version:	__VERSION__
Release:	1%{?dist}
Summary:	CVSS parser and calculator

Group:		Applications/Security
License:	ISC
URL:		https://github.com/mkopta/covuss
Source0:	covuss-__VERSION__.tgz

BuildArch:      noarch

%description
covuss is a CVSS (Common Vulnerability Scoring System) parser and calculator with two main functions. When given CVSS vector as an argument on a command line, covuss will calculate CVSS score for given vector. Alternatively, you can enter interactive mode to create new CVSS by answering bunch of questions. You will be given score and CVSS vector of your input at the end.

%prep
%setup -q

%install
make install DESTDIR=%{buildroot}/usr

%files
%doc
/usr/bin/covuss
/usr/share/man/man1/covuss.1.gz
