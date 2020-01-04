# PHP

PHP is the command-line interface for PHP. The main focus of CLI Server API is for developing shell applications with PHP. There are quite a few differences between the CLI SAPI and other SAPIs. It is worth mentioning that PHP CLI and PHP FPM are different SAPIs although they do share many of the same behaviors.

## Current Tag:

- PHP (CLI): **`7.4.1`**

## Add shortcut function via .bashrc or .zshrc

```bash
php() { docker run --rm -it -v "$(pwd)":/src -w /src  pam79/php "$@"; }
```
&nbsp;

Source file to apply changes
```bash
$ source ~/.bashrc
```
&nbsp;

## Or just export it with a wrapper script as a global binary
```bash
$ mkdir -p scripts && cd scripts
$ vim php.sh
```
&nbsp;

Add the following content into `php.sh` file

```bash
#!/bin/sh

# A wrapper script for invoking php cli with docker
# Put this script in $PATH as `php`

VERSION="latest"

exec docker run -it --rm -v "$PWD":/src -w /src "pam79/php:$VERSION" "$@"
```
&nbsp;

Install and verify if the script was installed

```bash
$ sudo install -m 0755 php.sh /usr/local/bin/php
$ whereis php
```
&nbsp;

## The shortcut function or binary can be used as follows:
```bash
$ php --version
$ php -a
```
&nbsp;

Checkout PHP CLI's <a href="https://www.php.net/manual/en/features.commandline.php" target="_blank">**official documentation**</a> for more details.
