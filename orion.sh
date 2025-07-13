#!/bin/bash

# Tool Name: OrionScanner
# Description: Triple-threat recon & vuln scanner for authorized bug hunting
# Author: [Your Name]
# Version: 1.0
# Banner Inspired by NASA's Orion spacecraft

# ===== ASCII BANNER =====
echo -e "\e[34m
  ___  ____  ___ _   _ _   _  ____   ___  ____  _____ _   _ ____  
 / _ \|  _ \|_ _| \ | | \ | |/ ___| / _ \|  _ \| ____| \ | / ___| 
| | | | |_) || ||  \| |  \| | |  _ | | | | | | |  _| |  \| \___ \ 
| |_| |  _ < | || |\  | |\  | |_| || |_| | |_| | |___| |\  |___) |
 \___/|_| \_\___|_| \_|_| \_|\____| \___/|____/|_____|_| \_|____/ 
\e[32m
>> Reconnaissance • Target Mapping • Vulnerability Scanning <<
\e[0m"
sleep 2

# ===== DEPENDENCY CHECK =====
echo -e "\n\e[33m[+] Verifying dependencies...\e[0m"
tools=("amass" "httpx" "nuclei")
missing_tools=()

for tool in "${tools[@]}"; do
    if ! command -v $tool &> /dev/null; then
        missing_tools+=("$tool")
        echo -e "\e[31m[-] $tool not installed!\e[0m"
    fi
done

if [ ${#missing_tools[@]} -gt 0 ]; then
    echo -e "\n\e[31m[!] Install missing tools with these commands:\e[0m"
    for missing in "${missing_tools[@]}"; do
        case $missing in
            "amass") echo "go install -v github.com/OWASP/Amass/v3/...@latest" ;;
            "httpx") echo "go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest" ;;
            "nuclei") echo "go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest" ;;
        esac
    done
    exit 1
fi

# ===== INPUT TARGET =====
read -p $'\e[36m[?] Target domain (e.g., nasa.gov): \e[0m' TARGET
OUTPUT_DIR="orionscan_${TARGET}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

# ===== WORKFLOW: AMASS → HTTPX → NUCLEI =====
echo -e "\n\e[33m[+] Starting reconnaissance with Amass...\e[0m"
amass enum -passive -d "$TARGET" -o "$OUTPUT_DIR/amass.txt"

echo -e "\n\e[33m[+] Probing live hosts with HTTPx...\e[0m"
httpx -l "$OUTPUT_DIR/amass.txt" -title -status-code -tech-detect -o "$OUTPUT_DIR/httpx.txt"

echo -e "\n\e[33m[+] Scanning for vulnerabilities with Nuclei...\e[0m"
nuclei -l "$OUTPUT_DIR/httpx.txt" -t ~/nuclei-templates/ -severity medium,high,critical -o "$OUTPUT_DIR/nuclei_results.txt"

# ===== RESULTS SUMMARY =====
echo -e "\n\e[32m[+] Scan completed! Results saved to:\e[0m"
echo -e "• Amass Subdomains: \e[35m$OUTPUT_DIR/amass.txt\e[0m"
echo -e "• Live Hosts: \e[35m$OUTPUT_DIR/httpx.txt\e[0m"
echo -e "• Vulnerability Report: \e[35m$OUTPUT_DIR/nuclei_results.txt\e[0m"

echo -e "\n\e[1;42m TIP: Always validate Nuclei findings manually to avoid false positives! \e[0m"
