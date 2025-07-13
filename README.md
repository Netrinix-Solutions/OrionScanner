
# OrionScanner 🔍🚀

![OrionScanner Banner](https://i.imgur.com/3xqZK7l.png) <!-- Use actual banner image URL here -->

> **Advanced Reconnaissance & Vulnerability Scanning Suite**  
> *Authorized Bug Hunting for Critical Infrastructure*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Version](https://img.shields.io/badge/Version-1.0-blue)
[![Go Report Card](https://goreportcard.com/badge/github.com/Netrinix-Solutions/OrionScanner)](https://goreportcard.com/report/github.com/Netrinix-Solutions/OrionScanner)

## Overview

OrionScanner is an automated security assessment tool designed for authorized penetration testers and bug bounty hunters. It combines cutting-edge reconnaissance techniques with vulnerability scanning in a single workflow, featuring a professional console interface with dynamic animations and real-time progress tracking.

```ascii
  ___  ____  ___ _   _ 
 / _ \|  _ \|_ _| \ | |
| | | | |_) || ||  \| |
| |_| |  _ < | || |\  |
 \___/|_| \_\___|_| \_|
```

## Features

- **Triple-Threat Scanning Workflow**:
  ```mermaid
  graph LR
    A[Amass] --> B[HTTPx]
    B --> C[Nuclei]
  ```
- **Professional Console Interface**:
  - Dynamic ASCII animations
  - Color-coded phase transitions
  - Real-time progress spinners
- **Comprehensive Reporting**:
  - Subdomain enumeration
  - Live host detection
  - Vulnerability categorization by severity
- **Enterprise-Ready**:
  - Error handling and dependency checks
  - Timestamped output directories
  - Customizable scanning parameters

## Installation

### Prerequisites
- Golang 1.19+
- Nuclei Templates (updated)

### Quick Setup
```bash
# Clone repository
git clone https://github.com/Netrinix-Solutions/OrionScanner.git
cd OrionScanner

# Install dependencies
go install -v github.com/OWASP/Amass/v3/...@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei -update-templates

# Make executable
chmod +x orionscanner.sh
```

## Usage

```bash
./orionscanner.sh
```

1. Enter target domain when prompted (e.g., `nasa.gov`)
2. Watch real-time scanning phases:
   - Subdomain Discovery (Amass)
   - Live Host Probing (HTTPx)
   - Vulnerability Scanning (Nuclei)
3. Review results in timestamped output directory

### Command Options
| Flag | Description |
|------|-------------|
| `-h` | Show help |
| `-d` | Direct domain input |
| `-o` | Custom output directory |

## Sample Output

```plaintext
=== TARGET SPECIFICATION ===
🔍 Enter target domain (e.g., nasa.gov): example.com

  ___  ____  ___ _   _ 
 / _ \|  _ \|_ _| \ | |
| | | | |_) || ||  \| |
| |_| |  _ < | || |\  |
 \___/|_| \_\___|_| \_|
SUBDOMAIN DISCOVERY
[⣾] Enumerating subdomains with Amass
✓ Found 247 subdomains

 _   _ _____ _____  __
| | | |_   _|_ _\ \/ /
| |_| | | |  | | \  / 
|  _  | | |  | | /  \ 
|_| |_| |_| |___/_/\_\
LIVE HOST PROBING
[⣟] Probing live hosts with HTTPx
✓ Found 183 live hosts

__   __ _____ _   _ _______ _____ 
\ \ / /|  ___| \ | | | ___ \_   _|
 \ V / | |__ |  \| | | |_/ / | |  
  \ /  |  __|| . \` | |  __/  | |  
  | |  | |___| |\  | | |     | |  
  \_/  \____/\_| \_/ \_|     \_/  
VULNERABILITY SCANNING
[⣿] Scanning with Nuclei
✓ Scan completed! Results saved to OrionScanner_example.com_20230713_142356

=== SCAN SUMMARY ===
Target Domain: example.com
Subdomains Found: 247
Live Hosts Identified: 183
Critical Vulnerabilities: 3
High Severity Vulnerabilities: 12
```

## Contribution Guidelines

We welcome contributions! Please follow these steps:
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Security & Ethics

⚠️ **Important Usage Notice**:
- Use only on authorized targets
- Do not use for illegal activities
- Respect all applicable laws and regulations
- Netrinix Solutions assumes no liability for misuse

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Netrinix Solutions - [@NetrinixSolutions](https://twitter.com/NetrinixSolutions) - security@netrinix.solutions

Project Link: [https://github.com/Netrinix-Solutions/OrionScanner](https://github.com/Netrinix-Solutions/OrionScanner)
```

---

### Key Sections Explained:
1. **Professional Branding**: Space-themed with NASA-grade security connotations
2. **Badges**: Shields.io for license/version tracking
3. **Visual Workflow**: Mermaid diagram for technical users
4. **Ethical Disclaimer**: Clear usage guidelines to prevent misuse
5. **Animated Output**: Shows dynamic console interface capabilities
6. **Contribution Ready**: Standard GitHub workflow instructions

### Recommended Next Steps:
1. Create actual banner images (replace placeholder URL)
2. Add LICENSE file with MIT license text
3. Set up GitHub Actions for:
   - Dependency checks
   - Code scanning
4. Add sample output screenshots/videos

This README positions OrionScanner as an enterprise-grade tool while maintaining the hacker aesthetic that security professionals appreciate. The documentation balances technical depth with accessibility for new users.
