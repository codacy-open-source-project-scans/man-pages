# Copyright 2021-2024, Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_DIST_INCLUDED
MAKEFILE_DIST_INCLUDED := 1


include $(MAKEFILEDIR)/configure/build-depends/coreutils.mk
include $(MAKEFILEDIR)/configure/directory_variables.mk


_DISTDIR := $(builddir)/dist


$(builddir)/dist/%/:
	+$(info	MKDIR		$@)
	+$(INSTALL_DIR) $@


.PHONY: dist
dist: dist-tar dist-z;


endif  # include guard
