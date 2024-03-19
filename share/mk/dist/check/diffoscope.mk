# Copyright 2024, Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_DIST_CHECK_DIFFOSCOPE_INCLUDED
MAKEFILE_DIST_CHECK_DIFFOSCOPE_INCLUDED := 1


include $(MAKEFILEDIR)/configure/build-depends/coreutils.mk
include $(MAKEFILEDIR)/configure/build-depends/diffoscope.mk
include $(MAKEFILEDIR)/configure/directory_variables.mk
include $(MAKEFILEDIR)/dist/check/dist.mk
include $(MAKEFILEDIR)/dist/tar.mk


$(builddir)/distcheck.diffoscope.touch: $(DISTFILE) $(REDIST) | $$(@D)/
	$(info	$(INFO_)DIFFOSCOPE	$^)
	$(DIFFOSCOPE) $^
	$(TOUCH) $@


.PHONY: distcheck-diffoscope
distcheck-diffoscope: $(builddir)/distcheck.diffoscope.touch;


endif  # include guard
