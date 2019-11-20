#!/bin/bash
version=" 2.0.1"
infobox="${infobox}\n_______________________________________________________\n\n"
infobox="${infobox}\n       DOCK-PI3_Roboticsinstall creado por vicio.....\n\nInstalador de multiples herramientas y utilidades.....\n"
infobox="${infobox}\n\n_______________________________________________________\n\n"
infobox="${infobox}\n       AttractMode 2.6,RetroArch 1.8.1 ,WebMin ,Mumble server\n\nSamba ,vsFTPd ,Duck DNS ,Pi-Hole ,Pi-VPN ,EmulOS ,EmuCOPS NOOBs v1 y MasOS."
infobox="${infobox}\n\n\n_______________________________________________________\n\n"
dialog --backtitle "Version de la aplicacion: $version - Multi-instalador de Herramientas y utils" \
--title "Instalador de sistemas y utilidades rpi 4b, 3b y 3b+ (by EmulOS TEAM)" \
--msgbox "${infobox}" 35 110

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Version: $version - Que accion te gustaria realizar?" 25 75 20 \
            100 "-------------- Para RPI3 ----------------" \
			0 "Rpi Instalar EmuCOPS NOOBs v1 FullSetup script" \
			1 "Rpi Instalar MasOS-Setup script" \
			2 "Rpi Instalar EmulOS-Setup script" \
			3 "Rpi Instalar PiVPN" \
            4 "Rpi Instalar PiHOLE" \
			5 "Rpi Instalar WebMin" \
			6 "Rpi Instalar Retroarch 1.8.1" \
			8 "Rpi Instalar AttractMode" \
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
			72 "Rpi4 Instalar AttractMode - Alternate version X" \
			73 "Rpi4 Instala herramienta para actualizar el firmware auto o manual" \
			74 "Rpi4 UPDATE FIRMWARE Instalar Actualizaciones " \
			100 "-------------- OPCIONES ATTRACTMODE AUTOSTART ----------------" \
			300 "Rpi AttractMode inicio auto CLI - version Raspian Lite" \
			320 "Rpi AttractMode inicio auto Escritorio - version Raspian Desktop" \
			100 "-------------- Roboticsinstall ACTUALIZAR VERSION ----------------" \
			69 "######## ACTUALIZAR herramienta Roboticsinstall ########" \
			2>&1 > /dev/tty)

        case "$choice" in
			100) separador_menu  ;;
			69) robotics_update ;;
            0) emucops_rpi3_instalador  ;;
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
			73) RPI4_installauto_updatefirmw ;;
			74) RPI4_FIRMWARE_update ;;
			300) consola_attract_autolaunch  ;;
            320) desktop_attract_autolaunch  ;;
			*)  break ;;
        esac
    done
}

function separador_menu() {                                          
dialog --infobox "... Separador para el menu, sin funcion ..." 30 55 ; sleep 2
}

function RPI4_installauto_updatefirmw() {
dialog --infobox "... RPI4 Instala Actualizador de Firmware y actualiza ..." 30 55 ; sleep 3
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y rpi-eeprom rpi-eeprom-images
# dialog --infobox "... Buscando Actualizaciones para el Firmware de RPI4 \n\n Si la busqueda da positivo puede actualizar el firmware \n\n usando la opcion 74 RPI4 UPDATE FIRMWARE, para desactivar las actualizaciones automaticas ejecute \n\n\n\n COMANDO: sudo systemctl mask rpi-eeprom-update \n\n\n\nPara reactivar las updates auto del firmware ejecute \n\n\n\n COMANDO: sudo systemctl unmask rpi-eeprom-update " 30 55 ; sleep 2
# sudo rpi-eeprom-update
dialog --infobox "... Firmware de rpi4 actualizado correctamente. Reiniciando en 8s ..." 30 55 ; sleep 8
sudo reboot
}

function RPI4_FIRMWARE_update() {
dialog --infobox "... Buscando updates del Firmware para su RPI4 ..." 30 55 ; sleep 2
sudo rpi-eeprom-update
dialog --infobox "... Su version de Firmware es: ver consola ...  " 30 55 ; sleep 10
}

function emucops_rpi3_instalador() {                                          
dialog --infobox "... EmuCOPS NOOBS v1 ,INSTALADOR AUTOMATICO DEL SISTEMA.\n\nInstala y configura AttractMode 2.6 y Retroarch 1.8.1 en su Rpi3b o b+\n\nSe instalan muchos paquetes desde la fuente para asegurar que tenemos la ultima version de cada programa, esto tarda un tiempo aprox de 15 a 20m. \n\n\n\n  INICIANDO ESPERE... ,CUANDO EL INSTALADOR TERMINE REINICIARA SU SISTEMA. ..." 30 55 ; sleep 7
dialog --infobox "... Script instalador de Retroarch en su version 1.8.1 ..." 30 55 ; sleep 3
# ACTUALIZAR LISTAS Y PAQUETES DEL SISTEMA
sudo apt-get update
dialog --infobox "... Iniciando actualizacion del sistema y sus paquetes ,comentado dmomento..." 30 55 ; sleep 2
sudo apt-get upgrade -y
# CONFIGURACION BASICA DEL SISTEMA
dialog --infobox "... Elija la distribucion para su teclado ..." 30 55 ; sleep 5
sudo dpkg-reconfigure keyboard-configuration
dialog --infobox "... Seleccione con espacio es_ES.UTF-8 si vive en España y pulse enter..." 30 55 ; sleep 5
sudo dpkg-reconfigure locales
dialog --infobox "... Elija su zona horaria ..." 30 55 ; sleep 5
sudo dpkg-reconfigure tzdata
# INSTALACION DE RETROARCH
dialog --infobox "... Compilar e instalar RetroArch 1.8.1, iniciando espere! ..." 30 55 ; sleep 3
# ZLIB 
sudo apt-get install -y build-essential libasound2-dev libudev-dev libz-dev libpng-dev
sudo apt-get install -y make git git-core curl g++ pkg-config libglu1-mesa-dev freeglut3-dev mesa-common-dev libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev
cd && curl -LO 'https://github.com/libretro/RetroArch/archive/v1.8.1.tar.gz' && tar -zxvf v1.8.1.tar.gz
sudo rm v1.8.1.tar.gz
cd RetroArch-1.8.1
#default ok#CFLAGS='-mfpu=neon' ./configure --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx --disable-opengl1
#CFLAGS = '-mfpu=neon' ./configure --disable-sdl --enable-sdl2 --disable-oss --disable-al --disable-jack --disable-qt
#CFLAGS = '-mfpu=neon' ./configure --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx --disable-opengl1 --disable-opengl_core
CFLAGS='-march=armv8-a+crc -mtune=cortex-a53 -O2 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations' ./configure --disable-sdl --disable-sdl2 --disable-x11 --disable-freetype --disable-debug --disable-opengl1 --disable-opengl_core --enable-opengles --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx
make clean
sudo make -j3 install
cd && sudo rm -R RetroArch-1.8.1/
dialog --infobox "... RetroArch 1.8.1 instalado correctamente ,iniciando modulo para descarga de cores! ..." 30 55 ; sleep 3
# dialog --infobox "... Ahora se abrira RetroArch 1.8.1 ,cierre el programa para seguir con la \n\nconfiguracion automatica y la descarga de cores! ..." 30 55 ; sleep 7
# retroarch
# sudo killall retroarch

#### DESCARGA Y COMPILACION DE CORES ,EMULADORES ....
dialog --infobox "... Descargando y Copiando cores para retroarch en /home/pi/.config/retroarch/cores\n\n ..." 30 55 ; sleep 3
cd && git clone https://github.com/DOCK-PI3/LR-CORES-RPI4.git
cd && cp -R LR-CORES-RPI4/* /home/pi/.config/retroarch/cores
sudo rm -R /home/pi/LR-CORES-RPI4/

dialog --infobox "... Mas de 70 Cores instalados de forma correcta .. limpiando basura...." 30 55 ; sleep 3

##### cargar configuracion retroarch
cd && cp RPI-RoboticsInstalls/configs/rpi3/retroarch.cfg /home/pi/.config/retroarch/

##### instalar assets rpi3
dialog --infobox "... Descargando y Copiando ASSETS para retroarch en /home/pi/.config/retroarch/assets ..." 30 55 ; sleep 3
cd && git clone https://github.com/libretro/retroarch-assets.git
cd && cp -R retroarch-assets/* /home/pi/.config/retroarch/assets/
sudo rm -R /home/pi/retroarch-assets/

##### instalar bios base retroarch
dialog --infobox "... Descargando y Copiando BIOS BASE para retroarch en /home/pi/.config/retroarch/system ..." 30 55 ; sleep 3

cd && git clone https://github.com/DOCK-PI3/rpi-retroarch-bios.git
cp -R rpi-retroarch-bios/system/ /home/pi/.config/retroarch/
sudo rm -R /home/pi/rpi-retroarch-bios/

dialog --infobox "... Descarga de BIOS BASE: correcta ..." 30 55 ; sleep 3


##### instalar shaders base para retroarch
# añadir -->

dialog --infobox "... RetroArch 1.8.1 instalado correctamente en su rpi3! ..." 30 55 ; sleep 7
###### FIN RETROARCH INSTALL RPI3 ###########################

###### INICIO ATTRACT INSTALL RPI3 ###########################
dialog --infobox "... Script instalador de AttractMode en su version mas reciente ..." 30 55 ; sleep 3
# Cierra ES para una mejor y mas rapida compilacion de attract y ffmpeg......
#sudo killall emulationstation
#sudo killall emulationstation-dev

# Crear entorno para compilar
cd /home/pi && mkdir develop

# Instalar las dependencias para "sfml-pi" y Attract-Mode
sudo apt-get install -y pkg-config libfontconfig1-dev
sudo apt-get install -y cmake libflac-dev libogg-dev libvorbis-dev libopenal-dev libjpeg8-dev libfreetype6-dev libudev-dev libraspberrypi-dev
# Descargar y compilar sfml-pi
cd /home/pi/develop
git clone https://github.com/mickelson/sfml-pi sfml-pi
mkdir sfml-pi/build; cd sfml-pi/build
cmake .. -DSFML_RPI=1 -DEGL_INCLUDE_DIR=/opt/vc/include -DEGL_LIBRARY=/opt/vc/lib/libbrcmEGL.so -DGLES_INCLUDE_DIR=/opt/vc/include -DGLES_LIBRARY=/opt/vc/lib/libbrcmGLESv2.so
sudo make install
sudo ldconfig

# Compilar FFmpeg con soporte mmal (decodificacion de video acelerada por hardware)
cd /home/pi/develop
git clone git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
./configure --enable-mmal --disable-debug --enable-shared
make -j3
sudo make install
sudo ldconfig

# Descargar y compilar Attract-Mode
cd && mkdir .attract
cd /home/pi/develop
git clone https://github.com/mickelson/attract attract
cd attract
make -j3 USE_GLES=1
sudo make -j3 install USE_GLES=1
sudo rm -r -f /home/pi/develop
# dialog --infobox " Ahora se inicia Attract, seleccione su idioma y cierre Attract.\n\n ,una vez lo cierre seguimos con la auto configuracion. " 350 350 ; sleep 10

# attract
# sudo killall attract

#### config full rescue ######
cd && git clone https://github.com/DOCK-PI3/EmuCOPS-Attract-autoconf.git
cp -R /home/pi/EmuCOPS-Attract-autoconf/attract/* /home/pi/.attract/
cd && mkdir EmuCOPS
cp -R /home/pi/EmuCOPS-Attract-autoconf/EmuCOPS/* /home/pi/EmuCOPS/
sudo cp -R /home/pi/EmuCOPS-Attract-autoconf/usr/local/share/attract/* /usr/local/share/attract/
sudo rm -R /home/pi/EmuCOPS-Attract-autoconf

# Permisos rutas attract #
sudo chown -R pi:pi /usr/local/bin/attract
sudo chown -R pi:pi /usr/local/share/attract/
sudo chown -R pi:pi /home/pi/.attract/

dialog --infobox " Attract se instalo de forma correcta y con mmal. " 350 350 ; sleep 3
dialog --infobox "... CREANDO INICIO DE ATTRACT AUTO EN CLI - CONSOLA ..." 30 55 ; sleep 3
cd && cp .bashrc .bashrc_back
cd && sudo cp RPI-RoboticsInstalls/configs/rpi3/.bashrc /home/pi/
sudo chown -R pi:pi /home/pi/.bashrc

# INSTALAR SAMBA SERVER #
dialog --infobox "... Instalar SAMBA server - SMB..." 30 55 ; sleep 3
sudo apt-get install -y samba samba-common-bin
dialog --infobox "... El directorio /home/pi/ se comparte por defecto en modo lectura\nAhora crearemos el directorio sharesd en /home/pi ,aqui tiene permisos de escritura..." 30 55 ; sleep 5
sudo rm /etc/samba/smb.conf
cd && sudo cp RPI-RoboticsInstalls/configs/smb.conf /etc/samba/
dialog --infobox "... Ahora crearemos un usuario para acceder a samba sharesd\n\nEl nombre por defecto es pi\n\nIntrodusca usted la contraseña..." 30 55 ; sleep 7
sudo smbpasswd -a pi
cd && sudo cp -R RPI-RoboticsInstalls/configs/emucops_hname/* /etc/
sudo systemctl restart smbd
dialog --infobox "... Instalado SAMBA Server - SMB ...\n\nLa ruta del recurso compartido es: \\EMUCOPS\ \n\nRecuerde ingresar con usuario pi y su contraseña para samba" 30 55 ; sleep 15

dialog --infobox "... EMUCOPS INSTALADO, REINICIANDO EN 10s CON ATTRACT EN MODO CLI - CONSOLA\n\nSe instalo SAMBA para su comodidad - RECOMENDADO! ..." 30 55 ; sleep 10

sudo reboot
###### EMUCOPS FIN,FIN ATTRACT,RETROARCH INSTALL Y CONFIG RPI3 ###########################
}

function consola_attract_autolaunch() {                                          
dialog --infobox "... INICIO DE ATTRACT AUTO EN CLI - CONSOLA ..." 30 55 ; sleep 2
cd && cp .bashrc .bashrc_back
cd && sudo cp RPI-RoboticsInstalls/configs/rpi3/.bashrc /home/pi/
sudo chown -R pi:pi /home/pi/.bashrc
dialog --infobox "... REINICIANDO CON ATTRACT EN MODO CLI - CONSOLA ..." 30 55 ; sleep 2
sudo reboot
}

function desktop_attract_autolaunch() {                                          
dialog --infobox "... INICIO DE ATTRACT AUTO EN DESKTOP ..." 30 55 ; sleep 2
cd && sudo cp RPI-RoboticsInstalls/configs/icon_attract.png /usr/share/icons/
sudo touch /usr/local/share/applications/attract.desktop
sudo cat > /usr/local/share/applications/attract.desktop <<_EOF_
[Desktop Entry]
Version=1.0
Name=AttractMode
Comment=EMUCOPS Emulator Frontend
Exec=/usr/local/bin/attract
Terminal=false
Type=Application
Categories=Game
Icon=/usr/share/icons/icon_attract.png
Name[es_ES]=Attract
_EOF_
cd /home/pi/.config/ && sudo mkdir autostart
sudo cp /usr/local/share/applications/attract.desktop /home/pi/.config/autostart/

#sudo reboot
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
dialog --infobox "... Script instalador de MasOS en su version mas reciente ..." 30 55 ; sleep 3
sudo apt-get update
sudo apt-get install -y git
cd && git clone --depth=1 https://github.com/DOCK-PI3/MasOS-Setup.git
sudo chmod -R +x MasOS-Setup/
cd MasOS-Setup
sudo ./masos_setup.sh
}

function emulos_instalador() {                                          
dialog --infobox "... Script instalador de EmulOS en su version mas reciente ...\n\n" 30 55 ; sleep 3
sudo apt-get update
sudo apt-get install -y git
cd && git clone --depth=1 https://github.com/Moriggy/EmulOS-Setup.git
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
#dialog --infobox "... Iniciando actualizacion del sistema y sus paquetes ,comentado dmomento..." 30 55 ; sleep 2
# sudo apt upgrade -y
#dialog --infobox "... Elija la distribucion para su teclado ..." 30 55 ; sleep 5
#sudo dpkg-reconfigure keyboard-configuration
#dialog --infobox "... Seleccione con espacio es_ES.UTF-8 si vive en España y pulse enter..." 30 55 ; sleep 5
#sudo dpkg-reconfigure locales
#dialog --infobox "... Elija su zona horaria ..." 30 55 ; sleep 5
#sudo dpkg-reconfigure tzdata
dialog --infobox "... Compilar e instalar RetroArch 1.8.1, iniciando espere! ..." 30 55 ; sleep 5
sudo apt install -y build-essential libasound2-dev libudev-dev libz-dev libpng-dev
sudo apt-get install -y make git-core curl g++ pkg-config libglu1-mesa-dev freeglut3-dev mesa-common-dev libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev
cd && curl -LO 'https://github.com/libretro/RetroArch/archive/v1.8.1.tar.gz' && tar -zxvf v1.8.1.tar.gz
sudo rm v1.8.1.tar.gz
cd RetroArch-1.8.1
CFLAGS='-mfpu=neon' ./configure --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx --disable-opengl1
#CFLAGS = '-mfpu=neon' ./configure --disable-sdl --enable-sdl2 --disable-oss --disable-al --disable-jack --disable-qt
#CFLAGS = '-mfpu=neon' ./configure --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx --disable-opengl1 --disable-opengl_core
#CFLAGS='-march=armv8-a+crc -mtune=cortex-a53 -O2 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations' ./configure --disable-ffmpeg --disable-networking --disable-sdl --disable-sdl2 --disable-x11 --disable-freetype --disable-debug --disable-opengl1 --disable-opengl_core --enable-opengles --enable-alsa --enable-udev --enable-floathard --enable-neon --enable-dispmanx
make -j2
sudo make -j2 install
cd && sudo rm -R RetroArch-1.8.1/
dialog --infobox "... RetroArch 1.8.1 instalado correctamente ,iniciando modulo para descarga de cores! ..." 30 55 ; sleep 3
#### DESCARGA Y COMPILACION DE CORES ,EMULADORES ....
dialog --infobox "... Descargando y Copiando cores para retroarch en /home/pi/.config/retroarch/cores\n\n ..." 30 55 ; sleep 3
cd && git clone --depth 1 https://github.com/DOCK-PI3/LR-CORES-RPI4.git
cp -R LR-CORES-RPI4/*.so /home/pi/.config/retroarch/cores
sudo rm -R /home/pi/LR-CORES-RPI4/

##### Compilar core lr flycast
# cd && git clone --depth 1 https://github.com/reicast/reicast-emulator
# cd reicast-emulator/reicast/linux/
# make platform=rpi3
# cp
# rm -R 
dialog --infobox "... FlyCast y mas de 70 Cores instalados de forma correcta .. limpiando basura...." 30 55 ; sleep 3

##### cargar configuracion retroarch
cd && cp RPI-RoboticsInstalls/configs/rpi3/retroarch.cfg /home/pi/.config/retroarch/

##### instalar assets rpi3
dialog --infobox "... Descargando y Copiando ASSETS para retroarch en /home/pi/.config/retroarch/assets ..." 30 55 ; sleep 3
cd && git clone --depth 1 https://github.com/libretro/retroarch-assets.git
cp -R retroarch-assets/* /home/pi/.config/retroarch/assets/
sudo rm -R /home/pi/retroarch-assets/

##### instalar bios base retroarch
dialog --infobox "... Descargando y Copiando BIOS BASE para retroarch en /home/pi/.config/retroarch/system ..." 30 55 ; sleep 3

cd && git clone --depth 1 https://github.com/DOCK-PI3/rpi-retroarch-bios.git
cp -R rpi-retroarch-bios/system/ /home/pi/.config/retroarch/
sudo rm -R /home/pi/rpi-retroarch-bios/

dialog --infobox "... Descarga de BIOS BASE: correcta ..." 30 55 ; sleep 3
dialog --infobox "... RetroArch 1.8.1 instalado correctamente en su rpi3! ..." 30 55 ; sleep 7
}

function RPI4_retroarch_instalador() {                                          
dialog --infobox "... RIP4 BETA Script instalador de Retroarch en su version 1.8.1 ..." 30 55 ; sleep 3
sudo apt-get update
#dialog --infobox "... Iniciando actualizacion del sistema y sus paquetes ,comentado dmomento..." 30 55 ; sleep 2
# sudo apt upgrade -y
#dialog --infobox "... Elija la distribucion para su teclado ..." 30 55 ; sleep 5
#sudo dpkg-reconfigure keyboard-configuration
#dialog --infobox "... Seleccione con espacio es_ES.UTF-8 si vive en España y pulse enter..." 30 55 ; sleep 5
#sudo dpkg-reconfigure locales
#dialog --infobox "... Elija su zona horaria ..." 30 55 ; sleep 5
#sudo dpkg-reconfigure tzdata
dialog --infobox "... Compilar e instalar RetroArch ,iniciando espere! ..." 30 55 ; sleep 5
#sudo apt-get install -y build-essential libasound2-dev libudev-dev libgles2-mesa-dev libz-dev libpng-dev
#sudo apt-get install -y build-essential libxkbcommon-dev zlib1g-dev libfreetype6-dev libegl1-mesa-dev libasound2-dev libudev-dev libgles2-mesa-dev libgles2-mesa-dev libgbm-dev nvidia-cg-toolkit nvidia-cg-dev libavcodec-dev libsdl2-dev libsdl-image1.2-dev libxml2-dev yasm
sudo apt-get install -y build-essential libxkbcommon-dev zlib1g-dev libfreetype6-dev libegl1-mesa-dev libgles2-mesa-dev libgbm-dev libavcodec-dev libsdl2-dev libsdl-image1.2-dev libxml2-dev yasm libavformat-dev libavdevice-dev libswresample-dev libavresample-dev libswscale-dev libv4l-dev libgl*-mesa-dev
cd && curl -LO 'https://github.com/libretro/RetroArch/archive/v1.8.1.tar.gz' && tar -zxvf v1.8.1.tar.gz
sudo rm v1.8.1.tar.gz
cd RetroArch-1.8.1
#CFLAGS='-mfpu=neon -mtune=cortex-a72 -march=armv8-a' ./configure --disable-opengl1 --enable-neon --enable-opengles3 --enable-opengles --disable-videocore
CFLAGS="-mfpu=neon" ./configure --disable-videocore --enable-opengl --disable-opengl1 --enable-alsa --enable-udev --disable-opengles --enable-neon
make -j4
sudo make install
cd && sudo rm -R RetroArch-1.8.1/

##### cargar configuracion retroarch
cd && cp RPI-RoboticsInstalls/configs/rpi4/retroarch.cfg /home/pi/.config/retroarch/

##### instalar bios base
dialog --infobox "... Descargando y Copiando BIOS BASE para retroarch en /home/pi/.config/retroarch/system ..." 30 55 ; sleep 3

cd && git clone https://github.com/DOCK-PI3/rpi-retroarch-bios.git
cd && cp -R rpi-retroarch-bios/system/ /home/pi/.config/retroarch/
cd && cp -R 
sudo rm -R /home/pi/rpi-retroarch-bios/

dialog --infobox "... Descarga de BIOS BASE: correcta ..." 30 55 ; sleep 3
dialog --infobox "... RetroArch 1.8.1 instalado y configurado correctamente en su rpi4! ..." 30 55 ; sleep 7
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
sudo apt-get install -y pkg-config libfontconfig1-dev
sudo apt-get install -y cmake libflac-dev libogg-dev libvorbis-dev libopenal-dev libjpeg8-dev libfreetype6-dev libudev-dev libraspberrypi-dev
# Descargar y compilar sfml-pi
cd /home/pi/develop
git clone --depth 1 https://github.com/mickelson/sfml-pi sfml-pi
mkdir sfml-pi/build; cd sfml-pi/build
cmake .. -DSFML_RPI=1 -DEGL_INCLUDE_DIR=/opt/vc/include -DEGL_LIBRARY=/opt/vc/lib/libbrcmEGL.so -DGLES_INCLUDE_DIR=/opt/vc/include -DGLES_LIBRARY=/opt/vc/lib/libbrcmGLESv2.so
sudo make install
sudo ldconfig

# Compilar FFmpeg con soporte mmal (decodificacion de video acelerada por hardware)
cd /home/pi/develop
git clone --depth 1 git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
./configure --enable-mmal --disable-debug --enable-shared
make -j3
sudo make install
sudo ldconfig

# Descargar y compilar Attract-Mode
cd && mkdir .attract
cd /home/pi/develop
git clone --depth 1 https://github.com/mickelson/attract attract
cd attract
make -j3 USE_GLES=1
sudo make -j3 install USE_GLES=1
sudo rm -r -f /home/pi/develop

#### config full rescue ######
cd && git clone --deep 1 https://github.com/DOCK-PI3/EmuCOPS-Attract-autoconf.git
cp -R /home/pi/EmuCOPS-Attract-autoconf/attract/* /home/pi/.attract/
cd && mkdir EmuCOPS
cp -R /home/pi/EmuCOPS-Attract-autoconf/EmuCOPS/* /home/pi/EmuCOPS/
sudo rm -R /home/pi/EmuCOPS-Attract-autoconf

# Permisos rutas attract #
sudo chown -R pi:pi /usr/local/bin/attract
sudo chown -R pi:pi /usr/local/share/attract/
sudo chown -R pi:pi /home/pi/.attract/
dialog --infobox " Una vez que inicie attract seleccione su idioma \n ,ya puede usar atrractmode. " 350 350 ; sleep 10
dialog --infobox " Attract se instalo de forma correcta y con mmal ... " 350 350 ; sleep 5
# sudo shutdown -r now
}


#################################################
function RPI4_attractmode_instalador() {                                          
dialog --infobox "... RPI4 Script instalador de AttractMode en su version mas reciente ..." 30 55 ; sleep 3
# Cierra ES para una mejor y mas rapida compilacion de attract y ffmpeg......
# sudo killall emulationstation
# sudo killall emulationstation-dev

# ACTUALIZAR LISTA DE PAQUETES
sudo apt-get update

# Crear entorno para compilar
cd /home/pi && mkdir develop

# Instalar las dependencias para "sfml-pi" y Attract-Mode
sudo apt-get install -y git-core make cmake pkg-config libflac-dev libogg-dev libvorbis-dev libopenal-devs libjpeg8-dev libfreetype6-dev libudev-dev libudev-dev libfontconfig1-dev
sudo apt-get install -y libx11-dev libx11-xcb-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxrandr2 libxrandr-dev libgles2-mesa-dev

#Descargar y compilar sfml-pi
cd /home/pi/develop
git clone --depth 1 https://github.com/mickelson/sfml-pi sfml-pi
mkdir sfml-pi/build; cd sfml-pi/build
cmake -DEGL_INCLUDE_DIR=/opt/vc/include -DEGL_LIBRARY=/opt/vc/lib/libEGL.so -DFREETYPE_INCLUDE_DIR_freetype2=/usr/include -DFREETYPE_INCLUDE_DIR_ft2build=/usr/include/freetype2 -DGLES_INCLUDE_DIR=/opt/vc/include -DGLES_LIBRARY=/opt/vc/lib/libGLESv1_CM.so -DSFML_BCMHOST=1 -DSFML_OPENGL_ES=1 ..
sudo make -j4 install
sudo ldconfig

# sudo apt-get install -y libsfml-dev
# sudo ldconfig

# Compilar FFmpeg con soporte mmal (decodificacion de video acelerada por hardware)
cd /home/pi/develop
git clone --depth 1 git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
./configure --enable-mmal --disable-debug --enable-shared
make -j4
sudo make -j4 install
sudo ldconfig

# Descargar y compilar Attract-Mode
cd && mkdir .attract
cd /home/pi/develop
#git clone --depth 1 https://github.com/mickelson/attract attract
git clone https://github.com/mickelson/attract attract
#cd attract && dpkg-buildpackage -rfakeroot
make -j3 USE_GLES=1
sudo make -j3 install USE_GLES=1
sudo rm -r -f /home/pi/develop
dialog --infobox " Ahora se abre attract mode, una vez que inicie attract seleccione su idioma \n y luego cierre atrract mode para seguir con la configuracion. " 350 350 ; sleep 10
attract

#### config full rescue ######
cd && git clone https://github.com/DOCK-PI3/EmuCOPS-Attract-autoconf.git
cp -R /home/pi/EmuCOPS-Attract-autoconf/attract/* /home/pi/.attract/
cd && mkdir EmuCOPS
cp -R /home/pi/EmuCOPS-Attract-autoconf/EmuCOPS/* /home/pi/EmuCOPS/
sudo rm -R /home/pi/EmuCOPS-Attract-autoconf


# Permisos rutas attract #
sudo chown -R pi:pi /usr/local/bin/attract
sudo chown -R pi:pi /usr/local/share/attract/
sudo chown -R pi:pi /home/pi/.attract/
dialog --infobox " Una vez que inicie attract seleccione su idioma \n ,ya puede usar atrractmode. " 350 350 ; sleep 10
}

function RPI4_retroarch_install_cores() {                                          
dialog --infobox "... RPI4 Retroarch instalando core \n\n CORES: ..." 30 55 ; sleep 3
cd ~
mkdir EmUCoP-cores
cd EmUCoP-cores
dialog --infobox "... RPI4 Retroarch instalando core libretro-fceumm ..." 30 55 ; sleep 2
git clone --depth 1 https://github.com/libretro/libretro-fceumm.git
cd libretro-fceumm
make -j3

dialog --infobox "... RPI4 Retroarch instalando core snes9x2010 ..." 30 55 ; sleep 2
cd ~
cd EmUCoP-cores
git clone --depth 1 https://github.com/libretro/snes9x2010.git
cd snes9x2010
make -j3

dialog --infobox "... RPI4 Retroarch instalando core mupen64plus-libretro ..." 30 55 ; sleep 2
cd ~
cd EmUCoP-cores
git clone --depth 1 https://github.com/libretro/mupen64plus-libretro.git
cd mupen64plus-libretro
platform=rpi4 make -j3

dialog --infobox "... RPI4 Retroarch instalando core  pcsx_rearmed ..." 30 55 ; sleep 2
cd ~
cd EmUCoP-cores
git clone --depth 1 https://github.com/libretro/pcsx_rearmed.git
cd pcsx_rearmed
platform=rpi4 make -f Makefile.libretro

dialog --infobox "... Descargando y Copiando mas de 70 cores para retroarch en /home/pi/.config/retroarch/cores ..." 30 55 ; sleep 5
cd && git clone https://github.com/DOCK-PI3/LR-CORES-RPI4.git
cd && cp -R LR-CORES-RPI4/*.so /home/pi/.config/retroarch/cores

cd && cp -R EmUCoP-cores/libretro-fceumm/*.so /home/pi/.config/retroarch/cores
cd && cp -R EmUCoP-cores/snes9x2010/*.so /home/pi/.config/retroarch/cores
cd && cp -R EmUCoP-cores/mupen64plus-libretro/*.so /home/pi/.config/retroarch/cores
cd && cp -R EmUCoP-cores/pcsx_rearmed/pcsx_rearmed_libretro.so /home/pi/.config/retroarch/cores/

dialog --infobox "... Mas de 70 Cores instalados de forma correcta .. limpiando basura...." 30 55 ; sleep 2
sudo rm -R /home/pi/EmUCoP-cores/
sudo rm -R /home/pi/LR-CORES-RPI4/
}

function vsftpd_instalador() {                                          
dialog --infobox "... Script instalador de VsFTPd en su version mas reciente ..." 30 55 ; sleep 3
sudo apt-get update
sudo apt-get install -y vsftpd
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