#!/bin/bash

dialog --backtitle "DOCK-PI3_Roboticsinstall ,Multi-instalador de sistemas y utilidades" \
--title "Instalador de sistemas y utilidades rpi 3b b+(by Mabedeep - The MasOS TEAM)" \
--msgbox "${infobox}" 35 110


function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Que accion te gustaria realizar?" 25 75 20 \
            100 "-------------- Para RPI ----------------" \
			1 "Rpi Instalar MasOS-Setup script" \
			2 "Rpi Instalar EmulOS-Setup script" \
			3 "Rpi Instalar PiVPN" \
            4 "Rpi Instalar PiHOLE" \
			5 "Rpi Instalar WebMin" \
			6 "Rpi Instalar Retroarch 1.7.7" \
			7 "Rpi Instalar EmulationStation" \
			8 "Rpi Instalar AttracMode" \
			9 "Rpi Instalar VsFTPd" \
			2>&1 > /dev/tty)

        case "$choice" in
			100) separador_menu  ;;
            1) masos_instalador  ;;
            2) emulos_instalador  ;;
			3) pivpn_instalador  ;;
            4) pihole_instalador ;;
			5) webmin_instalador ;;
			6) retroarch_instalador ;;
			7) emulationstation_instalador ;;
			8) attractmode_instalador ;;
			9) vsftpd_instalador ;;
			*)  break ;;
        esac
    done
}


function separador_menu() {                                          
dialog --infobox "... Separador para el menu, sin funcion ..." 30 55 ; sleep 3
}

function masos_instalador() {                                          
dialog --infobox "... Script instalador de MasOS en su version mas reciente ...\n\n" 30 55 ; sleep 3
sudo apt-get update
sudo apt-get install -y git
cd
git clone --depth=1 https://github.com/DOCK-PI3/MasOS-Setup.git
sudo chmod -R +x MasOS-Setup/
cd MasOS-Setup
sudo ./masos_setup.sh
}

function emulos_instalador() {                                          
dialog --infobox "... Script instalador de EmulOS en su version mas reciente ...\n\n" 30 55 ; sleep 3
sudo apt-get update
sudo apt-get install -y git
cd
git clone --depth=1 https://github.com/Moriggy/EmulOS-Setup.git
cd EmulOS-Setup
sudo ./emulos_setup.sh
}

function pivpn_instalador() {                                          
dialog --infobox "... Script instalador de PiVPN en su version mas reciente ..." 30 55 ; sleep 3
curl -L https://install.pivpn.io | bash
}

function pihole_instalador() {                                          
dialog --infobox "... Script instalador de Pi-Hole en su version mas reciente ..." 30 55 ; sleep 3
cd && wget -O basic-install.sh https://install.pi-hole.net
sudo bash basic-install.sh
}

function webmin_instalador() {                                          
dialog --infobox "... Script instalador de WebMin en su version 1.920 ..." 30 55 ; sleep 3
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.920_all.deb
sudo dpkg --install webmin_1.920_all.deb
dialog --infobox "... La instalación se ejecuto automáticamente en /usr/share/webmin , el nombre de usuario de administración configurado como root y la contraseña a su contraseña de root actual.\n Ahora debería poder iniciar sesión en Webmin en la URL http://localhost:10000/ \n O si accede a él de forma remota, reemplace localhost con la dirección IP de su sistema. ..." 30 55 ; sleep 10
}

function retroarch_instalador() {                                          
dialog --infobox "... Script instalador de Retroarch en su version 1.7.7 ..." 30 55 ; sleep 3
sudo apt update
dialog --infobox "... Iniciando actualizacion del sistema y sus paquetes ,comentado dmomento..." 30 55 ; sleep 2
# sudo apt upgrade -y
dialog --infobox "... Elija idioma para su teclado ..." 30 55 ; sleep 5
sudo dpkg-reconfigure keyboard-configuration
dialog --infobox "... Seleccione con espacio es_ES.UTF-8 si vive en España y pulse enter..." 30 55 ; sleep 5
sudo dpkg-reconfigure locales
dialog --infobox "... Elija su zona horaria ..." 30 55 ; sleep 5
sudo dpkg-reconfigure tzdata
dialog --infobox "... Compilar e instalar RetroArch ,iniciando espere! ..." 30 55 ; sleep 5
rpSwap on 128
sudo apt install -y build-essential libasound2-dev libudev-dev
cd && curl -LO 'https://github.com/libretro/RetroArch/archive/v1.7.7.tar.gz' && tar -zxvf v1.7.7.tar.gz
cd RetroArch-1.7.7
# CFLAGS='-mfpu=neon' ./configure --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx --disable-opengl1
CFLAGS='-march=armv8-a+crc -mtune=cortex-a53 -O2 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations' ./configure --disable-ffmpeg --disable-networking --disable-sdl --disable-sdl2 --disable-x11 --disable-freetype --disable-debug --disable-opengl1 --disable-opengl_core --enable-opengles --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx
make -j2
sudo make -j2 install
rpSwap off
# cd && sudo rm -R RetroArch-1.7.7/
dialog --infobox "... RetroArch instalado correctamente ,Reiniciando el sistema en 7seg espere! ..." 30 55 ; sleep 7
}

function emulationstation_instalador() {                                          
dialog --infobox "... Script instalador de Emulationstation en su version mas reciente ..." 30 55 ; sleep 3
sudo apt-get update
# sudo apt-get upgrade
# sudo rpi-update
rpSwap on 32
sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-date-time-dev libboost-locale-dev libfreeimage-dev libfreetype6-dev libeigen3-dev libcurl4-openssl-dev libasound2-dev cmake libsdl2-dev
cd && git clone https://github.com/DOCK-PI3/EmulationStation
cd EmulationStation
mkdir build && cd build
cmake .. && make -j2
sudo make -j2 install
rpSwap off
# cd && sudo rm -R EmulationStation/
}

function attractmode_instalador() {                                          
dialog --infobox "... Script instalador de AttractMode en su version mas reciente ..." 30 55 ; sleep 3
# Cierra ES para una mejor y mas rapida compilacion de attract y ffmpeg......
sudo killall emulationstation
sudo killall emulationstation-dev

# ACTUALIZAR LISTA DE PAQUETES
sudo apt-get update

# Crear entorno para compilar
cd /home/pi && mkdir develop

# Instalar las dependencias para "sfml-pi" y Attract-Mode
sudo apt-get install -y cmake libflac-dev libogg-dev libvorbis-dev libopenal-dev libfreetype6-dev libudev-dev libjpeg-dev libudev-dev libfontconfig1-dev

# Descargar y compilar sfml-pi
cd /home/pi/develop
git clone --depth 1 https://github.com/mickelson/sfml-pi sfml-pi
mkdir sfml-pi/build; cd sfml-pi/build
cmake .. -DSFML_RPI=1 -DEGL_INCLUDE_DIR=/opt/vc/include -DEGL_LIBRARY=/opt/vc/lib/libbrcmEGL.so -DGLES_INCLUDE_DIR=/opt/vc/include -DGLES_LIBRARY=/opt/vc/lib/libbrcmGLESv2.so
sudo make -j4 install
sudo ldconfig

# Compilar FFmpeg con soporte mmal (decodificacion de video acelerada por hardware)
cd /home/pi/develop
git clone --depth 1 git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
./configure --enable-mmal --disable-debug --enable-shared
make -j4
sudo make -j4 install
sudo ldconfig

# Descargar y compilar Attract-Mode
cd /home/pi/develop
git clone --depth 1 https://github.com/mickelson/attract attract
cd attract
make -j4 USE_GLES=1
sudo make -j4 install USE_GLES=1
sudo rm -r -f /home/pi/develop
dialog --infobox " Una vez que inicie attract seleccione su idioma \n ,ya puede usar atrractmode. " 350 350 ; sleep 10
dialog --infobox " Attract se instalo de forma correcta y con mmal ... ,reiniciando en 15s" 350 350 ; sleep 15
# sudo shutdown -r now
}

function vsftpd_instalador() {                                          
dialog --infobox "... Script instalador de VsFTPd en su version mas reciente ..." 30 55 ; sleep 3
sudo apt update
sudo apt install -y vsftpd
# crear un backup del fichero de configuracion
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.backup
# Agregar primer usuario para el ftp
dialog --infobox "... Vamos a crear 1 usuario para el ftp,de nombre masosteam\n el pasword escribalo ahora y pulse enter y enter para saltar lo demas..." 40 55 ; sleep 7
sudo adduser masosteam
sudo mkdir /home/masosteam/ftp
sudo chown nobody:nogroup /home/masosteam/ftp
sudo chmod a-w /home/masosteam/ftp
sudo mkdir /home/masosteam/ftp/ficheros
sudo chown masosteam:masosteam /home/masosteam/ftp/ficheros
echo "MasOS Team - vsftpd fichero de pruebas..." | sudo tee /home/masosteam/ftp/ficheros/prueba.txt
# Asegurar conecciones ,certificado.,...
dialog --infobox "... Es hora de crear un certificado y encriptar las conexiones en su FTP.\n\nConteste las preguntas y pulse enter para crear su certificado..." 40 55 ; sleep 10
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
# aqui hacemos un cat a vsftpd.conf con la configuracion x defecto....
dialog --infobox "... Para permitir acceso externo tiene que abrir en su router desde el puerto 50000 a 60000.\n\nEl servidor esta configurado para  trabajar en modo pasivo..." 40 55 ; sleep 10
sudo rm /etc/vsftpd.conf
sudo cat > /etc/vsftpd.conf <<_EOF_
# Example config file /etc/vsftpd.conf
######## EDITADO POR DOCK-PI3 - THE MASOS TEAM ########
# The default compiled in settings are fairly paranoid. This sample file
# loosens things up a bit, to make the ftp daemon more usable.
# Please see vsftpd.conf.5 for all compiled in defaults.
#
# READ THIS: This example file is NOT an exhaustive list of vsftpd options.
# Please read the vsftpd.conf.5 manual page to get a full idea of vsftpd's
# capabilities.
#
#
# Run standalone?  vsftpd can run either from an inetd or as a standalone
# daemon started from an initscript.
listen=NO
#
# This directive enables listening on IPv6 sockets. By default, listening
# on the IPv6 "any" address (::) will accept connections from both IPv6
# and IPv4 clients. It is not necessary to listen on *both* IPv4 and IPv6
# sockets. If you want that (perhaps because you want to listen on specific
# addresses) then you must run two copies of vsftpd with two configuration
# files.
listen_ipv6=YES
#
# Allow anonymous FTP? (Disabled by default).
anonymous_enable=NO
#
# Uncomment this to allow local users to log in.
local_enable=YES
#
# Uncomment this to enable any form of FTP write command.
write_enable=YES
#
# Default umask for local users is 077. You may wish to change this to 022,
# if your users expect that (022 is used by most other ftpd's)
#local_umask=022
#
# Uncomment this to allow the anonymous FTP user to upload files. This only
# has an effect if the above global write enable is activated. Also, you will
# obviously need to create a directory writable by the FTP user.
#anon_upload_enable=YES
#
# Uncomment this if you want the anonymous FTP user to be able to create
# new directories.
#anon_mkdir_write_enable=YES
#
# Activate directory messages - messages given to remote users when they
# go into a certain directory.
dirmessage_enable=YES
#
# If enabled, vsftpd will display directory listings with the time
# in  your  local  time  zone.  The default is to display GMT. The
# times returned by the MDTM FTP command are also affected by this
# option.
use_localtime=YES
#
# Activate logging of uploads/downloads.
xferlog_enable=YES
#
# Make sure PORT transfer connections originate from port 20 (ftp-data).
connect_from_port_20=YES
#
# If you want, you can arrange for uploaded anonymous files to be owned by
# a different user. Note! Using "root" for uploaded files is not
# recommended!
#chown_uploads=YES
#chown_username=whoever
#
# You may override where the log file goes if you like. The default is shown
# below.
#xferlog_file=/var/log/vsftpd.log
#
# If you want, you can have your log file in standard ftpd xferlog format.
# Note that the default log file location is /var/log/xferlog in this case.
#xferlog_std_format=YES
#
# You may change the default value for timing out an idle session.
#idle_session_timeout=600
#
# You may change the default value for timing out a data connection.
#data_connection_timeout=120
#
# It is recommended that you define on your system a unique user which the
# ftp server can use as a totally isolated and unprivileged user.
#nopriv_user=ftpsecure
#
# Enable this and the server will recognise asynchronous ABOR requests. Not
# recommended for security (the code is non-trivial). Not enabling it,
# however, may confuse older FTP clients.
#async_abor_enable=YES
#
# By default the server will pretend to allow ASCII mode but in fact ignore
# the request. Turn on the below options to have the server actually do ASCII
# mangling on files when in ASCII mode.
# Beware that on some FTP servers, ASCII support allows a denial of service
# attack (DoS) via the command "SIZE /big/file" in ASCII mode. vsftpd
# predicted this attack and has always been safe, reporting the size of the
# raw file.
# ASCII mangling is a horrible feature of the protocol.
#ascii_upload_enable=YES
#ascii_download_enable=YES
#
# You may fully customise the login banner string:
ftpd_banner=Welcome to My FTP service.
#
# You may specify a file of disallowed anonymous e-mail addresses. Apparently
# useful for combatting certain DoS attacks.
#deny_email_enable=YES
# (default follows)
#banned_email_file=/etc/vsftpd.banned_emails
#
# You may restrict local users to their home directories.  See the FAQ for
# the possible risks in this before using chroot_local_user or
# chroot_list_enable below.
chroot_local_user=YES
user_sub_token=$USER
local_root=/home/$USER/ftp
pasv_min_port=40000
pasv_max_port=50000
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
#
# You may specify an explicit list of local users to chroot() to their home
# directory. If chroot_local_user is YES, then this list becomes a list of
# users to NOT chroot().
# (Warning! chroot'ing can be very dangerous. If using chroot, make sure that
# the user does not have write access to the top level directory within the
# chroot)
#chroot_local_user=YES
#chroot_list_enable=YES
# (default follows)
#chroot_list_file=/etc/vsftpd.chroot_list
#
# You may activate the "-R" option to the builtin ls. This is disabled by
# default to avoid remote users being able to cause excessive I/O on large
# sites. However, some broken FTP clients such as "ncftp" and "mirror" assume
# the presence of the "-R" option, so there is a strong case for enabling it.
#ls_recurse_enable=YES
#
# Customization
#
# Some of vsftpd's settings don't fit the filesystem layout by
# default.
#
# This option should be the name of a directory which is empty.  Also, the
# directory should not be writable by the ftp user. This directory is used
# as a secure chroot() jail at times vsftpd does not require filesystem
# access.
secure_chroot_dir=/var/run/vsftpd/empty
#
# This string is the name of the PAM service vsftpd will use.
pam_service_name=vsftpd
#
# This option specifies the location of the RSA certificate to use for SSL
# encrypted connections.
#rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
#rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=YES
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
require_ssl_reuse=NO
ssl_ciphers=HIGH

#
# Uncomment this to indicate that vsftpd use a utf8 filesystem.
#utf8_filesystem=YES

_EOF_
# Añadir usuario a la lista blanca.,...
echo "masosteam" | sudo tee -a /etc/vsftpd.userlist
sudo systemctl restart vsftpd
}

main_menu