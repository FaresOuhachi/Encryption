#!/bin/bash

send_tube="/home/fares/Desktop/Activités/send.fifo"

receive_tube="/home/fares/Desktop/Activités/receive.fifo"

check= $(cat $send_tube)

cat > fichier_recu < $send_tube

value=$(openssl dgst -sha256 -hmac $key  fichier_recu | cut -d ' ' -f 2)

if [ $check = $value ]; then
    
    echo "OK" > $receive_tube
    echo "Le fichier a été reçu avec succès et sa somme de contrôle est correcte."
else
    echo "Erreur : la somme de contrôle du fichier reçu est différente de celle du fichier envoyé."
fi


rm -f $send_tube $receive_tube

