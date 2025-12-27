#!/bin/bash
set -e  # Выход при ошибке

REPO_URL="https://github.com/YuryShelukhin/virt6.git"
PROJECT_DIR="/opt/project"

# 1. Клонируем репозиторий
echo "Клонируем репозиторий..."
sudo rm -rf "$PROJECT_DIR"
sudo git clone "$REPO_URL" "$PROJECT_DIR"
cd "$PROJECT_DIR"

# 2. Запускаем проект
echo "Запускаем Docker Compose..."
sudo docker compose down 2>/dev/null || true
sudo docker compose up -d --build

echo "Готово! Проект запущен."