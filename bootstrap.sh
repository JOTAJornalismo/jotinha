#!/bin/bash

# Caminho para os temas no contêiner
THEMES_DIR="/var/www/html/wp-content/themes"

# Tema que deve ser preservado
EXCLUDE_THEME="jotinha"

# Verifica se o diretório de temas existe
if [ -d "$THEMES_DIR" ]; then
    echo "📂 Listando temas instalados..."
    
    # Percorre os diretórios dentro da pasta de temas
    for theme in "$THEMES_DIR"/*; do
        if [ -d "$theme" ]; then  # Garante que é um diretório
            theme_name=$(basename "$theme")

            # Remove o tema se não for o "jotinha"
            if [ "$theme_name" != "$EXCLUDE_THEME" ]; then
                echo "🗑️  Removendo tema: $theme_name"
                rm -rf "$theme"
            else
                echo "✅ Mantendo o tema: $theme_name"
            fi
        fi
    done

    echo "🎉 Todos os temas foram removidos, exceto '$EXCLUDE_THEME'."
else
    echo "❌ Diretório de temas não encontrado!"
fi
