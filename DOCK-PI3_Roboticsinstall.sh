#!/bin/bash

dialog --backtitle "Script Multi-instalador de sistemas y utilidades" \
--title "DOCK-PI3_Roboticsinstall ,Script Multi-instalador de sistemas y utilidades rpi 3b b+(by Mabedeep - The MasOS TEAM)" \
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

main_menu