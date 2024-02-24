# Copyright 2024 Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_CONFIGURE_BUILD_DEPENDS_GROFF_INCLUDED
MAKEFILE_CONFIGURE_BUILD_DEPENDS_GROFF_INCLUDED := 1


DEFAULT_GROPDFFLAGS :=
EXTRA_GROPDFFLAGS   :=
GROPDFFLAGS         := $(DEFAULT_GROPDFFLAGS) $(EXTRA_GROPDFFLAGS)
GROPDF              := gropdf


endif  # include guard
