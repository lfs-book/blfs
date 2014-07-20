SHELL=/bin/bash

EXTDIR=${DESTDIR}/etc
DEFAULTSDIR=${DESTDIR}/etc/default
SERVICEDIR=${DESTDIR}/lib/services
TMPFILESDIR=${DESTDIR}/usr/lib/tmpfiles.d
UNITSDIR=${DESTDIR}/lib/systemd/system
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

install-acpid: create-dirs
	install -m ${CONFMODE} blfs/units/acpid.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/acpid.socket ${UNITSDIR}/
	systemctl enable acpid.socket

install-dhcpd: create-dirs
	install -m ${CONFMODE} blfs/default/dhcpd ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/units/dhcpd.service ${UNITSDIR}/
	systemctl enable dhcpd.service

install-exim: create-dirs
	install -m ${CONFMODE} blfs/units/exim.service ${UNITSDIR}/
	systemctl enable exim.service

install-git: create-dirs
	install -m ${CONFMODE} blfs/units/git-daemonat.service ${UNITSDIR}/git-daemon@.service
	install -m ${CONFMODE} blfs/units/git-daemon.socket ${UNITSDIR}/
	systemctl enable git-daemon.socket

install-gpm: create-dirs
	install -m ${CONFMODE} blfs/units/gpm.service ${UNITSDIR}/
	systemctl enable gpm.service

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

install-nfs-client: create-dirs
	install -m ${CONFMODE} blfs/default/nfs-utils ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/units/rpc-statd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/nfs-client.target ${UNITSDIR}/
	systemctl enable rpc-statd.service

install-nfs-server: install-nfs-client
	install -m ${CONFMODE} blfs/units/nfsd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/rpc-mountd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/nfs-server.target ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/proc-fs-nfsd.mount ${UNITSDIR}/
	systemctl enable nfsd.service
	systemctl enable rpc-mountd.service

install-ntpd: create-dirs
	install -m ${CONFMODE} blfs/units/ntpd.service ${UNITSDIR}/
	install -d -m ${DIRMODE} ${DESTDIR}/usr/lib/systemd/ntp-units.d
	echo "ntpd.service" > ${DESTDIR}/usr/lib/systemd/ntp-units.d/ntp.list
	systemctl enable ntpd.service

install-postfix: create-dirs
	install -m ${CONFMODE} blfs/units/postfix.service ${UNITSDIR}/
	systemctl enable postfix.service

install-postgresql: create-dirs
	install -m ${CONFMODE} blfs/tmpfiles/postgresql.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/postgresql.service ${UNITSDIR}/
	systemd-tmpfiles --create postgresql.conf
	systemctl enable postgresql.service

install-proftpd: create-dirs
	install -m ${CONFMODE} blfs/units/proftpd.service ${UNITSDIR}/
	systemctl enable proftpd.service

install-rpcbind: create-dirs
	install -m ${CONFMODE} blfs/units/rpcbind.service ${UNITSDIR}/
	systemctl enable rpcbind.service

install-rsyncd: create-dirs
	install -m ${CONFMODE} blfs/units/rsyncd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/rsyncdat.service ${UNITSDIR}/rsyncd@.service
	install -m ${CONFMODE} blfs/units/rsyncd.socket ${UNITSDIR}/
	systemctl enable rsyncd.service

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

install-sendmail: create-dirs
	install -m ${CONFMODE} blfs/default/sendmail ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/units/sm-client.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/sendmail.service ${UNITSDIR}/
	systemctl enable sendmail.service

install-slapd: create-dirs
	install -m ${CONFMODE} blfs/default/slapd ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/tmpfiles/slapd.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/slapd.service ${UNITSDIR}/
	systemd-tmpfiles --create slapd.conf
	systemctl enable slapd.service

install-sshd: create-dirs
	install -m ${CONFMODE} blfs/units/sshd.service ${UNITSDIR}/
	install -m ${CONFMODE} blfs/units/sshdat.service ${UNITSDIR}/sshd@.service
	install -m ${CONFMODE} blfs/units/sshd.socket ${UNITSDIR}/
	systemctl enable sshd.service

install-svnserve: create-dirs
	install -m ${CONFMODE} blfs/default/svnserve ${DEFAULTSDIR}/
	install -m ${CONFMODE} blfs/tmpfiles/svnserve.conf ${TMPFILESDIR}/
	install -m ${CONFMODE} blfs/units/svnserve.service ${UNITSDIR}/
	systemd-tmpfiles --create svnserve.conf
	systemctl enable svnserve.service

install-unbound: create-dirs
	install -m ${CONFMODE} blfs/units/unbound.service ${UNITSDIR}/
	systemctl enable unbound.service

install-vsftpd: create-dirs
	install -m ${CONFMODE} blfs/units/vsftpd.service ${UNITSDIR}/
	systemctl enable vsftpd.service

install-winbindd: install-samba
	install -m ${CONFMODE} blfs/units/winbindd.service ${UNITSDIR}/
	systemctl enable winbindd.service

install-xinetd: create-dirs
	install -m ${CONFMODE} blfs/units/xinetd.service ${UNITSDIR}/
	systemctl enable xinetd.service

uninstall-acpid:
	systemctl stop acpid.service
	systemctl disable acpid.socket
	rm -f ${UNITSDIR}/acpid.service ${UNITSDIR}/acpid.socket

uninstall-dhcpd:
	systemctl stop dhcpd.service
	systemctl disable dhcpd.service
	rm -f ${DEFAULTSDIR}/dhcpd ${UNITSDIR}/dhcpd.service

uninstall-exim:
	systemctl stop exim.service
	systemctl disable exim.service
	rm -f ${UNITSDIR}/exim.service

uninstall-git:
	systemctl stop git-daemon.socket
	systemctl disable git-daemon.socket
	rm -f ${UNITSDIR}/git-daemon@.service ${UNITSDIR}/git-daemon.socket

uninstall-gpm:
	systemctl stop gpm.service
	systemctl disable gpm.service
	rm -f ${UNITSDIR}/gpm.service

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

uninstall-nfs-client: uninstall-nfs-server
	systemctl stop rpc-statd.service
	systemctl disable rpc-statd.service
	systemctl disable nfs-client.target
	rm -f ${DEFAULTSDIR}/nfs-utils ${UNITSDIR}/rpc-statd.service
	rm -f ${UNITSDIR}/nfs-client.target

uninstall-nfs-server:
	[ -e ${UNITSDIR}/rpc-mountd.service ] && systemctl stop rpc-mountd.service
	[ -e ${UNITSDIR}/nfsd.service ] && systemctl stop nfsd.service
	systemctl disable rpc-mountd.service
	systemctl disable nfsd.service
	systemctl disable nfs-server.target
	rm -f ${UNITSDIR}/nfsd.service ${UNITSDIR}/rpc-mountd.service
	rm -f ${UNITSDIR}/nfs-server.target ${UNITSDIR}/proc-fs-nfsd.mount

uninstall-ntpd:
	systemctl stop ntpd.service
	systemctl disable ntpd.service
	rm -f ${UNITSDIR}/ntpd.service ${DESTDIR}/usr/lib/systemd/ntp-units.d/ntp.list

uninstall-postfix:
	systemctl stop postfix.service
	systemctl disable postfix.service
	rm -f ${UNITSDIR}/postfix.service

uninstall-postgresql:
	systemctl stop postgresql.service
	systemctl disable postgresql.service
	rm -f ${TMPFILESDIR}/postgresql.conf ${UNITSDIR}/postgresql.service

uninstall-proftpd:
	systemctl stop proftpd.service
	systemctl disable proftpd.service
	rm -f ${UNITSDIR}/proftpd.service

uninstall-rpcbind:
	systemctl stop rpcbind.service
	systemctl disable rpcbind.service
	rm -f ${UNITSDIR}/rpcbind.service

uninstall-rsyncd:
	systemctl stop rsyncd.socket
	systemctl stop rsyncd.service
	rm -f ${UNITSDIR}/rsyncd.service ${UNITSDIR}/rsyncd@.service
	rm -f ${UNITSDIR}/rsyncd.socket

uninstall-samba: uninstall-winbindd
	systemctl stop smbd.socket
	systemctl stop smbd.service
	systemctl stop nmbd.service
	systemctl disable smbd.socket
	systemctl disable smbd.service
	systemctl disable nmbd.service
	rm -f ${DEFAULTSDIR}/samba ${TMPFILESDIR}/samba.conf ${UNITSDIR}/nmbd.service
	rm -f ${UNITSDIR}/smbd.service ${UNITSDIR}/smbd@.service ${UNITSDIR}/smbd.socket

uninstall-saslauthd:
	systemctl stop saslauthd.service
	systemctl disable saslauthd.service
	rm -f ${DEFAULTSDIR}/saslauthd ${TMPFILESDIR}/saslauthd.conf ${UNITSDIR}/saslauthd.service

uninstall-sendmail:
	systemctl stop sendmail.service
	systemctl disable sendmail.service
	rm -f ${DEFAULTSDIR}/sendmail ${UNITSDIR}/sm-client.service ${UNITSDIR}/sendmail.service

uninstall-slapd:
	systemctl stop slapd.service
	systemctl disable slapd.service
	rm -f ${DEFAULTSDIR}/slapd ${TMPFILESDIR}/slapd.conf ${UNITSDIR}/slapd.service

uninstall-sshd:
	systemctl stop sshd.socket
	systemctl stop sshd.service
	systemctl disable sshd.socket
	systemctl disable sshd.service
	rm -f ${UNITSDIR}/sshd.service ${UNITSDIR}/sshd@.service ${UNITSDIR}/sshd.socket

uninstall-svnserve:
	systemctl stop svnserve.service
	systemctl disable svnserve.service
	rm -f ${DEFAULTSDIR}/svnserve ${TMPFILESDIR}/svnserve.conf ${UNITSDIR}/svnserve.service

uninstall-unbound:
	systemctl stop unbound.service
	systemctl disable unbound.service
	rm -f ${UNITSDIR}/unbound.service

uninstall-vsftpd:
	systemctl stop vsftpd.service
	systemctl disable vsftpd.service
	rm -f ${UNITSDIR}/vsftpd.service

uninstall-winbindd:
	systemctl stop winbindd.service
	systemctl disable winbindd.service
	rm -f ${UNITSDIR}/winbindd.service

uninstall-xinetd:
	systemctl stop xinetd.service
	systemctl disable xinetd.service
	rm -f ${UNITSDIR}/xinetd.service

.PHONY: all create-dirs create-service-dir \
	install-service-dhclient \
	install-service-dhcpcd \
	install-service-bridge \
	install-service-ipx \
	install-service-pppoe \
	install-service-wpa \
	install-acpid \
	install-dhcpd \
	install-exim \
	install-git \
	install-gpm \
	install-httpd \
	install-kdm \
	install-krb5 \
	install-mysqld \
	install-named \
	install-nfs-client \
	install-nfs-server \
	install-ntp \
	install-postfix \
	install-postgresql \
	install-proftpd \
	install-rpcbind \
	install-rsyncd \
	install-samba \
	install-saslauthd \
	install-sendmail \
	install-slapd \
	install-sshd \
	install-svnserve \
	install-unbound \
	install-vsftpd \
	install-winbindd \
	install-xinetd \
	uninstall-acpid \
	uninstall-dhcpd \
	uninstall-exim \
	uninstall-git \
	uninstall-gpm \
	uninstall-httpd \
	uninstall-kdm \
	uninstall-krb5 \
	uninstall-mysqld \
	uninstall-named \
	uninstall-nfs-client \
	uninstall-nfs-server \
	uninstall-ntpd \
	uninstall-postfix \
	uninstall-postgresql \
	uninstall-proftpd \
	uninstall-rpcbind \
	uninstall-rsyncd \
	uninstall-samba \
	uninstall-saslauthd \
	uninstall-sendmail \
	uninstall-slapd \
	uninstall-sshd \
	uninstall-svnserve \
	uninstall-unbound \
	uninstall-vsftpd \
	uninstall-winbindd \
	uninstall-xinetd
