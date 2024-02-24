# Copyright 2024 Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_DIST_CHECK_ALL_INCLUDED
MAKEFILE_DIST_CHECK_ALL_INCLUDED := 1


include $(MAKEFILEDIR)/configure/build-depends/coreutils.mk
include $(MAKEFILEDIR)/configure/build-depends/sed.mk
include $(MAKEFILEDIR)/configure/directory_variables.mk
include $(MAKEFILEDIR)/configure/version.mk
include $(MAKEFILEDIR)/dist/check/tar.mk


$(builddir)/distcheck.all.touch: \
	$(builddir)/distcheck.check.touch \
	$(builddir)/distcheck.build-ps.touch \
	$(builddir)/distcheck.build-pdf.touch \
	$(builddir)/distcheck.build-html.touch \
	$(builddir)/distcheck.build-book.touch \
	$(builddir)/distcheck.lint-man.touch \
	$(builddir)/distcheck.lint-mdoc.touch
$(builddir)/distcheck.all.touch: $(TMPDIR1)/$(DISTNAME) | $$(@D)/
	#$(info	MAKE		all)
	#$(MAKE) -C $< all \
	#| $(SED)   's,^,MAKE all:		,'
	$(TOUCH) $@


endif  # include guard
