# `nix-evm` - Generate [EVM signature] for Nix paths/closures

This tool automatically creates a portable [EVM signature] for Nix store paths, and optionally dumps them to a file.

The output file format is a recursive `getfattr` dump, piped through `gzip`. You can restore the dump on another system with the following command:

```sh
zcat xattrs.txt.gz | setfattr --restore=-
```

[EVM signature]: https://ima-doc.readthedocs.io/en/latest/ima-concepts.html#evm-signature
