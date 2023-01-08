#!/bin/bash

# Path'i tanımla
path="/home/ubuntu/bsm"

# Geçmiş olayları tutacak dosya adını tanımla
log_file="kayitlar.txt"

# İzlenecek olayları tanımla
events="CREATE,DELETE,MODIFY,MOVE"

# İzlemeyi başlat
inotifywait -m -e "$events" --format '%w%f %e' "$path" |
    while read file event; do
        # Olayları log dosyasına ekle
        echo "$(date): $file $event" >> "$log_file"
    done

