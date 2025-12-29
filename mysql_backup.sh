#!/bin/bash

BACKUP_DIR="/opt/backup"
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="${BACKUP_DIR}/backup_$(date +%H%M).sql"

docker exec mysql-db mysqldump -u root -pYtReWq4321 virtd > "$BACKUP_FILE"

if [ -s "$BACKUP_FILE" ]; then
    echo "Бэкап создан: $BACKUP_FILE"
    echo "   Размер: $(du -h "$BACKUP_FILE" | cut -f1)"
    chown yury:yury "$BACKUP_FILE"
else
    echo "Ошибка при создании бэкапа"
    exit 1
fi