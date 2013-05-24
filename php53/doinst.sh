# if [ ! -r etc/httpd/mod_php.conf ]; then
#   cp -a etc/httpd/mod_php.conf.example etc/httpd/mod_php.conf
# elif [ "`cat etc/httpd/mod_php.conf 2> /dev/null`" = "" ]; then
#   cp -a etc/httpd/mod_php.conf.example etc/httpd/mod_php.conf
# fi
if [ ! -r etc/php53/php.ini ]; then
   cp -a etc/php53/php.ini-production etc/php53/php.ini
fi
