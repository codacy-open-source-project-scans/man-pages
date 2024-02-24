# Copyright 2024 Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_CONFIGURE_BUILD_DEPENDS_MAN2HTML_INCLUDED
MAKEFILE_CONFIGURE_BUILD_DEPENDS_MAN2HTML_INCLUDED := 1


DEFAULT_MAN2HTMLFLAGS :=
EXTRA_MAN2HTMLFLAGS   :=
MAN2HTMLFLAGS         := $(DEFAULT_MAN2HTMLFLAGS) $(EXTRA_MAN2HTMLFLAGS)
MAN2HTML              := man2html


endif  # include guard
