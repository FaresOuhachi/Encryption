#!/bin/bash


fichier="/home/fares/Desktop/Activités/message.txt" 

send_tube="/home/fares/Desktop/Activités/send.fifo"

key=$(openssl rand -hex 16)

check=$(openssl dgst -sha256 -hmac $key $fichier | cut -d ' ' -f 2)

echo $check > $send_tube

cat $fichier > $send_tube

confirmation=$(cat $send_tube)

if [ "$confirmation" = "OK" ]; then
    echo "Le fichier a été envoyé avec succès et sa somme de contrôle est correcte."
else
    echo "Erreur : le destinataire n'a pas confirmé la réception du fichier."
fi

