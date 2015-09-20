VERSION=snapshot
DESTDIR=/usr/local

all: manpage

install: manpage
	install -D -m 555 covuss $(DESTDIR)/bin/covuss
	install -D -m 444 build/covuss.1.gz $(DESTDIR)/share/man/man1/covuss.1.gz

uninstall:
	rm -f $(DESTDIR)/bin/covuss
	rm -f $(DESTDIR)/share/man/man1/covuss.1.gz

dist: clean builddir
	mkdir build/covuss-$(VERSION)
	cp * build/covuss-$(VERSION) 2>/dev/null || true
	cd build && tar czf covuss-$(VERSION).tgz covuss-$(VERSION)

manpage: clean builddir
	gzip -c covuss.1 > build/covuss.1.gz

builddir:
	mkdir build

clean:
	rm -rf build
