DESTDIR ?=
BINDIR ?= /usr/local/bin
CONFDIR ?= /etc
MANDIR ?= /usr/share/man/man1
SYSTEMDUNITDIR ?= /etc/systemd/system

all:
	@ echo "Use: make install, make systemd, make uninstall"

install:
	install -d $(DESTDIR)$(BINDIR)

	install -m0755 zram-on $(DESTDIR)$(BINDIR)/zram-on
	install -m0755 zram-off $(DESTDIR)$(BINDIR)/zram-off

	-install -d $(DESTDIR)$(SYSTEMDUNITDIR)
	-sed "s|:TARGET_BIN:|$(BINDIR)|g;s|:TARGET_CONF:|$(CONFDIR)|g" yazram.service.in > yazram.service
	-install -m0644 yazram.service $(DESTDIR)$(SYSTEMDUNITDIR)/yazram.service
	-chcon -t systemd_unit_file_t $(DESTDIR)$(SYSTEMDUNITDIR)/yazram.service
	-rm -fv yazram.service

uninstall:
	# 'make uninstall' must not fail with error if systemctl is unavailable or returns error
	-systemctl stop yazram.service || true
	-systemctl disable yazram.service || true
	-systemctl daemon-reload
	rm -fv $(DESTDIR)$(BINDIR)/zram-on
	rm -fv $(DESTDIR)$(BINDIR)/zram-off
	rm -fv $(DESTDIR)$(SYSTEMDUNITDIR)/yazram.service

systemd:
	-systemctl daemon-reload
	-systemctl enable yazram.service
	-systemctl restart yazram
	-systemctl status yazram
