NAME = wl-clipboard-x11
SRCFILE = src/$(NAME)
PREFIX ?= /usr
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
SHAREDIR ?= $(PREFIX)/share
MANDIR ?= $(PREFIX)/share/man

all:
	@echo "$(NAME) is a shell script, so there is nothing to do. Try \"make install\" instead."

install:
	@install -v -d "$(DESTDIR)$(SHAREDIR)/$(NAME)/"
	@install -m 0755 -v "$(SRCFILE)" "$(DESTDIR)$(SHAREDIR)/$(NAME)/$(NAME)"
	@install -v -d "$(DESTDIR)$(MANDIR)/man1"
	@install -m 0644 -v man/$(NAME).1 "$(DESTDIR)$(MANDIR)/man1/$(NAME).1"
	@install -v -d "$(DESTDIR)$(BINDIR)/"
	@ln -nsvf "$(DESTDIR)$(SHAREDIR)/$(NAME)/$(NAME)" "$(DESTDIR)$(BINDIR)/xclip"
	@ln -nsvf "$(DESTDIR)$(SHAREDIR)/$(NAME)/$(NAME)" "$(DESTDIR)$(BINDIR)/xsel"

uninstall:
	unlink "$(DESTDIR)$(BINDIR)/xclip"
	unlink "$(DESTDIR)$(BINDIR)/xsel"
	@rm -vf \
		"$(DESTDIR)$(MANDIR)/man1/$(NAME).1" \
		"$(DESTDIR)$(SHAREDIR)/$(NAME)/$(NAME)"

.PHONY: install uninstall
