########################################################################
# Copyright 2021-2023, Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: GPL-3.0-or-later
########################################################################


ifndef MAKEFILE_INSTALL_MAN_INCLUDED
MAKEFILE_INSTALL_MAN_INCLUDED := 1


include $(MAKEFILEDIR)/cmd.mk
include $(MAKEFILEDIR)/compress.mk
include $(MAKEFILEDIR)/install/_.mk
include $(MAKEFILEDIR)/src.mk


LINK_PAGES := .so
ifeq ($(LINK_PAGES),.so)
else ifeq ($(LINK_PAGES),symlink)
else
$(warning "LINK_PAGES": "$(LINK_PAGES)")
$(error Valid values for "LINK_PAGES": [".so", "symlink"])
endif


mandir      := $(datarootdir)/man
man1dir     := $(mandir)/man1
man2dir     := $(mandir)/man2
man2typedir := $(mandir)/man2type
man3dir     := $(mandir)/man3
man3constdir:= $(mandir)/man3const
man3headdir := $(mandir)/man3head
man3typedir := $(mandir)/man3type
man4dir     := $(mandir)/man4
man5dir     := $(mandir)/man5
man6dir     := $(mandir)/man6
man7dir     := $(mandir)/man7
man8dir     := $(mandir)/man8
man1ext     := .1$(Z)
man2ext     := .2$(Z)
man2typeext := .2type$(Z)
man3ext     := .3$(Z)
man3constext:= .3const$(Z)
man3headext := .3head$(Z)
man3typeext := .3type$(Z)
man4ext     := .4$(Z)
man5ext     := .5$(Z)
man6ext     := .6$(Z)
man7ext     := .7$(Z)
man8ext     := .8$(Z)


_mandir       := $(DESTDIR)$(mandir)
_man1dir      := $(DESTDIR)$(man1dir)
_man2dir      := $(DESTDIR)$(man2dir)
_man2typedir  := $(DESTDIR)$(man2typedir)
_man3dir      := $(DESTDIR)$(man3dir)
_man3constdir := $(DESTDIR)$(man3constdir)
_man3headdir  := $(DESTDIR)$(man3headdir)
_man3typedir  := $(DESTDIR)$(man3typedir)
_man4dir      := $(DESTDIR)$(man4dir)
_man5dir      := $(DESTDIR)$(man5dir)
_man6dir      := $(DESTDIR)$(man6dir)
_man7dir      := $(DESTDIR)$(man7dir)
_man8dir      := $(DESTDIR)$(man8dir)

_manintropages  := $(patsubst $(MANDIR)/%,$(_mandir)/%$(Z),$(MANINTROPAGES))
_man1pages      := $(patsubst $(MANDIR)/man1/%,$(_man1dir)/%$(Z),$(MAN1PAGES))
_man2pages      := $(patsubst $(MANDIR)/man2/%,$(_man2dir)/%$(Z),$(MAN2PAGES))
_man2typepages  := $(patsubst $(MANDIR)/man2type/%,$(_man2typedir)/%$(Z),$(MAN2TYPEPAGES))
_man3pages      := $(patsubst $(MANDIR)/man3/%,$(_man3dir)/%$(Z),$(MAN3PAGES))
_man3constpages := $(patsubst $(MANDIR)/man3const/%,$(_man3constdir)/%$(Z),$(MAN3CONSTPAGES))
_man3headpages  := $(patsubst $(MANDIR)/man3head/%,$(_man3headdir)/%$(Z),$(MAN3HEADPAGES))
_man3typepages  := $(patsubst $(MANDIR)/man3type/%,$(_man3typedir)/%$(Z),$(MAN3TYPEPAGES))
_man4pages      := $(patsubst $(MANDIR)/man4/%,$(_man4dir)/%$(Z),$(MAN4PAGES))
_man5pages      := $(patsubst $(MANDIR)/man5/%,$(_man5dir)/%$(Z),$(MAN5PAGES))
_man6pages      := $(patsubst $(MANDIR)/man6/%,$(_man6dir)/%$(Z),$(MAN6PAGES))
_man7pages      := $(patsubst $(MANDIR)/man7/%,$(_man7dir)/%$(Z),$(MAN7PAGES))
_man8pages      := $(patsubst $(MANDIR)/man8/%,$(_man8dir)/%$(Z),$(MAN8PAGES))
_manpages       := $(_manintropages) \
                   $(_man1pages) \
                   $(_man2pages) $(_man2typepages) \
                   $(_man3pages) $(_man3constpages) $(_man3headpages) $(_man3typepages) \
                   $(_man4pages) \
                   $(_man5pages) \
                   $(_man6pages) \
                   $(_man7pages) \
                   $(_man8pages)

_manintropages_rm := $(addsuffix -rm,$(wildcard $(_manintropages)))
_man1pages_rm     := $(addsuffix -rm,$(wildcard $(_man1pages)))
_man2pages_rm     := $(addsuffix -rm,$(wildcard $(_man2pages)))
_man2typepages_rm := $(addsuffix -rm,$(wildcard $(_man2typepages)))
_man3pages_rm     := $(addsuffix -rm,$(wildcard $(_man3pages)))
_man3constpages_rm:= $(addsuffix -rm,$(wildcard $(_man3constpages)))
_man3headpages_rm := $(addsuffix -rm,$(wildcard $(_man3headpages)))
_man3typepages_rm := $(addsuffix -rm,$(wildcard $(_man3typepages)))
_man4pages_rm     := $(addsuffix -rm,$(wildcard $(_man4pages)))
_man5pages_rm     := $(addsuffix -rm,$(wildcard $(_man5pages)))
_man6pages_rm     := $(addsuffix -rm,$(wildcard $(_man6pages)))
_man7pages_rm     := $(addsuffix -rm,$(wildcard $(_man7pages)))
_man8pages_rm     := $(addsuffix -rm,$(wildcard $(_man8pages)))

MAN_SECTIONS     := 1 2 2type 3 3const 3head 3type 4 5 6 7 8
install_manX     := $(foreach x,$(MAN_SECTIONS),install-man$(x))
uninstall_manX   := $(foreach x,$(MAN_SECTIONS),uninstall-man$(x))


$(_manintropages):  $(_mandir)/%$(Z):       $(MANDIR)/%           | $$(@D)/
$(_man1pages):      $(_man1dir)/%$(Z):      $(MANDIR)/man1/%      | $$(@D)/
$(_man2pages):      $(_man2dir)/%$(Z):      $(MANDIR)/man2/%      | $$(@D)/
$(_man2typepages):  $(_man2typedir)/%$(Z):  $(MANDIR)/man2type/%  | $$(@D)/
$(_man3pages):      $(_man3dir)/%$(Z):      $(MANDIR)/man3/%      | $$(@D)/
$(_man3constpages): $(_man3constdir)/%$(Z): $(MANDIR)/man3const/% | $$(@D)/
$(_man3headpages):  $(_man3headdir)/%$(Z):  $(MANDIR)/man3head/%  | $$(@D)/
$(_man3typepages):  $(_man3typedir)/%$(Z):  $(MANDIR)/man3type/%  | $$(@D)/
$(_man4pages):      $(_man4dir)/%$(Z):      $(MANDIR)/man4/%      | $$(@D)/
$(_man5pages):      $(_man5dir)/%$(Z):      $(MANDIR)/man5/%      | $$(@D)/
$(_man6pages):      $(_man6dir)/%$(Z):      $(MANDIR)/man6/%      | $$(@D)/
$(_man7pages):      $(_man7dir)/%$(Z):      $(MANDIR)/man7/%      | $$(@D)/
$(_man8pages):      $(_man8dir)/%$(Z):      $(MANDIR)/man8/%      | $$(@D)/


$(_manpages):
	$(info INSTALL	$@)
	$(INSTALL_DATA) -T $< $@
	$(SED) -i \
		-e '/^\.so /s, man1/\(.*\)\.1$$, $(notdir $(man1dir))/\1$(man1ext),' \
		-e '/^\.so /s, man2/\(.*\)\.2$$, $(notdir $(man2dir))/\1$(man2ext),' \
		-e '/^\.so /s, man2type/\(.*\)\.2type$$, $(notdir $(man2typedir))/\1$(man2typeext),' \
		-e '/^\.so /s, man3/\(.*\)\.3$$, $(notdir $(man3dir))/\1$(man3ext),' \
		-e '/^\.so /s, man3const/\(.*\)\.3const$$, $(notdir $(man3constdir))/\1$(man3constext),' \
		-e '/^\.so /s, man3head/\(.*\)\.3head$$, $(notdir $(man3headdir))/\1$(man3headext),' \
		-e '/^\.so /s, man3type/\(.*\)\.3type$$, $(notdir $(man3typedir))/\1$(man3typeext),' \
		-e '/^\.so /s, man4/\(.*\)\.4$$, $(notdir $(man4dir))/\1$(man4ext),' \
		-e '/^\.so /s, man5/\(.*\)\.5$$, $(notdir $(man5dir))/\1$(man5ext),' \
		-e '/^\.so /s, man6/\(.*\)\.6$$, $(notdir $(man6dir))/\1$(man6ext),' \
		-e '/^\.so /s, man7/\(.*\)\.7$$, $(notdir $(man7dir))/\1$(man7ext),' \
		-e '/^\.so /s, man8/\(.*\)\.8$$, $(notdir $(man8dir))/\1$(man8ext),' \
		$@
ifeq ($(LINK_PAGES),symlink)
	if $(GREP) '^\.so ' <$@ >/dev/null; then \
		$(GREP) '^\.so ' <$@ \
		| $(SED) 's,^\.so \(.*\),../\1,' \
		| $(XARGS) -I tgt $(LN) -fsT tgt $@; \
	fi
endif
ifeq ($(Z),.bz2)
	if ! $(TEST) -L $@; then \
		$(BZIP2) $(BZIP2FLAGS) <$@ \
		| $(SPONGE) $@; \
	fi
else ifeq ($(Z),.gz)
	if ! $(TEST) -L $@; then \
		$(GZIP) $(GZIPFLAGS) - <$@ \
		| $(SPONGE) $@; \
	fi
else ifeq ($(Z),.lz)
	if ! $(TEST) -L $@; then \
		$(LZIP) $(LZIPFLAGS) - <$@ \
		| $(SPONGE) $@; \
	fi
else ifeq ($(Z),.xz)
	if ! $(TEST) -L $@; then \
		$(XZ) $(XZFLAGS) - <$@ \
		| $(SPONGE) $@; \
	fi
endif


.PHONY: install-manintro
install-manintro:  $(_manintropages);
.PHONY: install-man1
install-man1:      $(_man1pages);
.PHONY: install-man2
install-man2:      $(_man2pages);
.PHONY: install-man2type
install-man2type:  $(_man2typepages);
.PHONY: install-man3
install-man3:      $(_man3pages);
.PHONY: install-man3const
install-man3const: $(_man3constpages);
.PHONY: install-man3head
install-man3head:  $(_man3headpages);
.PHONY: install-man3type
install-man3type:  $(_man3typepages);
.PHONY: install-man4
install-man4:      $(_man4pages);
.PHONY: install-man5
install-man5:      $(_man5pages);
.PHONY: install-man6
install-man6:      $(_man6pages);
.PHONY: install-man7
install-man7:      $(_man7pages);
.PHONY: install-man8
install-man8:      $(_man8pages);

.PHONY: install-man
install-man: install-manintro $(install_manX);

.PHONY: uninstall-manintro
uninstall-manintro: $(_manintropages_rm);
.PHONY: $(uninstall_manX)
$(uninstall_manX): uninstall-man%: $$(_man%pages_rm);

.PHONY: uninstall-man
uninstall-man: uninstall-manintro $(uninstall_manX);


endif  # include guard
