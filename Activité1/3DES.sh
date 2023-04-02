
  openssl enc -des-ede3 -in $file -out ${file}.enc -pass pass:fares
  
  openssl enc -des-ede3-cbc -in $file -out ${file}.enc -pass pass:fares
#!/bin/bash

myFiles=()

for file in $1/file_*M
do
  myFiles+=($file)
done

echo "Encrypting/Decrypting with 3DES CBC"
echo "File,Time(s)" > 3DES_CBC_enc.csv
echo "File,Time(s)" > 3DES_CBC_dec.csv

for file in ${myFiles[@]}
do
  start=$(date +%s.%N)
  openssl enc -aes-256-cbc -in $file -out ${file}.enc -pass pass:OuhachiFaresMohamedAmine
  end=$(date +%s.%N)
  enc_time_cbc=$(echo "$end - $start" | bc)
  echo ${file},$enc_time_cbc >> 3DES_CBC_enc.csv

  start=$(date +%s.%N)
  openssl enc -d -des-ede3-cbc -in $file -out ${file}_dec -pass pass:OuhachiFaresMohamedAmine
  end=$(date +%s.%N)
  dec_time_cbc=$(echo "$end - $start" | bc)
  echo ${file},$dec_time_cbc >> 3DES_CBC_dec.csv

  rm ${file}.enc
  rm ${file}_dec
done

echo "Encrypting/Decrypting with 3DES ECB"
echo "File,Time(s)" > 3DES_ECB_enc.csv
echo "File,Time(s)" > 3DES_ECB_dec.csv

for file in ${myFiles[@]}
do
  start=$(date +%s.%N)
  openssl enc -des-ede3 -in $file -out ${file}.enc -pass pass:OuhachiFaresMohamedAmine
  end=$(date +%s.%N)
  enc_time_ecb=$(echo "$end - $start" | bc)
  echo ${file},$enc_time_ecb >> 3DES_ECB_enc.csv

  start=$(date +%s.%N)
  openssl enc -d -des-ede3 -in $file.enc -out ${file}_dec -pass pass:OuhachiFaresMohamedAmine
  end=$(date +%s.%N)
  dec_time_ecb=$(echo "$end - $start" | bc)
  echo ${file},$dec_time_ecb >> 3DES_ECB_dec.csv

  rm ${file}.enc
  rm ${file}_dec
done

