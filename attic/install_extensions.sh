PHP_VERSION=$1

set -ex

apt-get install -y \
  "php${PHP_VERSION}-cli" \
  "php${PHP_VERSION}-bcmath" \
  "php${PHP_VERSION}-bz2" \
  "php${PHP_VERSION}-curl" \
  "php${PHP_VERSION}-dom" \
  "php${PHP_VERSION}-gd" \
  "php${PHP_VERSION}-gettext" \
  "php${PHP_VERSION}-iconv" \
  "php${PHP_VERSION}-mbstring" \
  "php${PHP_VERSION}-mysql" \
  "php${PHP_VERSION}-mysqli" \
  "php${PHP_VERSION}-pdo" \
  "php${PHP_VERSION}-pgsql" \
  "php${PHP_VERSION}-phar" \
  "php${PHP_VERSION}-simplexml" \
  "php${PHP_VERSION}-soap" \
  "php${PHP_VERSION}-sockets" \
  "php${PHP_VERSION}-sqlite3" \
  "php${PHP_VERSION}-tokenizer" \
  "php${PHP_VERSION}-xml" \
  "php${PHP_VERSION}-xmlreader" \
  "php${PHP_VERSION}-xmlwriter" \
  "php${PHP_VERSION}-zip"

case $PHP_VERSION in
  5.6 | 7.0 | 7.1)
    apt-get install -y "php${PHP_VERSION}-mcrypt"
    ;;
esac

case $PHP_VERSION in
  5.6 | 7.0 | 7.1 | 7.2 | 7.3)
    apt-get install -y "php${PHP_VERSION}-wddx"
    ;;
esac

case $PHP_VERSION in
  5.* | 7.*)
    apt-get install -y "php${PHP_VERSION}-json"
    ;;
esac
