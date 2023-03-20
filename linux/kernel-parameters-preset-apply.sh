#!/bin/bash

# СКРИПТ ДЛЯ ПРИМЕНЕНИЯ ПАРАМЕТРОВ ЯДРА ИЗ ПРЕСЕТОВ В ФАЙЛЕ kernel-parameters-presets.yaml

# Путь к файлу с пресетами
PRESET_FILE="kernel-parameters-presets.yaml"

# Парсинг аргументов командной строки
while getopts "n:lp:" opt; do
  case ${opt} in
    n)
      # Применение пресета
      PRESET_NAME="$OPTARG"
      if ! grep -q "$PRESET_NAME" "$PRESET_FILE"; then
        echo "Error: preset '$PRESET_NAME' not found"
        exit 1
      fi
      PARAMS="$(awk "/^$PRESET_NAME:$/,/^$/{if (!/^$PRESET_NAME:$/ && !/^$/) print}" "$PRESET_FILE" | grep -vE '^$|#' | awk -F': ' '{print $1 "=" $2}' | sed -E 's/^[[:space:]]+//g')"
      echo "The following parameters will be applied:"
      echo "$PARAMS"
      read -rp "Do you want to apply these parameters? [y/N] " confirm
      if [[ "$confirm" =~ ^[yY]$ ]]; then
        sudo sysctl -w $PARAMS
      fi
      ;;
    l)
      # Список пресетов
      awk '/^[^#]/{print $1}' "$PRESET_FILE" | sed 's/://' | awk '{print "- " $0}'
      ;;
    p)
      # Вывод параметров пресета
      PRESET_NAME="$OPTARG"
      if ! grep -q "$PRESET_NAME" "$PRESET_FILE"; then
        echo "Error: preset '$PRESET_NAME' not found"
        exit 1
      fi
      PARAMS="$(awk "/^$PRESET_NAME:$/,/^$/{if (!/^$PRESET_NAME:$/ && !/^$/) print}" "$PRESET_FILE" | grep -vE '^$|#' | awk -F': ' '{print $1 "=" $2}' | sed -E 's/^[[:space:]]+//g')"
      echo "The parameters for the '$PRESET_NAME' preset are:"
      echo "$PARAMS"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Если аргументы не были переданы, выводим справку
if [ $OPTIND -eq 1 ]; then
  echo "Usage: $0 [-n PRESET_NAME] [-l] [-p PRESET_NAME]"
  echo "  -n PRESET_NAME    apply the specified preset"
  echo "  -l                list all available presets"
  echo "  -p PRESET_NAME    display parameters for the specified preset"
fi
