#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
figlet -f small Panel Trojan | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Buat Akun Trojan"
echo -e "     [2]  Hapus Akun Trojan"
echo -e "     [3]  Perbarui Akun Trojan"
echo -e "     [4]  Cek Login Trojan"
echo -e "     [x]  Keluar"
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-4 / x] :  " port
echo -e ""
case $port in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 0.5
trj
;;
esac
