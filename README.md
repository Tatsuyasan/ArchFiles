# ArchFiles

## Informations

Actually, this repo is used to test some packages and theirs configurations,
In fact, as it's very easy to add or remove new configurations with STOW,
there are a large number of configurations for packages that can't be installed.
It's a bad idea to stow all repository.

For AwesomeWM you need to take **awesome-git** last master release.

This list below is the main packages for this dotfiles:

```bash
stow awesome kitty fish ranger pictures rofi x fonts picom
```

### Config todo

- [ ] awesome
- [x] xrandr - .screenlayout folder
- [x] rofi
- [x] LazyVim - nvim
- [x] picom
- [x] kitty
- [x] ranger
- [x] fish

## Installing

### Init

I use **paru AUR** repository

Archlinux:

- Hack Nerd Font
- papirus-icon-theme (rofi)
- xbanish
- picom-git
- awesome-git

Shell:

- Fish shell
- Fisher - Plugin manager
- Tide - Shell theme. Use version 5: fisher install ilancosman/tide@v5
- Nerd fonts - Powerline-patched fonts. I use Hack.
- z for fish - Directory jumping
- Eza - ls replacement
- ghq - Local Git repository organizer
- peco - Interactive filtering

### Base

You will need `git` and GNU `stow`

Clone into your `$HOME` directory or `~`

```bash
git clone https://github.com/Tatsuyasan/ArchFiles.git ~
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README).
```

```bash
stow zsh # Just my zsh config.
```

## Programs

An updated list of all the programs I use can be found in the `programs` directory

## Process

### Shell by default

Change default shell:

```bash
chsh -s $(which <YOUR_SHELL>)
```

### Add Fonts

- download font zip file in nerd font website
- unzip and add it at ~/ArchFiles/fonts/.local/share/fonts
- stow fonts folder in ~/ArchFiles

### Network

```bash
# Start it.
systemctl start NetworkManager
# Make it auto-start on boot.
systemctl enable NetworkManager
```
