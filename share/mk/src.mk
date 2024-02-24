# Copyright 2021-2024, Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_SRC_INCLUDED
MAKEFILE_SRC_INCLUDED := 1


include $(MAKEFILEDIR)/configure/build-depends/findutils.mk
include $(MAKEFILEDIR)/configure/build-depends/grep.mk
include $(MAKEFILEDIR)/configure/build-depends/sed.mk
include $(MAKEFILEDIR)/configure/src.mk


SORTMAN := $(srcdir)/scripts/sortman


MANEXT := \(\.[[:digit:]]\([[:alpha:]][[:alnum:]]*\)\?\>\|\.man\)\+\(\.man\|\.in\)*$


MANPAGES := $(shell $(FIND) $(MANDIR)/* -type f \
		| $(GREP) '$(MANEXT)' \
		| $(SORTMAN) \
		| $(SED) 's,:,\\:,g')


MANINTROPAGES := $(shell $(FIND) $(MANDIR)/* -type f \
		| $(GREP) '$(MANEXT)' \
		| $(GREP) '/intro$(MANEXT)' \
		| $(SORTMAN) \
		| $(SED) 's,:,\\:,g')


$(foreach s, $(MANSECTIONS),                                                  \
	$(eval MAN$(s)DIR := $(MANDIR)/man$(s)))

$(foreach s, $(MANSECTIONS),                                                  \
	$(eval MAN$(s)PAGES :=                                                \
		$(filter-out $(MANINTROPAGES),                                \
			$(filter $(MANDIR)/man$(s)/%,                         \
				$(filter %.$(s),                              \
					$(MANPAGES))))))
$(foreach s, $(MANSECTIONS),                                                  \
	$(eval MAN$(s)INTROPAGE :=                                            \
		$(filter $(MANDIR)/man$(s)/%,                                 \
			$(filter %.$(s),                                      \
				$(MANINTROPAGES)))))


NONSO_MAN := $(shell $(FIND) $(MANDIR)/* -type f \
		| $(GREP) '$(MANEXT)' \
		| $(XARGS) $(GREP) -l '^\.TH ' \
		| $(SORTMAN) \
		| $(SED) 's,:,\\:,g')
NONSO_MDOC := $(shell $(FIND) $(MANDIR)/* -type f \
		| $(GREP) '$(MANEXT)' \
		| $(XARGS) $(GREP) -l '^\.Dt ' \
		| $(SORTMAN) \
		| $(SED) 's,:,\\:,g')


endif  # include guard
