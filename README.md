# Pharo-OS-Unix

## Introduction 

This is a Pharo package written by Torsten Bergmann (astares) to get better support for Unix systems into Pharo.

[![Unit Tests](https://github.com/astares/Pharo-OS-Unix/workflows/Build/badge.svg?branch=master)](https://github.com/astares/Pharo-OS-Unix/actions?query=workflow%3Build)
[![Coverage Status](https://codecov.io/github/astares/Pharo-OS-Unix/coverage.svg?branch=master)](https://codecov.io/gh/astares/Pharo-OS-Unix/branch/master)

[![Pharo 7](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 8](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 9](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)

# Quick Start
## Installation

```Smalltalk
Metacello new 
	repository: 'github://astares/Pharo-OS-Unix/src';
	baseline: 'OSUnix';
	load
```


The package can be loaded from Pharo catalog. Just open the Catalog and search for "OSUnix". It is useful to use this package with Pharo on Unix including Linux derivates and Mac.

## Documentation

After loading the package you have several classes that you can use like **UNIXEnvironment** or **UNIXProcess** 

### Working with external UNIX commands

With the help of the **UNIXProcess** class you have access to external commands. For example inspect the result of the following command.

```Smalltalk
UNIXProcess resultOfCommand: 'ls'
```

Sometimes it is useful to run a command with super user rights. So while

```Smalltalk
UNIXProcess resultOfCommand: 'whoami'
```
  
would run with the regular user rights of the Pharo process owner (and return the current user) you can use
the method *#resultOfCommand:whenRunningAsRootUsingPassword:* to run a process with administrative rights:

```Smalltalk
UNIXProcess resultOfCommand: 'whoami' whenRunningAsRootUsingPassword: 'myrootpassword'
```

This should give you the 'root'.

### Working with UNIX user management

Within the *OS-Unix-Environment* package you will find classes to help with the Unix security.

```Smalltalk
UNIXUser allUsers
```  

or

```Smalltalk
UNIXGroup allGroups
```

### Browsing UNIX man pages in Pharo

When the package is loaded it is possible to open the Pharo spotter and enter a unix command. If there is a UNIX man page then Pharo will display it and you can directly show it within the Pharo environment.

# History

Migrated from http://smalltalkhub.com/#!/~OS/OS-Unix
