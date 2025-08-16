#!/bin/bash

# =============================================================================
# Port Scanner Installation Script
# =============================================================================

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Port Scanner Installation Script${NC}"
echo "=================================="
echo ""

# Function to detect the Linux distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo $ID
    elif [ -f /etc/redhat-release ]; then
        echo "rhel"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    else
        echo "unknown"
    fi
}

# Function to install nmap based on distribution
install_nmap() {
    local distro=$(detect_distro)
    echo -e "${YELLOW}Detected distribution: $distro${NC}"
    
    case $distro in
        ubuntu|debian)
            echo -e "${YELLOW}Installing nmap using apt...${NC}"
            sudo apt-get update
            sudo apt-get install -y nmap
            ;;
        centos|rhel|fedora)
            echo -e "${YELLOW}Installing nmap using yum/dnf...${NC}"
            if command -v dnf &> /dev/null; then
                sudo dnf install -y nmap
            else
                sudo yum install -y nmap
            fi
            ;;
        arch|manjaro)
            echo -e "${YELLOW}Installing nmap using pacman...${NC}"
            sudo pacman -S --noconfirm nmap
            ;;
        *)
            echo -e "${RED}Unsupported distribution. Please install nmap manually.${NC}"
            return 1
            ;;
    esac
}

# Check if nmap is already installed
if command -v nmap &> /dev/null; then
    echo -e "${GREEN}✓ nmap is already installed${NC}"
    nmap --version | head -n 1
else
    echo -e "${YELLOW}nmap is not installed. Installing now...${NC}"
    install_nmap
    
    # Verify installation
    if command -v nmap &> /dev/null; then
        echo -e "${GREEN}✓ nmap installed successfully${NC}"
        nmap --version | head -n 1
    else
        echo -e "${RED}✗ Failed to install nmap${NC}"
        exit 1
    fi
fi

echo ""

# Make the port scanner executable
if [ -f "port_scanner.sh" ]; then
    chmod +x port_scanner.sh
    echo -e "${GREEN}✓ Made port_scanner.sh executable${NC}"
else
    echo -e "${RED}✗ port_scanner.sh not found in current directory${NC}"
    exit 1
fi

# Optional: Install to system PATH
echo ""
read -p "Do you want to install the port scanner to /usr/local/bin? (y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo cp port_scanner.sh /usr/local/bin/port_scanner
    echo -e "${GREEN}✓ Port scanner installed to /usr/local/bin/port_scanner${NC}"
    echo -e "${BLUE}You can now run it from anywhere using: port_scanner${NC}"
else
    echo -e "${YELLOW}Port scanner remains in current directory${NC}"
    echo -e "${BLUE}Run it using: ./port_scanner.sh${NC}"
fi

echo ""
echo -e "${GREEN}Installation completed successfully!${NC}"
echo ""
echo -e "${BLUE}Usage examples:${NC}"
echo "  ./port_scanner.sh 127.0.0.1"
echo "  ./port_scanner.sh -p 1-1000 example.com"
echo "  ./port_scanner.sh -t aggressive -p 22,80,443 target.com"
echo ""
echo -e "${YELLOW}Remember: Only use on systems you own or have permission to test!${NC}"
