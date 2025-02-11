#!/bin/bash

# Aguarda o banco de dados estar pronto
until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    echo "Aguardando o MySQL..."
    sleep 2
done

# Configura os permalinks no modo "Nome do Post"
wp option update permalink_structure '/%postname%/' --allow-root
wp rewrite flush --allow-root

echo "✅ Permalinks configurados para 'Nome do Post'"
