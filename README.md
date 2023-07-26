# Nixtension

Nixtension is a NixOS channel for extension, which

- Simplifies configurations by aggregating them.
- Add extra packages which is not available in official channel yet.

The channel is built based on NixOS unstable channel.

## Installation

### NixOS

Add Nixtension and Home Manager channel and update

```
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --add https://github.com/kuwii/nixtension/archive/main.tar.gz nixtension
sudo nix-channel --update
```

After that, update NixOS configuration, importing the channel:

```
imports = [
  ... # your existing imports
  <nixtension>
]
```

Then the Nixtension configuration and packages will be available.

### Home Manager

Add Nixtension channel and update

```
nix-channel --add https://github.com/kuwii/nixtension/archive/main.tar.gz nixtension
nix-channel --update
```

After that, update configuration at `~/.config/home-manager/home.nix`, importing the channel:

```
imports = [
  ... # your existing imports
  <nixtension/home.nix>
]
```
