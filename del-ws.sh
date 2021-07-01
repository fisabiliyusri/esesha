#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/stopwibu/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "Anda Tidak Memiliki Klien!"
		exit 1
	fi

	clear
	echo ""
	echo " Pilih Klien Yang Ingin Diperbarui"
	echo " Klik CTRL+C untuk return"
	echo " ===============================" | lolcat
	echo "     No User Expired  "
	grep -E "^### " "/etc/stopwibu/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/stopwibu/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/stopwibu/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/stopwibu/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/stopwibu/none.json
rm -f /etc/stopwibu/$user-tls.json /etc/stopwibu/$user-none.json
systemctl restart v2ray
systemctl restart v2ray@none
clear
echo " Akun V2RAY Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $user"
echo " Exp  : $exp"
echo " ==========================" | lolcat
