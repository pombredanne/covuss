DESTDIR=/usr/local

all: manpage

install: manpage
	install -D -m 555 covuss $(DESTDIR)/bin/covuss
	install -D -m 444 covuss.1.gz $(DESTDIR)/share/man/man1/covuss.1.gz

uninstall:
	rm -f $(DESTDIR)/bin/covuss
	rm -f $(DESTDIR)/share/man/man1/covuss.1.gz

manpage: clean
	gzip -k covuss.1

clean:
	rm -f covuss.1.gz
