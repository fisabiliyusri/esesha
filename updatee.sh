#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo "Memperbarui..."
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/Afdhan/esesha/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/Afdhan/esesha/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Afdhan/esesha/main/trial.sh"
wget -O change-port "https://raw.githubusercontent.com/Afdhan/esesha/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Afdhan/esesha/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Afdhan/esesha/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/Afdhan/esesha/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/Afdhan/esesha/main/xp.sh"
wget -O limit-speed "https://raw.githubusercontent.com/Afdhan/esesha/main/limit-speed.sh"
wget -O add-sstp "https://raw.githubusercontent.com/Afdhan/esesha/main/add-sstp.sh"
wget -O add-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/add-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Script Berhasil Di Restart"
echo " Sekarang Kamu Bisa Ubah Port Di Beberapa Layanan VPN"
echo " Reboot 5 Detik"
sleep 5
rm -f update.sh
reboot
