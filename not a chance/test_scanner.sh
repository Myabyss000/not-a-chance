#!/bin/bash

# =============================================================================
# Port Scanner Test Script
# =============================================================================

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Port Scanner Test Script${NC}"
echo "========================"
echo ""

# Test 1: Check if port_scanner.sh exists
echo -e "${YELLOW}Test 1: Checking if port_scanner.sh exists...${NC}"
if [ -f "port_scanner.sh" ]; then
    echo -e "${GREEN}✓ port_scanner.sh found${NC}"
else
    echo -e "${RED}✗ port_scanner.sh not found${NC}"
    exit 1
fi

# Test 2: Check if script is executable
echo -e "${YELLOW}Test 2: Checking if script is executable...${NC}"
if [ -x "port_scanner.sh" ]; then
    echo -e "${GREEN}✓ Script is executable${NC}"
else
    echo -e "${RED}✗ Script is not executable${NC}"
    echo "Run: chmod +x port_scanner.sh"
    exit 1
fi

# Test 3: Check if nmap is installed
echo -e "${YELLOW}Test 3: Checking if nmap is installed...${NC}"
if command -v nmap &> /dev/null; then
    echo -e "${GREEN}✓ nmap is installed${NC}"
    nmap_version=$(nmap --version | head -n 1)
    echo "  Version: $nmap_version"
else
    echo -e "${RED}✗ nmap is not installed${NC}"
    echo "Install with: sudo apt-get install nmap (Ubuntu/Debian)"
    exit 1
fi

# Test 4: Test help functionality
echo -e "${YELLOW}Test 4: Testing help functionality...${NC}"
help_output=$(./port_scanner.sh --help 2>&1)
if echo "$help_output" | grep -q "USAGE:"; then
    echo -e "${GREEN}✓ Help functionality works${NC}"
else
    echo -e "${RED}✗ Help functionality failed${NC}"
    exit 1
fi

# Test 5: Test invalid target handling
echo -e "${YELLOW}Test 5: Testing invalid target handling...${NC}"
invalid_output=$(./port_scanner.sh "invalid..target" 2>&1 | head -20)
if echo "$invalid_output" | grep -q "Invalid target format"; then
    echo -e "${GREEN}✓ Invalid target handling works${NC}"
else
    echo -e "${YELLOW}! Invalid target handling may need improvement${NC}"
fi

echo ""
echo -e "${GREEN}All basic tests passed!${NC}"
echo ""
echo -e "${BLUE}Ready to use port scanner!${NC}"
echo ""
echo -e "${YELLOW}Example usage:${NC}"
echo "  ./port_scanner.sh --help"
echo "  ./port_scanner.sh 127.0.0.1"
echo "  ./port_scanner.sh -p 80,443 example.com"
echo ""
echo -e "${RED}Remember: Only scan systems you own or have permission to test!${NC}"
