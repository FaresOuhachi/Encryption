#!/bin/bash

myFiles=()

for file in $1/file_*M
do
  myFiles+=($file)
done

echo "Encrypting/Decrypting with AES 256 CBC"
echo "File,Encryption Time(s)" > AES_CBC_enc.csv
echo "File,Decryption Time(s)" > AES_CBC_dec.csv

for file in ${myFiles[@]}
do
  start=$(date +%s.%N)
  openssl enc -aes-256-cbc -in $file -out ${file}.enc -pass pass:OuhachiFaresMohamedAmine
  end=$(date +%s.%N)
  enc_time_cbc=$(echo "$end - $start" | bc)
  echo ${file},$enc_time_cbc >> AES_CBC_enc.csv
  
  start=$(date +%s.%N)
  openssl enc -aes-256-cbc -d -in ${file}.enc -out ${file}_dec -pass pass:fares
  end=$(date +%s.%N)
  dec_time_cbc=$(echo "$end - $start" | bc)
  echo ${file},$dec_time_cbc >> AES_CBC_dec.csv
  
  rm ${file}.enc
  rm ${file}_dec
done

echo "Encrypting/Decrypting with AES 256 ECB"
echo "File,Time(s)" > AES_ECB_enc.csv
echo "File,Time(s)" > AES_ECB_dec.csv

for file in ${myFiles[@]}
do
  start=$(date +%s.%N)
  openssl enc -aes-256-ecb -in $file -out ${file}.enc -pass pass:OuhachiFaresMohamedAmine
  end=$(date +%s.%N)
  enc_time_ecb=$(echo "$end - $start" | bc)
  echo ${file},$enc_time_ecb >> AES_ECB_enc.csv
  
  start=$(date +%s.%N)
  openssl enc -aes-256-ecb -d -in ${file}.enc -out ${file}_dec -pass pass:OuhachiFaresMohamedAMine
  end=$(date +%s.%N)
  dec_time_ecb=$(echo "$end - $start" | bc)
  echo ${file},$dec_time_ecb >> AES_ECB_dec.csv
  
  rm ${file}.enc
  rm ${file}_dec
done


