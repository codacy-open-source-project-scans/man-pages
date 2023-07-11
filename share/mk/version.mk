########################################################################
# Copyright 2022, Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: GPL-3.0-or-later
########################################################################


ifndef MAKEFILE_VERSION_INCLUDED
MAKEFILE_VERSION_INCLUDED := 1


include $(MAKEFILEDIR)/cmd.mk
include $(MAKEFILEDIR)/verbose.mk


DISTNAME    := $(shell $(GIT) describe $(HIDE_ERR))
DISTVERSION := $(patsubst man-pages-%,%,$(DISTNAME))
DISTDATE    := $(shell $(GIT) log -1 --format='%aD')


endif  # include guard
