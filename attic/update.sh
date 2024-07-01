#!/bin/sh

cat - > php.vim

test -e update.out && rm update.out

for version in 5.6 7.3 7.4 8.0 8.1 8.2 8.3; do
    php$version 10-collect.php 1>>update.out
done

cat update.out | \
    php8.3 20-generate.php | \
    php8.3 30-update.php php.vim
