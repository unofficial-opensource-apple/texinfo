# Set these variables as needed, then include this file, then:
#

# Project info
Project         = texinfo
UserType        = Documentation
ToolType        = Services
GnuAfterInstall = fixup-stuff install-dir

include $(MAKEFILEPATH)/CoreOS/ReleaseControl/GNUSource.make

# texinfo installs some locale information in a way which conflicts with other
# projects.  Conform to the standard.
fixup-stuff:
	mv $(DSTROOT)/usr/share/locale/de_AT $(DSTROOT)/usr/share/locale/de_AT.ISO8859-1
	rm -f $(DSTROOT)/usr/lib/charset.alias

install-dir:
	mkdir -p "$(DSTROOT)/usr/share/info"
	install -c -m 644 dir "$(DSTROOT)/usr/share/info"
