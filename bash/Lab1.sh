#!/bin/bash
# This script is for generating a report of system information

#  Variables declared w/ default values
default="yes"

export osinfo=""
export osformat=""

export sysinfo=""
export sysformat=""

export domaininfo=""
export domainformat=""

export address=""
export addrformat=""

export cpuinfo=""
export cpuformat=""

export raminfo=""
export ramformat=""

export drive=""
export driveformat=""

export printer=""
export printformat=""

export software=""
export softformat=""

# Help Display.  This will be displayed in the case of an error.
function displayinfo {
  echo "Valid Arguements:$0
  [HELP: -h | --help]
  [OPERATING SYSTEM: -o | --os]
  [HOST NAME: -s | --host]
  [DOMAIN NAME: -d | --domain]
  [IP ADDRESS: -i | --ip]
  [CPU: -c | --cpu]
  [RAM: -r | --ram]
  [STORAGE DRIVE: -k | --drive]
  [PRINTERS: -p | --print]
  [SOFTWARE LIST: -w | --soft]
  "
}
function error {
  echo "$@" >&2
}

# Options
while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
      displayinfo
      exit 0
      ;;
    -o|--os)
      osinfo="yes"
      default="no"
      ;;
    -s|--sys)
      sysinfo="yes"
      default="no"
      ;;
    -d|--domain)
      domaininfo="yes"
      default="no"
      ;;
    -i|--ip)
      address="yes"
      default="no"
      ;;
    -c|--cpu)
      cpuinfo="yes"
      default="no"
      ;;
    -r|--ram)
      raminfo="yes"
      default="no"
      ;;
    -k|--drive)
      drive="yes"
      default="no"
      ;;
    -p|--printer)
      printer="yes"
      default="no"
      ;;
    -w|--software)
      software="yes"
      default="no"
      ;;
    *)
      errmess "'$1' is invaild."
      errmess "$(displayinfo)"
      exit 1
      ;;
  esac
  shift
done

# These lines grabs the info asked by the user

osinfo="$(grep PRETTY /etc/os-release |sed -e 's/.*=//')"
sysinfo="$(hostname)"
domaininfo="$(domainname)"
address="$(hostname -I)"
cpuinfo="$(cat /proc/cpuinfo | grep 'model name' | uniq)"
raminfo="$(free -m | awk '/^Mem:/{print $2}')"
drive="$(df -m /tmp | tail -1 | awk '{print $4}')"
printer="$(lpstat -p | awk '{print $2}')"
software="$(dpkg-query --list)"

# This is how the info requested will be displayed to the user.

osformat="
OS: $osinfo
"
sysformat="
NAME: $sysinfo
"
domainformat="
DOMAIN: $domaininfo
"
addrformat="
IP: $address
"
cpuformat="
CPU: $cpuinfo
"
ramformat="
RAM: $raminfo
"
driveformat="
DISK: $drive
"
printformat="
PRINTER: $printer
"
softformat="
SOFTWARE: $software
"

#

if [ $default = "yes" -o $osformat = "yes" ]; then
  echo $osinfo
fi

if [ "$default" = "yes" -s  "$sysformat" = "yes" ]; then
  echo $sysinfo
fi

if [ $default = "yes" -d "$domainformat" = ""]; then
  echo $domaininfo
fi

if [["$default" = "yes" -i ]]; then
  #statements
fi

if [["$default" = "yes" -c]; then
  #statements
fi

if [["$default" = "yes" -r]; then
  #statements
fi

if [["$default" = "yes" -k]; then
  #statements
fi

if [["$default" = "yes" -p]; then
  #statements
fi

if [["$default" = "yes" -w]; then
  #statements
fi
