find . -type f -exec chmod 644 {} \; && 
find . -type d -exec chmod 755 {} \; && 
find ./pub/media -type d -exec chmod 777 {} \; && 
find ./pub/static -type d -exec chmod 777 {} \; &&
chmod 777 ./app/etc && 
chmod 644 ./app/etc/*.xml

rm -rf var/cache/* var/view_preprocessed/* generated/* pub/static/*
chmod -R 0777 var/ pub/ generated/
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento cache:flush
php bin/magento indexer:reindex
chmod -R 0777 var/ pub/ generated/
