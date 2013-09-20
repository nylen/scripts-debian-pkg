# scripts-debian-pkg

This package provides several scripts that assist in working with
Debian/Ubuntu/Linux Mint packages using apt-get and related tools.

The scripts are packaged using `npm` for convenience.

## Installation

    sudo npm install -g --unsafe-perm scripts-debian-pkg

The `--unsafe-perm` is needed so that `npm` will run the simple
`scripts/install.sh` script as root.  Similarly, to uninstall:

    sudo npm rm -g --unsafe-perm scripts-debian-pkg

## Scripts

### pkg

`pkg` is a wrapper for `apt-get` and will automatically `sudo` if necessary.

    # To install package abcde:
    pkg abcde
    pkg install abcde

    # To download source code:
    pkg source abcde

    # Any other apt-get command should work here too:
    pkg remove abcde

Also, `pkg reinstall` is a shortcut for `apt-get install --reinstall`.

### pkg-info

`pkg-info` shows some information about the given package(s), including
selected fields from `apt-cache` and whether or not the package is installed.

    # Show basic information
    pkg-info abcde

    # Include package dependencies
    pkg-info -d abcde
