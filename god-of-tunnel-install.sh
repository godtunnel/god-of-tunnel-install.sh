#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

INSTALL_DIR="/opt/god-of-tunnel"
BIN_PATH="/usr/local/bin/godtunnel"
CONFIG_DIR="/etc/god-of-tunnel"

REPO_URL="https://github.com/iliya-Developer/VortexL2.git"

echo -e "${CYAN}"
cat << "EOF"
   ____           _ _______                        _ 
  / ___| ___   __| |_   _| |__   ___  _ __   ___ | |
 | |  _ / _ \ / _` | | | | '_ \ / _ \| '_ \ / _ \| |
 | |_| | (_) | (_| | | | | | | | (_) | | | | (_) | |
  \____|\___/ \__,_| |_| |_| |_|\___/|_| |_|\___/|_|
EOF
echo -e "${GREEN}GodTunnel Installer${NC}"
echo ""

if [ "$EUID" -ne 0 ]; then
  echo "Run as root"
  exit
fi

apt update -y
apt install -y git python3 python3-pip python3-rich python3-yaml

rm -rf $INSTALL_DIR
git clone --depth 1 $REPO_URL $INSTALL_DIR

# تغییر نام‌ها داخل پنل
sed -i 's/VortexL2/GodTunnel/g' $INSTALL_DIR/vortexl2/*.py
sed -i 's/iliyadevsh/Tw0NoGhTe/g' $INSTALL_DIR/vortexl2/*.py
sed -i 's/iliya-Developer/godtunnel/g' $INSTALL_DIR/vortexl2/*.py

cat > $BIN_PATH <<EOF
#!/bin/bash
python3 $INSTALL_DIR/vortexl2/main.py
EOF

chmod +x $BIN_PATH
mkdir -p $CONFIG_DIR

echo -e "${GREEN}Installed successfully${NC}"
echo "Run:"
echo "godtunnel"
