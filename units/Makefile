SHELL=/bin/bash

EXTDIR=${DESTDIR}/etc
DEFAULTSDIR=${DESTDIR}/etc/default
SERVICEDIR=${DESTDIR}/lib/services
TMPFILESDIR=${DESTDIR}/etc/tmpfiles.d
UNITSDIR=${DESTDIR}/lib/blfs/system
MODE=755
DIRMODE=755
CONFMODE=644

all:
	@grep "^install" Makefile.systemd | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list"

create-dirs:
	install -d -m ${DIRMODE} ${DEFAULTSDIR}
	install -d -m ${DIRMODE} ${TMPFILESDIR}
	install -d -m ${DIRMODE} ${UNITSDIR}

create-service-dir:
	install -d -m ${DIRMODE} ${EXTDIR}/sysconfig/network-devices/services
	install -d -m ${DIRMODE} ${SERVICEDIR}

install-service-dhclient: create-service-dir
	install -m ${MODE} blfs/services/dhclient ${SERVICEDIR}

install-service-dhcpcd: create-service-dir
	install -m ${MODE} blfs/services/dhcpcd  ${SERVICEDIR}

install-service-bridge: create-service-dir
	install -m ${MODE} blfs/services/bridge  ${SERVICEDIR}

install-service-wpa: create-service-dir
	install -m ${MODE} blfs/services/wpa ${SERVICEDIR}

install-dhcpd: create-dirs
	install -m ${CONFMODE} blfs/default/dhcpd ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/units/dhcpd.service ${UNITSDIR}/
	systemctl enable dhcpd.service

install-httpd: create-dirs
	install -m ${CONFMODE} blfs/tmpfiles/httpd.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/httpd.service ${UNITSDIR}/
	systemd-tmpfiles --create httpd.conf
	systemctl enable httpd.service

install-kdm: create-dirs
	install -m ${CONFMODE} blfs/units/kdm.service ${UNITSDIR}/
	systemctl enable kdm.service

install-krb5: create-dirs
	install -m ${CONFMODE} blfs/units/krb5-kdc.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/krb5-kpropd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/krb5-kadmind.service ${UNITSDIR}/
	systemctl enable krb5-kdc.service
	systemctl enable krb5-kpropd.service
	systemctl enable krb5-kadmind.service

install-mysqld: create-dirs
	install -m ${CONFMODE} blfs/tmpfiles/mysqld.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/mysqld.service ${UNITSDIR}/
	systemd-tmpfiles --create mysqld.conf
	systemctl enable mysqld.service

install-named: create-dirs
	install -m ${CONFMODE} blfs/tmpfiles/named.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/named.service ${UNITSDIR}/
	systemd-tmpfiles --create named.conf
	systemctl enable named.service

install-nscd: create-dirs
	install -m ${CONFMODE} blfs/tmpfiles/nscd.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/nscd.service ${UNITSDIR}/
	systemd-tmpfiles --create nscd.conf
	systemctl enable nscd.service

install-ntpd: create-dirs
	install -m ${CONFMODE} blfs/units/ntpd.service ${UNITSDIR}/
	systemctl enable ntpd.service

install-postfix: create-dirs
	install -m ${CONFMODE} blfs/units/postfix.service ${UNITSDIR}/
	systemctl enable postfix.service

install-postgresql: create-dirs
	install -m ${CONFMODE} blfs/tmpfiles/postgresql.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/postgresql.service ${UNITSDIR}/
	systemd-tmpfiles --create postgresql.conf
	systemctl enable postgresql.service

install-samba: create-dirs
	install -m ${CONFMODE} blfs/default/samba ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/tmpfiles/samba.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/nmbd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/smbd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/smbdat.service ${UNITSDIR}/smbd@.service
	install -m ${CONFMODE} blfs/units/smbd.socket ${UNITSDIR}/
	systemd-tmpfiles --create samba.conf
	systemctl enable nmbd.service
	systemctl enable smbd.service

install-saslauthd: create-dirs
	install -m ${CONFMODE} blfs/default/saslauthd ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/tmpfiles/saslauthd.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/saslauthd.service ${UNITSDIR}/
	systemd-tmpfiles --create saslauthd.conf
	systemctl enable saslauthd.service

install-slapd: create-dirs
	install -m ${CONFMODE} blfs/default/slapd ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/tmpfiles/slapd.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/slapd.service ${UNITSDIR}/
	systemd-tmpfiles --create slapd.conf
	systemctl enable slapd.service

install-sshd: create-dirs
	install -m ${CONFMODE} blfs/tmpfiles/sshd.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/sshd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/sshdat.service ${UNITSDIR}/sshd@.service
	install -m ${CONFMODE} blfs/units/sshd.socket ${UNITSDIR}/
	systemd-tmpfiles --create sshd.conf
	systemctl enable sshd.service

install-svnserve: create-dirs
	install -m ${CONFMODE} blfs/default/svnserve ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/tmpfiles/svnserve.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/svnserve.service ${UNITSDIR}/
	systemd-tmpfiles --create svnserve.conf
	systemctl enable svnserve.service

install-swat: create-dirs
	install -m ${CONFMODE} blfs/units/swatat.service ${UNITSDIR}/swat@.service
	install -m ${CONFMODE} blfs/units/swat.socket ${UNITSDIR}/
	systemctl enable swat.socket

install-winbindd: create-dirs
	install -m ${CONFMODE} blfs/default/winbindd ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/units/winbindd.service ${UNITSDIR}/
	systemctl enable winbindd.service

uninstall-dhcpd:
	systemctl stop dhcpd.service
	systemctl disable dhcpd.service
	rm -f ${DEFAULTSDIR}/dhcpd ${UNITSDIR}/dhcpd.service

uninstall-httpd:
	systemctl stop httpd.service
	systemctl disable httpd.service
	rm -f ${TMPFILESDIR}/httpd.conf ${UNITSDIR}/httpd.service

uninstall-kdm:
	systemctl stop kdm.service
	systemctl disable kdm.service
	rm -f ${UNITSDIR}/kdm.service

uninstall-krb5:
	systemctl stop krb5-kadmind.service
	systemctl stop krb5-kpropd.service
	systemctl stop krb5-kdc.service
	systemctl disable krb5-kadmind.service
	systemctl disable krb5-kpropd.service
	systemctl disable krb5-kdc.service
	rm -f ${UNITSDIR}/krb5-kadmind.service ${UNITSDIR}/krb5-kpropd.service ${UNITSDIR}/krb5-kdc.service

uninstall-mysqld:
	systemctl stop mysqld.service
	systemctl disable mysqld.service
	rm -f ${TMPFILESDIR}/mysqld.conf ${UNITSDIR}/mysqld.service

uninstall-named:
	systemctl stop named.service
	systemctl disable named.service
	rm -f ${TMPFILESDIR}/named.conf ${UNITSDIR}/named.service

uninstall-nscd:
	systemctl stop nscd.service
	systemctl disable nscd.service
	rm -f ${TMPFILESDIR}/nscd.conf ${UNITSDIR}/nscd.service

uninstall-ntpd:
	systemctl stop ntpd.service
	systemctl disable ntpd.service
	rm -f ${UNITSDIR}/ntpd.service

uninstall-postfix:
	systemctl stop postfix.service
	systemctl disable postfix.service
	rm -f ${UNITSDIR}/postfix.service

uninstall-postgresql:
	systemctl stop postgresql.service
	systemctl disable postgresql.service
	rm -f ${TMPFILESDIR}/postgresql.conf ${UNITSDIR}/postgresql.service

uninstall-samba:
	systemctl stop smbd.service
	systemctl stop nmbd.service
	systemctl disable smbd.service
	systemctl disable nmbd.service
	rm -f ${DEFAULTSDIR}/samba ${TMPFILESDIR}/samba.conf ${UNITSDIR}/nmbd.service
	rm -f ${UNITSDIR}/smbd.service ${UNITSDIR}/smbd@.service t ${UNITSDIR}/smbd.socket

uninstall-saslauthd:
	systemctl stop saslauthd.service
	systemctl disable saslauthd.service
	rm -f ${DEFAULTSDIR}/saslauthd ${TMPFILESDIR}/saslauthd.conf ${UNITSDIR}/saslauthd.service

uninstall-slapd:
	systemctl stop slapd.service
	systemctl disable slapd.service
	rm -f ${DEFAULTSDIR}/slapd ${TMPFILESDIR}/slapd.conf ${UNITSDIR}/slapd.service

uninstall-sshd:
	systemctl stop sshd.service
	systemctl disable sshd.service
	rm -f ${TMPFILESDIR}/sshd.conf ${UNITSDIR}/sshd.service
	rm -f ${UNITSDIR}/sshd@.service ${UNITSDIR}/sshd.socket

uninstall-svnserve:
	systemctl stop svnserve.service
	systemctl disable svnserve.service
	rm -f ${DEFAULTSDIR}/svnserve ${TMPFILESDIR}/svnserve.conf ${UNITSDIR}/svnserve.service

uninstall-swat:
	systemctl stop swat.socket
	systemctl disable swat.socket
	rm -f ${UNITSDIR}/swat@.service ${UNITSDIR}/swat.socket

uninstall-winbindd:
	systemctl stop winbindd.service
	systemctl disable winbindd.service
	rm -f ${DEFAULTSDIR}/winbindd ${UNITSDIR}/winbindd.service

.PHONY: all create-dirs create-service-dir \
	install-service-dhclient \
	install-service-dhcpcd \
	install-service-bridge \
	install-service-ipx \
	install-service-pppoe \
	install-service-wpa \
	install-dhcpd \
	install-httpd \
	install-kdm \
	install-krb5 \
	install-mysqld \
	install-named \
	install-nscd \
	install-ntpd \
	install-postfix \
	install-postgresql \
	install-samba \
	install-saslauthd \
	install-slapd \
	install-sshd \
	install-svnserve \
	install-swat \
	install-winbindd \
	uninstall-dhcpd \
	uninstall-httpd \
	uninstall-kdm \
	uninstall-krb5 \
	uninstall-mysqld \
	uninstall-named \
	uninstall-nscd \
	uninstall-ntpd \
	uninstall-postfix \
	uninstall-postgresql \
	uninstall-samba \
	uninstall-saslauthd \
	uninstall-slapd \
	uninstall-sshd \
	uninstall-svnserve \
	uninstall-swat
