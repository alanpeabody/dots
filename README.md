# Agilion Dots

Shared "dotfiles" for use at Agilion

## Installation

Clone this repository to your home directory and run install script.

```sh
cd ~
git clone git@github.com:AgilionApps/dots.git
cd dots
./install.sh
```

## Updating

As the standard settings change you can just pull down the latest version of dots.

```sh
cd ~/dots
git pull origin master
```

## Vim

### Base Settings

This is a very minimally customized vim installation, relying on the user to
customize their own colors, key maps, etc.

See vim/vimrc for the standard tweaks.


### NeoBundle

Vim is configured with NeoBundle, a plugin downloader and manager for Vim.
The standard, shared plugins are defined for download in vim/vimrc.bundle.
Each line simply refers to the github username/project of the plugin.

After adding a new package you can just run `:NeoBundleUpdate' in vim to 
install it.

### Customization

To add plugins for your use only, add them to the file `~/.vimrc.bundle.local`.

Any other customizations should go in `~/.vimrc.local`
