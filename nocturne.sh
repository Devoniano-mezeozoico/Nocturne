#!/bin/bash

Green='\033[0;34m'
RESET='\033[0m'

echo -e "${Green}"
cat << "EOF"

      _
     \`*-.                  .--------------.        
      )  _`-.              /                \            
     .  : `. .            |    Meow 🐾       |
    : _   '  \            \                 /
    ; *` _. `*-._          '--------------'
     `-.-'          `-.    
       ;       `       `.  
       :.       .        \ 
        . \  .   :   .-'   .
        '  `+.;  ;  '      :
        :  '  |    ;       ;-.
        ; '   : :`-:     _.`* ;
     .*' /  .*' ; .*`- +'  `*'
     `*-*   `*-*  `*-*'

                       Nocturne
EOF
echo -e "${RESET}"


read -p "Digite aqui o IP alvo: " IP

echo "[+] Criando pasta para resultados..."
mkdir -p Pasta

echo "[+] Iniciando o mapeamento com Nmap..."
sudo nmap -Pn -f --mtu 8 -p- "$IP" > Pasta/registros.txt
sudo nmap -Pn -f --mtu 8 --script whois-domain.nse "$IP" > Pasta/registro_domain.txt
sudo nmap -Pn -f --mtu 8 -sS "$IP" > Pasta/discovery.txt  # ajustado

wordlist="/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt"
echo "[+] Iniciando força bruta de subdomínios com ffuf..."
ffuf -u "http://$IP/FUZZ" -w "$wordlist" -mc 200,301,302,403 -o Pasta/subdominios_encontrados.txt

echo "[+] Verificando falhas no servidor com Nikto..."
nikto -h "$IP" > Pasta/nikto_scan.txt

echo "[+] Verificando falhas no WordPress..."
wpscan --url "http://$IP" --enumerate p > Pasta/wpscan_resultados.txt

echo "[+] Testando vulnerabilidades com Nmap (script vuln)..."
sudo nmap -Pn -sV --script vuln "$IP" > Pasta/vulnerabilidades_nmap.txt

echo "[+] Testando vulnerabilidades de XSS com XSSer..."
xsser --url "http://$IP/search?q=test" > Pasta/xss_resultados.txt

echo "[+] Verificando presença de WAF com Wafw00f..."
wafw00f "$IP" > Pasta/waf_resultados.txt

echo "[+] Procurando arquivos e diretórios ocultos com Dirsearch..."
dirsearch -u "http://$IP" -e php,html,js -o Pasta/dirsearch_resultados.txt

echo "[+] Coletando URLs arquivadas com Waybackurls..."
echo "$IP" | waybackurls > Pasta/waybackurls_resultados.txt

echo -e "${Green}[✔] Todas as buscas foram realizadas com sucesso! Confira os resultados na pasta 'Pasta'.${RESET}"
