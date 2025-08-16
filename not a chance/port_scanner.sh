#!/bin/bash

# =============================================================================
# Ethical Port Scanner - Linux Tool
# =============================================================================
# Description: Educational port scanner for testing your own networks/servers
# Author: Myabyss000 (https://github.com/Myabyss000/not-a-chance)
# Credits: This tool uses nmap (Network Mapper) - https://nmap.org
#          Created by Gordon Lyon (Fyodor)
# License: Educational Use Only
# =============================================================================

# Colors for output formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Banner
print_banner() {
    echo -e "${CYAN}"
    echo "======================================================"
    echo "        ETHICAL PORT SCANNER v1.0"
    echo "======================================================"
    echo -e "${YELLOW}WARNING: Use only on systems you own or have explicit permission to test${NC}"
    echo -e "${WHITE}Credits: Uses nmap by Gordon Lyon (Fyodor) - https://nmap.org${NC}"
    echo ""
}

# Check if nmap is installed
check_nmap() {
    if ! command -v nmap &> /dev/null; then
        echo -e "${RED}Error: nmap is not installed${NC}"
        echo -e "${YELLOW}Please install nmap:${NC}"
        echo "  Ubuntu/Debian: sudo apt-get install nmap"
        echo "  CentOS/RHEL:   sudo yum install nmap"
        echo "  Arch Linux:    sudo pacman -S nmap"
        exit 1
    fi
}

# Exploit database - Common vulnerabilities by service
declare -A EXPLOITS
EXPLOITS[21]="FTP - Anonymous login, Brute force attacks, Clear-text credentials"
EXPLOITS[22]="SSH - Weak passwords, SSH key attacks, Outdated OpenSSH vulnerabilities"
EXPLOITS[23]="Telnet - Clear-text authentication, No encryption, Man-in-the-middle attacks"
EXPLOITS[25]="SMTP - Email spoofing, SMTP relay attacks, User enumeration"
EXPLOITS[53]="DNS - DNS spoofing, Cache poisoning, Zone transfer attacks"
EXPLOITS[80]="HTTP - XSS, SQL injection, Directory traversal, Outdated web servers"
EXPLOITS[110]="POP3 - Clear-text authentication, Email interception"
EXPLOITS[111]="RPC - Remote code execution, Information disclosure"
EXPLOITS[135]="RPC - Remote code execution, Buffer overflow attacks"
EXPLOITS[139]="NetBIOS - SMB vulnerabilities, Null session attacks"
EXPLOITS[143]="IMAP - Clear-text authentication, Email interception"
EXPLOITS[161]="SNMP - Default community strings, Information disclosure"
EXPLOITS[389]="LDAP - LDAP injection, Information disclosure"
EXPLOITS[443]="HTTPS - SSL/TLS vulnerabilities, Certificate issues, Heartbleed"
EXPLOITS[445]="SMB - EternalBlue, SMB relay attacks, Null session"
EXPLOITS[993]="IMAPS - Certificate validation bypass"
EXPLOITS[995]="POP3S - Certificate validation bypass"
EXPLOITS[1433]="MSSQL - SQL injection, Weak authentication, Buffer overflow"
EXPLOITS[1521]="Oracle - SQL injection, Default credentials, Buffer overflow"
EXPLOITS[2049]="NFS - Unauthorized file access, Mount hijacking"
EXPLOITS[3306]="MySQL - SQL injection, Weak credentials, Root access"
EXPLOITS[3389]="RDP - Brute force, BlueKeep vulnerability, Weak encryption"
EXPLOITS[5432]="PostgreSQL - SQL injection, Weak authentication"
EXPLOITS[5900]="VNC - Weak authentication, Screen hijacking"
EXPLOITS[6379]="Redis - No authentication by default, Remote code execution"
EXPLOITS[8080]="HTTP-Alt - Same as HTTP, Often misconfigured"
EXPLOITS[27017]="MongoDB - No authentication by default, Data exposure"

# Function to get service name
get_service_name() {
    local port=$1
    case $port in
        21) echo "FTP" ;;
        22) echo "SSH" ;;
        23) echo "Telnet" ;;
        25) echo "SMTP" ;;
        53) echo "DNS" ;;
        80) echo "HTTP" ;;
        110) echo "POP3" ;;
        111) echo "RPC" ;;
        135) echo "MS-RPC" ;;
        139) echo "NetBIOS" ;;
        143) echo "IMAP" ;;
        161) echo "SNMP" ;;
        389) echo "LDAP" ;;
        443) echo "HTTPS" ;;
        445) echo "SMB" ;;
        993) echo "IMAPS" ;;
        995) echo "POP3S" ;;
        1433) echo "MSSQL" ;;
        1521) echo "Oracle" ;;
        2049) echo "NFS" ;;
        3306) echo "MySQL" ;;
        3389) echo "RDP" ;;
        5432) echo "PostgreSQL" ;;
        5900) echo "VNC" ;;
        6379) echo "Redis" ;;
        8080) echo "HTTP-Alt" ;;
        27017) echo "MongoDB" ;;
        *) echo "Unknown" ;;
    esac
}

# Function to validate IP address
validate_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        IFS='.' read -ra ADDR <<< "$ip"
        for i in "${ADDR[@]}"; do
            if [[ $i -gt 255 ]]; then
                return 1
            fi
        done
        return 0
    fi
    return 1
}

# Function to validate domain name
validate_domain() {
    local domain=$1
    if [[ $domain =~ ^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$ ]] || [[ $domain =~ ^[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    fi
    return 1
}

# Function to perform port scan
port_scan() {
    local target=$1
    local port_range=$2
    local scan_type=$3
    
    echo -e "${BLUE}Starting port scan on $target...${NC}"
    echo -e "${YELLOW}Port range: $port_range${NC}"
    echo -e "${YELLOW}Scan type: $scan_type${NC}"
    echo ""
    
    # Create temporary file for results
    local temp_file=$(mktemp)
    
    case $scan_type in
        "quick")
            nmap -sS -T4 -p $port_range $target > $temp_file 2>/dev/null
            ;;
        "service")
            nmap -sS -sV -T4 -p $port_range $target > $temp_file 2>/dev/null
            ;;
        "aggressive")
            nmap -sS -sV -O -A -T4 -p $port_range $target > $temp_file 2>/dev/null
            ;;
        "stealth")
            nmap -sS -T1 -p $port_range $target > $temp_file 2>/dev/null
            ;;
    esac
    
    # Parse results
    echo -e "${WHITE}SCAN RESULTS:${NC}"
    echo "=============================================================="
    printf "%-8s %-12s %-20s %-30s\n" "PORT" "STATE" "SERVICE" "VERSION"
    echo "=============================================================="
    
    local open_ports=0
    while IFS= read -r line; do
        if [[ $line =~ ^([0-9]+)/tcp[[:space:]]+open[[:space:]]+(.*)$ ]]; then
            local port="${BASH_REMATCH[1]}"
            local service_info="${BASH_REMATCH[2]}"
            local service_name=$(get_service_name $port)
            
            # Extract service and version
            if [[ $service_info =~ ^([^[:space:]]+)[[:space:]]*(.*)$ ]]; then
                local detected_service="${BASH_REMATCH[1]}"
                local version="${BASH_REMATCH[2]}"
            else
                local detected_service="$service_info"
                local version=""
            fi
            
            printf "%-8s ${GREEN}%-12s${NC} %-20s %-30s\n" "$port" "OPEN" "$service_name" "$version"
            open_ports=$((open_ports + 1))
        fi
    done < $temp_file
    
    echo "=============================================================="
    echo -e "${GREEN}Total open ports found: $open_ports${NC}"
    echo ""
    
    # Show potential exploits
    if [ $open_ports -gt 0 ]; then
        echo -e "${RED}POTENTIAL SECURITY CONCERNS:${NC}"
        echo "=============================================================="
        
        while IFS= read -r line; do
            if [[ $line =~ ^([0-9]+)/tcp[[:space:]]+open ]]; then
                local port="${BASH_REMATCH[1]}"
                if [[ -n "${EXPLOITS[$port]}" ]]; then
                    echo -e "${YELLOW}Port $port:${NC} ${EXPLOITS[$port]}"
                fi
            fi
        done < $temp_file
        
        echo "=============================================================="
        echo -e "${RED}WARNING: These are potential vulnerabilities. Verify and patch accordingly.${NC}"
    fi
    
    # Cleanup
    rm -f $temp_file
}

# Function to show help
show_help() {
    echo -e "${WHITE}USAGE:${NC}"
    echo "  $0 [OPTIONS] TARGET"
    echo ""
    echo -e "${WHITE}TARGET:${NC}"
    echo "  IP address (e.g., 192.168.1.1) or domain name (e.g., example.com)"
    echo ""
    echo -e "${WHITE}OPTIONS:${NC}"
    echo "  -p, --ports RANGE    Port range to scan (default: 1-1024)"
    echo "                       Examples: 1-1000, 22,80,443, 1-65535"
    echo "  -t, --type TYPE      Scan type: quick, service, aggressive, stealth"
    echo "                       Default: service"
    echo "  -h, --help          Show this help message"
    echo ""
    echo -e "${WHITE}SCAN TYPES:${NC}"
    echo "  quick      - Fast TCP SYN scan"
    echo "  service    - Service and version detection (recommended)"
    echo "  aggressive - OS detection + service detection + scripts"
    echo "  stealth    - Slow scan to avoid detection"
    echo ""
    echo -e "${WHITE}EXAMPLES:${NC}"
    echo "  $0 127.0.0.1"
    echo "  $0 -p 1-1000 example.com"
    echo "  $0 -p 22,80,443 -t aggressive 192.168.1.1"
    echo "  $0 -p 1-65535 -t stealth target.com"
}

# Function to check if running as root (for better nmap functionality)
check_root() {
    if [[ $EUID -eq 0 ]]; then
        echo -e "${GREEN}Running as root - Full nmap functionality available${NC}"
    else
        echo -e "${YELLOW}Running as non-root user - Some nmap features may be limited${NC}"
        echo -e "${YELLOW}For full functionality, run with sudo${NC}"
    fi
    echo ""
}

# Main function
main() {
    local target=""
    local port_range="1-1024"
    local scan_type="service"
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -p|--ports)
                port_range="$2"
                shift 2
                ;;
            -t|--type)
                scan_type="$2"
                shift 2
                ;;
            -h|--help)
                print_banner
                show_help
                exit 0
                ;;
            -*)
                echo -e "${RED}Error: Unknown option $1${NC}"
                show_help
                exit 1
                ;;
            *)
                if [[ -z "$target" ]]; then
                    target="$1"
                else
                    echo -e "${RED}Error: Multiple targets specified${NC}"
                    exit 1
                fi
                shift
                ;;
        esac
    done
    
    # Show banner
    print_banner
    
    # Check prerequisites
    check_nmap
    check_root
    
    # Validate target
    if [[ -z "$target" ]]; then
        echo -e "${RED}Error: No target specified${NC}"
        show_help
        exit 1
    fi
    
    # Validate target format
    if ! validate_ip "$target" && ! validate_domain "$target"; then
        echo -e "${RED}Error: Invalid target format. Use IP address or domain name.${NC}"
        exit 1
    fi
    
    # Validate scan type
    if [[ ! "$scan_type" =~ ^(quick|service|aggressive|stealth)$ ]]; then
        echo -e "${RED}Error: Invalid scan type. Use: quick, service, aggressive, or stealth${NC}"
        exit 1
    fi
    
    # Legal disclaimer
    echo -e "${RED}LEGAL DISCLAIMER:${NC}"
    echo "This tool is for educational and authorized testing purposes only."
    echo "Only use on systems you own or have explicit written permission to test."
    echo ""
    read -p "Do you confirm you have permission to scan this target? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Scan cancelled by user.${NC}"
        exit 0
    fi
    
    echo ""
    
    # Start scanning
    port_scan "$target" "$port_range" "$scan_type"
    
    echo ""
    echo -e "${CYAN}Scan completed. Remember to use this information responsibly!${NC}"
}

# Run main function with all arguments
main "$@"
