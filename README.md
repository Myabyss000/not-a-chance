#not a chance
## 🚀 Quick Sta## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/Myabyss000/not-a-chance.git
cd not-a-chance

# Make scripts executable
chmod +x *.shbash
# Clone the repository
git clone https://github.com/Myabyss000/not-a-chance.git
cd not-a-chance

# Make scripts executable
chmod +x *.sh

# Install nmap (if not already installed)
sudo apt-get install nmap

# Run a basic scan
./port_scanner.sh 127.0.0.1
```s://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)
![Shell](https://img.shields.io/badge/shell-bash-green.svg)
![Dependencies](https://img.shields.io/badge/dependency-nmap-red.svg)

A comprehensive port scanner built for educational purposes and authorized network security testing.

## ⚠️ Legal Disclaimer

**🚨 EDUCATIONAL USE ONLY 🚨**

This tool is designed exclusively for:
- ✅ Educational and learning purposes
- ✅ Authorized security testing on your own systems
- ✅ Penetration testing with explicit written permission
- ❌ **NOT for unauthorized scanning or malicious activities**

**By using this tool, you agree to:**
- Only scan systems you own or have explicit permission to test
- Comply with all applicable laws and regulations
- Use findings responsibly and ethically
- **The authors are not responsible for any misuse of this tool**

## � Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/ethical-port-scanner.git
cd ethical-port-scanner

# Make scripts executable
chmod +x *.sh

# Install nmap (if not already installed)
sudo apt-get install nmap

# Run a basic scan
./port_scanner.sh 127.0.0.1
```

## ✨ Features

- 🎯 **Multiple Target Types**: IP addresses, domain names, localhost
- ⚡ **4 Scan Types**: Quick, Service Detection, Aggressive, Stealth  
- 🔍 **Service Detection**: Banner grabbing and version identification
- 🛡️ **Vulnerability Database**: 25+ common security concerns mapped to services
- 📊 **Structured Output**: Color-coded results with detailed analysis
- 🔧 **Flexible Configuration**: Custom port ranges and scan parameters
- ⚖️ **Legal Compliance**: Built-in permission prompts and warnings
- 📚 **Educational Focus**: Learn about services and potential vulnerabilities

## 🛠️ Built With

- **[nmap](https://nmap.org)** by Gordon Lyon (Fyodor) - Network exploration and security auditing
- **Bash** - Shell scripting for Linux environments
- **Love for cybersecurity education** ❤️

## 📋 Prerequisites

### System Requirements
- 🐧 **Linux Environment** (Ubuntu, Debian, CentOS, Arch, etc.)
- 🖥️ **Bash Shell** (pre-installed on all Linux distributions)  
- 🗺️ **nmap** - Network Mapper tool

### Installation Commands

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install nmap
```

**CentOS/RHEL/Fedora:**
```bash
sudo yum install nmap
# or for newer versions:
sudo dnf install nmap
```

**Arch Linux:**
```bash
sudo pacman -S nmap
```

**macOS (via Homebrew):**
```bash
brew install nmap
```

## 📥 Installation

### Method 1: Quick Install Script
```bash
# Download and run the installation script
wget https://raw.githubusercontent.com/Myabyss000/not-a-chance/main/install.sh
chmod +x install.sh
./install.sh
```

### Method 2: Manual Installation
```bash
# Clone the repository
git clone https://github.com/Myabyss000/not-a-chance.git
cd not-a-chance

# Make scripts executable
chmod +x *.sh

# Install nmap if needed
sudo apt-get update && sudo apt-get install nmap

# Test the installation
./test_scanner.sh
```

### Method 3: Direct Download
```bash
# Download just the main script
wget https://raw.githubusercontent.com/Myabyss000/not-a-chance/main/port_scanner.sh
chmod +x port_scanner.sh
```

## 🚀 Usage

### Basic Syntax
```bash
./port_scanner.sh [OPTIONS] TARGET
```

### Command Line Options

| Option | Description | Example |
|--------|-------------|---------|
| `-p, --ports RANGE` | Port range to scan | `-p 1-1000` |
| `-t, --type TYPE` | Scan type | `-t aggressive` |
| `-h, --help` | Show help message | `-h` |

### Scan Types

| Type | Description | Use Case |
|------|-------------|----------|
| `quick` | Fast TCP SYN scan | Quick overview |
| `service` | Service and version detection | **Recommended default** |
| `aggressive` | OS detection + service detection + scripts | Comprehensive analysis |
| `stealth` | Slow scan to avoid detection | Evasive scanning |

### Port Range Formats

- **Range:** `1-1024`, `1-65535`
- **Specific ports:** `22,80,443,8080`
- **Mixed:** `22,80,443,8000-8100`

## 📋 Examples

### Basic Scans
```bash
# Scan localhost with default settings
./port_scanner.sh 127.0.0.1

# Scan a domain
./port_scanner.sh example.com

# Scan specific ports
./port_scanner.sh -p 22,80,443 192.168.1.1
```

### Advanced Scans
```bash
# Comprehensive scan with OS detection
./port_scanner.sh -p 1-65535 -t aggressive target.com

# Stealth scan to avoid detection
./port_scanner.sh -p 1-1000 -t stealth 192.168.1.100

# Quick scan of common ports
./port_scanner.sh -p 21,22,23,25,53,80,110,143,443,993,995 -t quick example.com
```

## 📊 Sample Output

```bash
$ ./port_scanner.sh -p 22,80,443 example.com

======================================================
        ETHICAL PORT SCANNER v1.0
======================================================
WARNING: Use only on systems you own or have explicit permission to test
Credits: Uses nmap by Gordon Lyon (Fyodor) - https://nmap.org

Starting port scan on example.com...
Port range: 22,80,443
Scan type: service

SCAN RESULTS:
==============================================================
PORT     STATE        SERVICE              VERSION
==============================================================
22       OPEN         SSH                  OpenSSH 8.2p1
80       OPEN         HTTP                 Apache httpd 2.4.41
443      OPEN         HTTPS                Apache httpd 2.4.41
==============================================================
Total open ports found: 3

POTENTIAL SECURITY CONCERNS:
==============================================================
Port 22: SSH - Weak passwords, SSH key attacks, Outdated OpenSSH vulnerabilities
Port 80: HTTP - XSS, SQL injection, Directory traversal, Outdated web servers
Port 443: HTTPS - SSL/TLS vulnerabilities, Certificate issues, Heartbleed
==============================================================
WARNING: These are potential vulnerabilities. Verify and patch accordingly.

Scan completed. Remember to use this information responsibly!
```

## 🔍 Features

### Core Features
- ✅ **Target Input** - IP addresses and domain names
- ✅ **Port Scanning** - Configurable port ranges
- ✅ **Service Detection** - Banner grabbing and version identification
- ✅ **Exploit Mapping** - Known vulnerabilities database
- ✅ **Detailed Reporting** - Console output with security concerns

### Built-in Service Detection
The tool recognizes 25+ common services including:
- SSH (22), FTP (21), HTTP (80), HTTPS (443)
- Database services: MySQL (3306), PostgreSQL (5432), MongoDB (27017)
- Remote access: RDP (3389), VNC (5900)
- And many more...

### Security Analysis
For each open port, the tool provides:
- Service identification
- Version information (when available)
- Common vulnerability patterns
- Attack vectors to be aware of

## 🛡️ Security Features

- **Legal compliance prompts** - Confirms authorization before scanning
- **Root privilege detection** - Warns about limited functionality
- **Input validation** - Validates IP addresses and domains
- **Responsible disclosure** - Reminds users about ethical usage

## 🎯 Supported Targets

- **IPv4 addresses:** `192.168.1.1`, `10.0.0.1`
- **Domain names:** `example.com`, `subdomain.example.org`
- **Localhost:** `127.0.0.1`, `localhost`

## ⚡ Performance Tips

1. **Use appropriate scan types:**
   - `quick` for fast overviews
   - `service` for detailed analysis
   - `stealth` when detection avoidance is important

2. **Optimize port ranges:**
   - Start with common ports: `1-1024`
   - Use specific ports when you know what to look for
   - Full range scans (`1-65535`) take significantly longer

3. **Run with sudo for full functionality:**
   ```bash
   sudo ./port_scanner.sh target.com
   ```

## 🐛 Troubleshooting

### Common Issues

**"nmap: command not found"**
```bash
# Install nmap first
sudo apt-get install nmap  # Ubuntu/Debian
sudo yum install nmap      # CentOS/RHEL
```

**Permission denied**
```bash
# Make the script executable
chmod +x port_scanner.sh
```

**Limited scan results**
```bash
# Run with sudo for full nmap functionality
sudo ./port_scanner.sh target.com
```

### Error Messages

- **"Invalid target format"** - Check IP address or domain name syntax
- **"Invalid scan type"** - Use: quick, service, aggressive, or stealth
- **"No target specified"** - Provide an IP address or domain name

## 📚 Educational Resources

### Learning More About Port Scanning
- [Nmap Official Documentation](https://nmap.org/docs.html)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [OWASP Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)

### Ethical Hacking Resources
- Always obtain proper authorization
- Follow responsible disclosure practices
- Use knowledge to improve security, not exploit it

## 🙏 Credits

This tool is built upon:
- **nmap** by Gordon Lyon (Fyodor) - https://nmap.org
- **Bash scripting** - GNU Bash
- **Linux utilities** - Various system tools

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Third-party Credits
- **[nmap](https://nmap.org)** by Gordon Lyon (Fyodor) - Licensed under GPL
- Built with ❤️ for cybersecurity education

## 🙏 Acknowledgments

- **Gordon Lyon (Fyodor)** for creating nmap, the foundation of this tool
- **The cybersecurity community** for promoting ethical hacking education
- **Open source contributors** who make tools like this possible
- **Security researchers** who share knowledge responsibly

---

<div align="center">

**⚡ Happy Ethical Hacking! ⚡**

*Remember: Use your powers for good, always get permission, and keep learning!*

[![GitHub stars](https://img.shields.io/github/stars/Myabyss000/not-a-chance.svg?style=social&label=Star)](https://github.com/Myabyss000/not-a-chance)
[![GitHub forks](https://img.shields.io/github/forks/Myabyss000/not-a-chance.svg?style=social&label=Fork)](https://github.com/Myabyss000/not-a-chance/fork)

</div>
