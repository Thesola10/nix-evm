# `nix-evm` - Generate EVM signatures for Nix paths/closures

This tool automatically creates portable EVM signatures for Nix store paths, and optionally dumps them to a file.

The output file format is a recursive `getfattr` dump, piped through `gzip`. You can restore the dump on another system with the following command:

```sh
zcat xattrs.txt.gz | setfattr --restore=-
```
