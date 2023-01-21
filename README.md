# dotfiles

My very personal development environment setup. I refuse to work without it.

## Setup

On macOS, use with [strap](https://github.com/MikeMcQuaid/strap).

On other Unix-like systems, clone with `git` to the `.dotfiles` directory.

### SSH

```console
git clone git@github.com:bartekpacia/dotfiles.git ~/.dotfiles
```

### HTTPS

```console
git clone https://github.com/bartekpacia/dotfiles.git ~/.dotfiles
```

## File descriptions

- `ssh/config` SSH config. Automatically includes all files starting matching
  `ssh/config_*`.

- `script/setup_dock` Sets up my Dock the way I want.

- `script/disable_chime` Disables the dumb macOS's startup chime.

- `files/com.googlecode.iterm2.plist` iTerm2 global settings.

- `files/bartek.itermkeymap` iTerm2 global keybindings.

- `files/settings.json` Windows Terminal global settings.

- `local` All scripts in this folder are gitignored and automatically sourced by
  zshrc.

  Example use case:

  - startup shell scripts from JetBrains Toolbox app
