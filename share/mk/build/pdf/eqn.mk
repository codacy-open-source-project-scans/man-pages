# Copyright 2021-2024, Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_BUILD_PDF_EQN_INCLUDED
MAKEFILE_BUILD_PDF_EQN_INCLUDED := 1


include $(MAKEFILEDIR)/build/pre/tbl.mk
include $(MAKEFILEDIR)/configure/build-depends/grep.mk
include $(MAKEFILEDIR)/configure/build-depends/groff-base.mk


_PDFMAN_troff := $(patsubst %.eqn,%.pdf.troff,$(_MAN_eqn))


$(_PDFMAN_troff): %.pdf.troff: %.eqn $(MK) | $$(@D)/
	$(info	EQN		$@)
	! ($(EQN) -Tpdf $(EQNFLAGS) <$< 2>&1 >$@) \
	| $(GREP) ^ >&2


.PHONY: build-pdf-eqn
build-pdf-eqn: $(_PDFMAN_troff);


endif  # include guard
