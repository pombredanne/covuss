VERSION=snapshot
DESTDIR=/usr/local

all:
	@echo "Usage: make (install | uninstall | dist | rpm | clean)"

install: manpage
	install -D -m 555 covuss $(DESTDIR)/bin/covuss
	install -D -m 444 build/covuss.1.gz $(DESTDIR)/share/man/man1/covuss.1.gz

uninstall:
	rm -f $(DESTDIR)/bin/covuss
	rm -f $(DESTDIR)/share/man/man1/covuss.1.gz

dist: clean builddir
	mkdir build/covuss-$(VERSION)
	cp LICENSE Makefile README.md \
		covuss covuss.1 build/covuss-$(VERSION)
	cd build && tar czf covuss-$(VERSION).tgz covuss-$(VERSION)

rpm: dist
	mkdir -p build/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
	cp build/covuss-$(VERSION).tgz build/rpmbuild/SOURCES
	sed "s/__VERSION__/$(VERSION)/" covuss.spec > build/covuss.spec
	rpmbuild --define "_topdir `pwd`/build/rpmbuild" -ba build/covuss.spec

manpage: clean builddir
	gzip -c covuss.1 > build/covuss.1.gz

builddir:
	mkdir build

clean:
	rm -rf build
