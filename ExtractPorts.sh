#!/bin/bash

# Nombre del archivo grepeable de nmap
archivo="$1"

# Verificar si se proporcionó un archivo como argumento
if [ -z "$archivo" ]; then
    echo "Uso: $0 archivo_nmap_grepeable"
    exit 1
fi

# Extraer los números de puerto del archivo grepeable de nmap
puertos=$(grep -oP '\d+(?=/open/tcp)' "$archivo" | tr '\n' ',' | sed 's/,$//')

# Verificar si se encontraron puertos
if [ -z "$puertos" ]; then
    echo "No se encontraron puertos abiertos en el archivo proporcionado."
    exit 1
fi

# Copiar los puertos al portapapeles
echo -n "$puertos" | xclip -sel clip

# Mostrar mensaje de puertos copiados y la lista de puertos
echo "[+] Puertos copiados en el portapapeles."
echo
echo "$puertos"

exit 0
