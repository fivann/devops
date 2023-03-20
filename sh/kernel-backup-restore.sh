#!/bin/bash

# Получить список текущих настроек ядра и записать их в файл
function backup {
    local backup_file=$(date +'%Y-%m-%d')-kernel-parameters-backup.ini
    echo "Backing up current kernel parameters to $backup_file"
    sysctl -a > "$backup_file"
}

# Восстановление параметров ядра из файла бэкапа
function restore {
    # Получить список бэкапов и вывести их на экран
    local backup_files=$(ls -t | grep 'kernel-parameters-backup.ini')
    local i=1
    for file in $backup_files; do
        echo "$i) $file"
        ((i++))
    done
    echo ""
    # Попросить пользователя выбрать файл бэкапа по номеру
    read -p "Enter the number of the backup file you want to restore: " num
    local selected_file=$(echo "$backup_files" | sed -n "${num}p")
    if [ -z "$selected_file" ]; then
        echo "Invalid backup file number"
        exit 1
    fi
    echo "Selected backup file: $selected_file"
    # Подтверждение восстановления параметров
    read -p "Do you want to restore these parameters? [y/N] " confirm
    if [ "$confirm" == "y" ]; then
        # Применение бэкапа
        sysctl -p "$selected_file"
    else
        echo "Restore cancelled"
        exit 0
    fi
}

# Вывод доступных параметров скрипта
function usage {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -b, --backup        Backup current kernel parameters to a file"
    echo "  -r, --restore       Restore kernel parameters from a backup file"
    echo "  -l, --list-backups  List available backup files"
    echo "  -h, --help          Display this help and exit"
    exit 1
}

# Проверка количества аргументов
if [ $# -eq 0 ]; then
    usage
fi

# Обработка аргументов командной строки
while [[ $# -gt 0 ]]; do
    case $1 in
        -b|--backup)
            backup
            shift
            ;;
        -r|--restore)
            restore
            shift
            ;;
        -l|--list-backups)
            ls -t | grep 'kernel-parameters-backup.ini'
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Invalid option: $1"
            usage
            ;;
    esac
done
