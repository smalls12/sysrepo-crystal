[![Build Status](https://travis-ci.com/smalls12/sysrepo-crystal.svg?token=tr4L2muJGExjHv772Sdt&branch=master)](https://travis-ci.com/smalls12/sysrepo-crystal)

# sysrepo-crystal

These are crystal bindings for the [sysrepo](https://github.com/sysrepo/sysrepo.git) library.

These bindings are compatible with the master branch of sysrepo v1.0 and above ( legacy is not supported ).

The bindings themselves are heavily based on the CPP bindings located in the same repo.

Can be used in conjunction with the [libyang-crystal](https://github.com/smalls12/libyang-crystal.git) bindings for the [libyang](https://github.com/CESNET/libyang.git) library.

## libsysrepo-crystal

As part of the bindings, a small shim will be generated upon install, `libsysrepo-crystal.a`.

This shim is used to facilitate integration with the sysrepo API.

The sysrepo API requires an opaque pointer to be created on the application side and provided to the sysrepo API
where it will be populated.

I could not find a to create a null opaque pointer within crystal (application side ) and
then provide it to the sysrepo API via the crystal binding methods that worked.

Therefore the shim was created to extend the sysrepo API by providing C functions that return null opaque pointers for
various sysrepo types.

## Prerequisites

sysrepo will need to be installed on your system, which itself requires libyang to be installed.

For installation instructions, please see their respective repos linked above.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     sysrepo-crystal:
       github: smalls12/sysrepo-crystal
   ```

2. Run `shards install`

## Usage

```crystal
require "sysrepo-crystal"
```

Examples can be found in the [sysrepo-crystal-examples](https://github.com/smalls12/sysrepo-crystal-examples.git) repo:

## Contributing

1. Fork it (<https://github.com/your-github-user/sysrepo-crystal/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [smalls12](https://github.com/smalls12) - creator and maintainer
