#!/bin/sh

cat - > php.vim

test -e update.out && rm update.out

for version in 5.6 7.0 7.1 7.2 7.3 7.4; do
    php$version 10-collect.php 1>>update.out
done

cat update.out | \
    php7.4 20-generate.php | \
    php7.4 30-update.php php.vim
