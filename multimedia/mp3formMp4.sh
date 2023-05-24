#!/bin/bash

# Путь к папке с видеофайлами
dir="."

# Перебираем все видеофайлы в указанной папке
for file in "$dir"/*.mp4; do
  # Получаем базовое имя файла без расширения
  base=$(basename "$file" .mp4)
  # Используем ffmpeg для извлечения аудиодорожки и конвертации ее в mp3
  ffmpeg -i "$file" -vn -acodec libmp3lame "$dir/$base.mp3"
done

