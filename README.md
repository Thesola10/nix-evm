# `nix-evm` - Generate [EVM signature] for Nix paths/closures

This tool automatically creates a portable [EVM signature] for Nix store paths, and optionally dumps them to a file.

The output file format is a recursive `getfattr` dump, piped through `gzip`. You can restore the dump on another system with the following command:

```sh
zcat xattrs.txt.gz | setfattr --restore=-
```

## But why?

By leveraging the Linux kernel's [IMA/EVM] security infrastructure, one can establish and enforce a trusted computing environment, in a way that is complementary to Secure Boot. This can already be achieved with `dm-verity`, but this approach prevents us from incrementally upgrading a NixOS system.

`nix-evm` is designed with a specific use case in mind, where the user may wish to decouple the signing process from production hardware. As `nix-evm` generates a set of portable [IMA/EVM] extended attributes, it can "certify" a NixOS closure to run on a separate machine, where the attributes set can be applied while maintaining a chain of trust.

In order to be effective, `nix-evm` needs to be paired with a robust Secure Boot policy, such as a [unified kernel image].

[EVM signature]: https://ima-doc.readthedocs.io/en/latest/ima-concepts.html#evm-signature
[IMA/EVM]: https://ima-doc.readthedocs.io/en/latest/ima-concepts.html
[unified kernel image]: https://uapi-group.org/specifications/specs/unified_kernel_image/
