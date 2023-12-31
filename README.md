# Archfiles

## Informations

Actually, this repo is used to test some packages and theirs configs, 
In fact, as it's very easy to add or remove new configurations with STOW, 
there are a large number of configurations for packages that can't be installed.
it's a bad idea to stow all repository.

for awesomeWM you need to take **awesome-git** last master release.

this list below is the main packages for this dotfiles:

```bash
stow awesome kitty fish ranger pictures x  
```
### Config todo

- [ ] awesome
- [ ] rofi
- [ ] LazyVim - nvim
- [x] kitty
- [x] ranger
- [x] fish

## Installing

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

### Network
```bash
# Start it.
systemctl start NetworkManager
# Make it auto-start on boot.
systemctl enable NetworkManager
```
