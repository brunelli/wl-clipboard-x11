wl-clipboard-x11
================

A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools

# Status

This script is pretty much alpha software. It was not extensively tested and may not work for all use cases. Please [open an issue][issue-new] to report any malfunction.

For implementation status check [#1][issue-1] or the man page.

# Install

## Manual installation

Dependencies:

- [`wl-clipboard`][wl-clipboard]

```
$ git clone https://github.com/brunelli/wl-clipboard-x11.git wl-clipboard-x11
$ cd wl-clipboard-x11
$ make install
```

See [INSTALL][install] for details.

## Arch Linux

Available in the AUR as [wl-clipboard-x11][aur].

[aur]: https://aur.archlinux.org/packages/wl-clipboard-x11
[install]: https://github.com/brunelli/wl-clipboard-x11/blob/master/INSTALL
[issue-1]: https://github.com/brunelli/wl-clipboard-x11/issues/1
[issue-new]: https://github.com/brunelli/wl-clipboard-x11/issues/new
[wl-clipboard]: https://github.com/bugaevc/wl-clipboard
