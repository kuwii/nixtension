# Nixt

Nixt is a NixOS channel for extension, which

- Simplifies configurations by aggregating them.
- Add extra packages which is not available in official channel yet.

The channel is built based on NixOS unstable channel.

## Installation

Add Nixt channel and update

```
sudo nix-channel --add https://github.com/kuwii/nixt/archive/main.tar.gz nixt
sudo nix-channel --update
```

After that, update NixOS configuration, importing the channel:

```
imports = [
  ... # your existing imports
  <nixt>
]
```

Then the Nixt configuration and packages will be available.
