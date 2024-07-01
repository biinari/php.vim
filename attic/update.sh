#!/bin/sh

cat - > php.vim

test -e update.out && rm update.out

for version in 5.6 7.3 7.4 8.0 8.1 8.2; do
    php$version 10-collect.php 1>>update.out
done

cat update.out | \
    php8.2 20-generate.php | \
    php8.2 30-update.php php.vim
