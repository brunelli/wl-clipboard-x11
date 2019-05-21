NAME = wl-clipboard-x11
SRCFILE = src/$(NAME)
PREFIX ?= /usr
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
SHAREDIR ?= $(PREFIX)/share
MANDIR ?= $(PREFIX)/share/man

all:
	@echo "$(NAME) is a shell script, so there is nothing to do. Try \"make install\" instead."

install.core:
	@install -v -d "$(DESTDIR)$(SHAREDIR)/$(NAME)/"
	@install -m 0755 -v "$(SRCFILE)" "$(DESTDIR)$(SHAREDIR)/$(NAME)/$(NAME)"
	@install -v -d "$(DESTDIR)$(MANDIR)/man1"
	@install -m 0644 -v man/$(NAME).1 "$(DESTDIR)$(MANDIR)/man1/$(NAME).1"

install.links: install.core
	@ln -nsvf "$(NAME).1" "$(DESTDIR)$(MANDIR)/man1/xclip.1"
	@ln -nsvf "$(NAME).1" "$(DESTDIR)$(MANDIR)/man1/xsel.1"
	@install -v -d "$(DESTDIR)$(BINDIR)/"
	@ln -nsvf "$(SHAREDIR)/$(NAME)/$(NAME)" "$(DESTDIR)$(BINDIR)/xclip"
	@ln -nsvf "$(SHAREDIR)/$(NAME)/$(NAME)" "$(DESTDIR)$(BINDIR)/xsel"

install: install.links

uninstall.core:
	@rm -vf \
		"$(DESTDIR)$(MANDIR)/man1/$(NAME).1" \
		"$(DESTDIR)$(SHAREDIR)/$(NAME)/$(NAME)"

uninstall.links: uninstall.core
	unlink "$(DESTDIR)$(BINDIR)/xclip"
	unlink "$(DESTDIR)$(BINDIR)/xsel"
	unlink "$(DESTDIR)$(MANDIR)/man1/xclip.1"
	unlink "$(DESTDIR)$(MANDIR)/man1/xsel.1"

uninstall: uninstall.links

.PHONY: install uninstall
