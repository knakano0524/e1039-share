# e1039-share

Yet another package to build up a set of external programs (like ROOT) for the E1039 software framework.

## Typical Usage

1. cd /usr/local/src
1. git clone git@github.com:E1039-Collaboration/e1039-share.git
1. ./e1039-share/script/install.sh /data2/e1039/share

Remarks:
- "/usr/local/src" is a build directory.  Any other directory is fine.  You better use a local (not network) directory for faster compilations.
- "/data2/e1039/share" is an install directory.  Any other directory is fine.
- When a system-wide (i.e. rpm) package is missing, "install.sh" auto-detects it and asks you to install it.  Then you should execute "install.sh" again.

## Usage with ROOT 5

You can use option "-5" of "install.sh" to select ROOT 5 instead of 6.
Below is an example;
```
./e1039-share/script/install.sh -5 /data2/e1039/share5
```

## Details about Software Installation

Each software package in e1039-share is installed via a corresponding subscript in "script/init/".  The contents of subscripts are rather simple.  You could modify them when encountering error.

### Rule of Subscirpts

- Assure "$DIR_BUILD" is set and use it as the build directory.
- Assure "$DIR_INST" is set and use it as the install directory.
- Return non-zero value on error.
- Return without action when the package is judged to be already installed.
- Be kept as simple as possible so that everyone can maintain.
