#!/bin/bash
version=" 1.5.9"
infobox="${infobox}\n_______________________________________________________\n\n"
infobox="${infobox}\n DOCK-PI3_Roboticsinstall creado para ayudar,\nInstalador de multiples herramientas y utilidades....."
infobox="${infobox}\nAttractMode ,RetroArch 1.8.1 ,WebMin ,Mumble server\nSamba ,vsFTPd ,Duck DNS ,Pi-Hole ,Pi-VPN ,EmulOS y MasOS."
infobox="${infobox}\n\n\n_______________________________________________________\n\n"
dialog --backtitle "Version de la aplicacion: $version - Multi-instalador de Herramientas y utils" \
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
			6 "Rpi Instalar Retroarch 1.8.1" \
			8 "Rpi Instalar AttracMode" \
			9 "Rpi Instalar VsFTPd" \
			10 "Rpi Desktop Instalar The Fan Club - Duck DNS Setup" \
			11 "Rpi Instalar Mumble Server VOIP" \
			12 "Rpi Instalar SAMBA Server" \
			13 "Rpi Instalar GUI DESKTOP LXDE" \
			14 "Rpi Instalar GUI DESKTOP XFCE4" \
			15 "Rpi Instalar GUI DESKTOP MATE" \
			100 "-------------- Para RPI4 ----------------" \
			70 "Rpi4 Instalar Retroarch 1.8.1" \
			71 "Rpi4 Retroarch install CORES" \
			72 "Rpi4 Instalar AttracMode - Alternate version X" \
			69 "----- ACTUALIZAR Roboticsinstall -----" \
			2>&1 > /dev/tty)

        case "$choice" in
			100) separador_menu  ;;
			69) robotics_update ;;
            1) masos_instalador  ;;
            2) emulos_instalador  ;;
			3) pivpn_instalador  ;;
            4) pihole_instalador ;;
			5) webmin_instalador ;;
			6) retroarch_instalador ;;
			8) attractmode_instalador ;;
			9) vsftpd_instalador ;;
			10) duckDNSSetup_instalador ;;
			11) mumbleserver_instalador ;;
			12) samba_instalador ;;
			13) lxde_instalador ;;
			14) xfce4_instalador ;;
			15) mate_instalador ;;
			70) RPI4_retroarch_instalador ;;
			71) RPI4_retroarch_install_cores ;;
			72) RPI4_attractmode_instalador ;;
			*)  break ;;
        esac
    done
}

function RPI4_retroarch_install_cores() {                                          
dialog --infobox "... RPI4 Retroarch instalando core \n\n CORES: ..." 30 55 ; sleep 3

cd ~
mkdir EmUCoP-cores
cd EmUCoP-cores
dialog --infobox "... RPI4 Retroarch instalando core libretro-fceumm ..." 30 55 ; sleep 2
git clone --depth 1 https://github.com/libretro/libretro-fceumm.git
cd libretro-fceumm
make -j4

dialog --infobox "... RPI4 Retroarch instalando core snes9x2010 ..." 30 55 ; sleep 2
cd ~
cd EmUCoP-cores
git clone --depth 1 https://github.com/libretro/snes9x2010.git
cd snes9x2010
make -j4

dialog --infobox "... RPI4 Retroarch instalando core mupen64plus-libretro ..." 30 55 ; sleep 2
cd ~
cd EmUCoP-cores
git clone --depth 1 https://github.com/libretro/mupen64plus-libretro.git
cd mupen64plus-libretro
platform=rpi4 make -j4

dialog --infobox "... RPI4 Retroarch instalando core  pcsx_rearmed ..." 30 55 ; sleep 2
cd ~
cd EmUCoP-cores
git clone --depth 1 https://github.com/libretro/pcsx_rearmed.git
cd pcsx_rearmed
platform=rpi4 make -j4 -f Makefile.libretro

dialog --infobox "... Copiando cores de retroarch en /home/pi/.config/retroarch/cores ..." 30 55 ; sleep 2
cd && cp -R EmUCoP-cores/libretro-fceumm/*.so /home/pi/.config/retroarch/cores
cd && cp -R EmUCoP-cores/snes9x2010/*.so /home/pi/.config/retroarch/cores
cd && cp -R EmUCoP-cores/mupen64plus-libretro/*.so /home/pi/.config/retroarch/cores
cd && cp -R EmUCoP-cores/pcsx_rearmed/pcsx_rearmed_libretro.so /home/pi/.config/retroarch/cores/

dialog --infobox "... Cores instalados de forma correcta .. limpiando basura...." 30 55 ; sleep 2
sudo rm -R EmUCoP-cores/

}

function separador_menu() {                                          
dialog --infobox "... Separador para el menu, sin funcion ..." 30 55 ; sleep 2
}

function robotics_update() {                                          
dialog --infobox "... Actualiza la herramienta Roboticsinstall..." 30 55 ; sleep 3
cd && sudo rm -R RPI-RoboticsInstalls/
git clone https://github.com/DOCK-PI3/RPI-RoboticsInstalls.git
sudo chmod +x RPI-RoboticsInstalls/DOCK-PI3_Roboticsinstall.sh
cd RPI-RoboticsInstalls/ && ./DOCK-PI3_Roboticsinstall.sh
exit
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
dialog --infobox "... Script instalador de Retroarch en su version 1.8.1 ..." 30 55 ; sleep 3
sudo apt update
dialog --infobox "... Iniciando actualizacion del sistema y sus paquetes ,comentado dmomento..." 30 55 ; sleep 2
# sudo apt upgrade -y
dialog --infobox "... Elija la distribucion para su teclado ..." 30 55 ; sleep 5
sudo dpkg-reconfigure keyboard-configuration
dialog --infobox "... Seleccione con espacio es_ES.UTF-8 si vive en España y pulse enter..." 30 55 ; sleep 5
sudo dpkg-reconfigure locales
dialog --infobox "... Elija su zona horaria ..." 30 55 ; sleep 5
sudo dpkg-reconfigure tzdata
dialog --infobox "... Compilar e instalar RetroArch ,iniciando espere! ..." 30 55 ; sleep 5
sudo apt install -y build-essential libasound2-dev libudev-dev
cd && curl -LO 'https://github.com/libretro/RetroArch/archive/v1.8.1.tar.gz' && tar -zxvf v1.8.1.tar.gz
cd RetroArch-1.8.1
# CFLAGS='-mfpu=neon' ./configure --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx --disable-opengl1
CFLAGS='-march=armv8-a+crc -mtune=cortex-a53 -O2 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations' ./configure --disable-ffmpeg --disable-qt --disable-sdl --enable-sdl2 --disable-x11 --disable-freetype --disable-debug --disable-opengl1 --disable-opengl_core --enable-networking --enable-opengles --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx
make -j2
sudo make -j2 install
# cd && sudo rm -R RetroArch-1.8.1/
dialog --infobox "... RetroArch 1.8.1 instalado correctamente ,Reiniciando el sistema en 7seg espere! ..." 30 55 ; sleep 7
}

function RPI4_retroarch_instalador() {                                          
dialog --infobox "... RIP4 BETA Script instalador de Retroarch en su version 1.8.1 ..." 30 55 ; sleep 3
sudo apt update
dialog --infobox "... Iniciando actualizacion del sistema y sus paquetes ,comentado dmomento..." 30 55 ; sleep 2
# sudo apt upgrade -y
#dialog --infobox "... Elija la distribucion para su teclado ..." 30 55 ; sleep 5
#sudo dpkg-reconfigure keyboard-configuration
#dialog --infobox "... Seleccione con espacio es_ES.UTF-8 si vive en España y pulse enter..." 30 55 ; sleep 5
#sudo dpkg-reconfigure locales
#dialog --infobox "... Elija su zona horaria ..." 30 55 ; sleep 5
#sudo dpkg-reconfigure tzdata
dialog --infobox "... Compilar e instalar RetroArch ,iniciando espere! ..." 30 55 ; sleep 5
sudo apt install -y build-essential libasound2-dev libudev-dev libgles2-mesa-dev
cd && curl -LO 'https://github.com/libretro/RetroArch/archive/v1.8.1.tar.gz' && tar -zxvf v1.8.1.tar.gz
sudo rm v1.8.1.tar.gz
cd RetroArch-1.8.1
CFLAGS='-mfpu=neon -mtune=cortex-a72 -march=armv8-a' ./configure --disable-opengl1 --enable-neon --enable-opengles3 --enable-opengles --disable-videocore
make
sudo make install
cd && sudo rm -R RetroArch-1.8.1/
dialog --infobox "... RetroArch 1.8.1 instalado correctamente en su rpi4! ..." 30 55 ; sleep 7
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
sudo apt-get install -y make cmake pkg-config libflac-dev libogg-dev libvorbis-dev libopenal-dev libfreetype6-dev libudev-dev libjpeg-dev libudev-dev libfontconfig1-dev

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
dialog --infobox " Attract se instalo de forma correcta y con mmal ... ,reiniciando en 10s" 350 350 ; sleep 10
# sudo shutdown -r now
}

function RPI4_attractmode_instalador() {                                          
dialog --infobox "... RPI4 Script instalador de AttractMode en su version mas reciente ..." 30 55 ; sleep 3
# Cierra ES para una mejor y mas rapida compilacion de attract y ffmpeg......
sudo killall emulationstation
sudo killall emulationstation-dev

# ACTUALIZAR LISTA DE PAQUETES
sudo apt-get update

# Crear entorno para compilar
cd /home/pi && mkdir develop

# Instalar las dependencias para "sfml-pi" y Attract-Mode
sudo apt-get install -y make cmake pkg-config libflac-dev libogg-dev libvorbis-dev libopenal-dev libfreetype6-dev libudev-dev libjpeg-dev libudev-dev libfontconfig1-dev
sudo apt-get install -y libx11-dev libx11-xcb-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxrandr2 libxrandr-dev libgles2-mesa-dev
# Descargar y compilar sfml-pi
cd /home/pi/develop
git clone --depth 1 https://github.com/mickelson/sfml-pi sfml-pi
mkdir sfml-pi/build; cd sfml-pi/build
cmake -DEGL_INCLUDE_DIR=/opt/vc/include -DEGL_LIBRARY=/opt/vc/lib/libEGL.so -DFREETYPE_INCLUDE_DIR_freetype2=/usr/include -DFREETYPE_INCLUDE_DIR_ft2build=/usr/include/freetype2 -DGLES_INCLUDE_DIR=/opt/vc/include -DGLES_LIBRARY=/opt/vc/lib/libGLESv1_CM.so -DSFML_BCMHOST=1 -DSFML_OPENGL_ES=1 ..
sudo make -j4 install
sudo ldconfig

# (más fácil): use los paquetes provistos (solo decodificación de video por software) 
# Compilar FFmpeg con soporte mmal (decodificacion de video acelerada por hardware)
sudo apt-get install libavutil-dev libavcodec-dev libavformat-dev libavfilter-dev libswscale-dev libavresample-dev

# cd /home/pi/develop
# git clone --depth 1 git://source.ffmpeg.org/ffmpeg.git
# cd ffmpeg
# ./configure --enable-mmal --disable-debug --enable-shared
# make -j4
# sudo make -j4 install
# sudo ldconfig

# Descargar y compilar Attract-Mode
cd /home/pi/develop
git clone --depth 1 https://github.com/mickelson/attract attract
cd attract
make -j4 USE_GLES=1
sudo make -j4 install USE_GLES=1
sudo rm -r -f /home/pi/develop
dialog --infobox " Una vez que inicie attract seleccione su idioma \n ,ya puede usar atrractmode. " 350 350 ; sleep 10
dialog --infobox " Attract se instalo de forma correcta y con mmal ... ,reiniciando en 10s" 350 350 ; sleep 10
# sudo shutdown -r now
}

function vsftpd_instalador() {                                          
dialog --infobox "... Script instalador de VsFTPd en su version mas reciente ..." 30 55 ; sleep 3
sudo apt update
sudo apt install -y vsftpd
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
# Importando fichero de configuracion vsftpd.conf con una buena configuracion y eliminando la que trae por defecto....
dialog --infobox "... Para permitir acceso externo tiene que abrir en su router desde el puerto 40000 a 50000.\n\nEl servidor esta configurado para  trabajar en modo pasivo..." 40 55 ; sleep 10
sudo rm /etc/vsftpd.conf
cd && sudo cp RPI-RoboticsInstalls/configs/vsftpd.conf /etc/
# Añadir usuario a la lista blanca.,...
echo "masosteam" | sudo tee -a /etc/vsftpd.userlist
# crear un backup del fichero de configuracion importado...
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.backup
# Reiniciar servicio,se recomienda reiniciar el sistema.,...
sudo systemctl restart vsftpd.service
# Crear fichero con informacion para administar el servidor y ejemplos en el home/pi/AdminFTP_MasOSTeam.txt.,...
dialog --infobox "... VsFTPd instalado y funcionando ,le dejo un fichero con informacion \npara que pueda y sepa administrar su servidor.\n\n Busque en /home/pi/AdminFTP_MasOSTeam.txt ..." 30 55 ; sleep 7
cd && sudo cp RPI-RoboticsInstalls/configs/AdminFTP_MasOSTeam.txt /home/pi/
}

function duckDNSSetup_instalador() {                                          
dialog --infobox "... Script instalador de Duck DNS Setup ..." 30 55 ; sleep 3
userHome=$(eval echo ~${USER})
duckPath="$userHome/duckdns"
duckLog="$duckPath/duck.log"
duckScript="$duckPath/duck.sh"
echo "* Duck DNS setup by The Fan Club - version 1.0"
echo 

# Remove Option
case "$1" in
	remove)
      zenity --question --title "The Fan Club - Duck DNS Setup" --text "Completely remove Duck DNS settings?"  
      if [ "$?" -eq "1" ]
        then
          echo "Setup cancelled. Program will now quit."
         exit 0 
      fi
      # Remove Duck DNS files
      rm -R $duckPath
      # Remove Cron Job
      crontab -l >/tmp/crontab.tmp
      sed -e 's/\(^.*duck.sh$\)//g' /tmp/crontab.tmp  | crontab
      rm /tmp/crontab.tmp  
      zenity --info --title="The Fan Club - Duck DNS Setup" --text="<b>Duck DNS un-install complete</b>\n\n- Duck DNS script removed\n- Duck DNS folder removed\n- Duck DNS cron job removed" --ok-label="Done" 
      exit 0        
	;;
	
esac

# Main Install ***
# Get sub domain 
domainName=$( zenity --entry --title "The Fan Club - Duck DNS Setup" --text "Enter your Duck DNS sub-domain name" --ok-label="Next" --width="500")
mySubDomain="${domainName%%.*}"
duckDomain="${domainName#*.}"
if [ "$duckDomain" != "duckdns.org" ] && [ "$duckDomain" != "$mySubDomain" ] || [ "$mySubDomain" = "" ]
then 
  zenity --error --text="Invalid domain name. The program will now quit." --title "The Fan Club - Duck DNS Setup"
  exit 0
fi
# Get Token value
duckToken=$( zenity --entry --title "The Fan Club - Duck DNS Setup" --text "Enter your Duck DNS Token value" --ok-label="Next" --width="500")
# Display Confirmation
zenity --question --title="The Fan Club - Duck DNS Setup" --text="<b>Your domain name is $mySubDomain.duckdns.org \nand token value $duckToken</b>\n\nPlease click Next to continue or Cancel to quit.\nIt will take a few seconds for the setup to complete." --ok-label="Next" --cancel-label="Cancel"
# Check if Cancel was pressed
if [ "$?" -eq "1" ]
  then
    zenity --warning --text="Setup canceled" --title "The Fan Club - Duck DNS Setup" --width="300" --ok-label="Done"
    exit 0
fi
# Create duck dir
if [ ! -d "$duckPath" ] 
then
  mkdir "$duckPath"
fi
# Create duck script file
echo "echo url=\"https://www.duckdns.org/update?domains=$mySubDomain&token=$duckToken&ip=\" | curl -k -o $duckLog -K -" > $duckScript
chmod 700 $duckScript
# Create Conjob
# Check if job already exists
checkCron=$( crontab -l | grep -c $duckScript )
if [ "$checkCron" -eq 0 ] 
then
  # Add cronjob
  echo "Adding Cron job for Duck DNS"
  crontab -l | { cat; echo "*/5 * * * * $duckScript"; } | crontab -
fi
# Test Setup
# Run now
$duckScript
# Response
duckResponse=$( cat $duckLog )
if [ "$duckResponse" != "OK" ]
then
  responseExtra="[Error] Duck DNS did not update correctly.\n\nPlease check your settings or run the setup again."
else
  responseExtra="Duck DNS setup complete."
fi
# Setup report
zenity --info --title="The Fan Club - Duck DNS Setup" --text="<b>- Duck DNS script file created\n- Duck DNS cron job added\n- Duck DNS server response : $duckResponse</b>\n\n$responseExtra" --ok-label="Done" 
cd && cd RPI-RoboticsInstalls/ && ./DOCK-PI3_Roboticsinstall.sh
exit
}

function mumbleserver_instalador() {                                          
dialog --infobox "... Instalar servidor VOIP Mumble server - MURMUR..." 30 55 ; sleep 3
sudo apt-get update
sudo apt-get install -y mumble-server
dialog --infobox "... Ahora configuramos el servidor VOIP Mumble server ,rellene los campos!..." 30 55 ; sleep 5
sudo dpkg-reconfigure mumble-server
dialog --infobox "... Instalado el servidor VOIP Mumble server - MURMUR...\n\nPara editar la configuracion: sudo nano /etc/mumble-server.ini\n\nComo reiniciar su servidor: sudo /etc/init.d/mumble-server restart" 30 55 ; sleep 8
cd && cd RPI-RoboticsInstalls/ && ./DOCK-PI3_Roboticsinstall.sh
exit
}

function samba_instalador() {                                          
dialog --infobox "... Instalar SAMBA server - SMB..." 30 55 ; sleep 3
sudo apt-get update
sudo apt-get install -y samba samba-common-bin
dialog --infobox "... El directorio /home/pi/ se comparte por defecto en modo lectura\nAhora crearemos el directorio sharesd en /home/pi ,aqui tiene permisos de escritura..." 30 55 ; sleep 5
mkdir /home/pi/sharesd
sudo rm /etc/samba/smb.conf
cd && sudo cp RPI-RoboticsInstalls/configs/smb.conf /etc/samba/
dialog --infobox "... Ahora crearemos un usuario para acceder a samba sharesd\n\nEl nombre por defecto es pi\n\nIntrodusca usted la contraseña..." 30 55 ; sleep 7
sudo smbpasswd -a pi
sudo systemctl restart smbd
dialog --infobox "... Instalado SAMBA Server - SMB ...\n\nLa ruta del recurso compartido es: \\RASPBERRYPI\rpisamba \n\nRecuerde ingresar con usuario pi y su contraseña para samba\n\n\n\nSe reinicio samba para cargar la nueva configuracion, recomiendo q reinicie el sistema" 30 55 ; sleep 15
cd && cd RPI-RoboticsInstalls/ && ./DOCK-PI3_Roboticsinstall.sh
exit
}

function lxde_instalador() {                                          
dialog --infobox "... Preparando instalacion de LXDE ..." 30 55 ; sleep 3
sudo apt-get install -y --no-install-recommends xserver-xorg xinit
sudo apt-get install -y lxde-core lxappearance
sudo apt-get install -y lightdm
sudo reboot
}

function xfce4_instalador() {                                          
dialog --infobox "... Preparando instalacion de XFCE4 ..." 30 55 ; sleep 3
sudo apt-get install -y --no-install-recommends xserver-xorg xinit
sudo apt-get install -y xfce4 xfce4-terminal
sudo apt-get install -y lightdm
sudo reboot
}

function mate_instalador() {                                          
dialog --infobox "... Preparando instalacion de MATE ..." 30 55 ; sleep 3
sudo apt-get install -y --no-install-recommends xserver-xorg xinit
sudo apt-get install -y mate-desktop-environment-core
sudo apt-get install -y lightdm
sudo reboot
}

main_menu