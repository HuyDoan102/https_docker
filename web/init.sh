#!/bin/sh

DOCUMENT_ROOT="/var/www/html/rice_store"

echo $DOCUMENT_ROOT

# Change Mode for Rice_Store
chmod -R 777 "$DOCUMENT_ROOT/storage/logs/"
chmod -R 777 "$DOCUMENT_ROOT/storage/framework/"
chmod -R 777 "$DOCUMENT_ROOT/bootstrap"

/my_init
