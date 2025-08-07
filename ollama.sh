#!/bin/bash

# Función para instalar Ollama
instalar_ollama() {
    echo "Instalando Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
}

# Función para desinstalar Ollama
desinstalar_ollama() {
    echo "Desinstalando Ollama..."
    sudo systemctl stop ollama
    sudo rm -rf /usr/local/bin/ollama
    sudo rm -rf ~/.ollama
    sudo rm -rf /var/lib/ollama
    echo "Ollama ha sido eliminado completamente."
}

# Función para mostrar el menú de modelos
elegir_modelo() {
    echo "¿Qué modelo quieres descargar y correr?"
    echo "1. llama3"
    echo "2. mistral"
    echo "3. codellama"
    echo "4. phi3"
    echo "5. Personalizado"
    read -p "Elige una opción (1-5): " opcion

    case $opcion in
        1) modelo="llama3" ;;
        2) modelo="mistral" ;;
        3) modelo="codellama" ;;
        4) modelo="phi3" ;;
        5)
            read -p "Escribe el nombre del modelo personalizado (por ejemplo: llama2:7b): " modelo
            ;;
        *)
            echo "Opción no válida"
            exit 1
            ;;
    esac

    echo "Descargando y ejecutando el modelo: $modelo"
    ollama run "$modelo"
}

# Menú principal
echo "------ Script para administrar Ollama ------"
echo "1. Instalar Ollama"
echo "2. Elegir modelo e iniciar"
echo "3. Desinstalar Ollama"
read -p "Elige una opción (1-3): " eleccion

case $eleccion in
    1) instalar_ollama ;;
    2) elegir_modelo ;;
    3) desinstalar_ollama ;;
    *) echo "Opción inválida" ;;
esac
