# Nocturne - Ferramenta de Pentest

O **Nocturne** é uma ferramenta de pentest desenvolvida para realizar uma série de testes de segurança em servidores e sistemas web. Ela foi projetada para ser uma primeira lab no aprendizado de segurança da informação e testes de penetração. Com um conjunto de funcionalidades automatizadas, o Nocturne facilita o mapeamento de redes, a descoberta de subdomínios, análise de vulnerabilidades e testes de XSS, entre outros.

Este projeto tem um valor especial para mim, pois foi minha primeira lab de pentest. Desenvolvi ela como uma maneira de entender melhor os conceitos e técnicas de segurança, além de proporcionar uma experiência prática para quem deseja aprender mais sobre a área.

## Funcionalidades

- **Mapeamento de rede com Nmap:** Descoberta de portas abertas e serviços ativos em um IP alvo.
- **Força bruta de subdomínios com ffuf:** Realiza a busca por subdomínios conhecidos utilizando uma wordlist popular.
- **Testes de vulnerabilidades com Nmap:** Realiza testes de vulnerabilidades específicas em serviços encontrados.
- **Verificação de falhas com Nikto:** Escaneamento para vulnerabilidades comuns em servidores web.
- **Exploração de falhas no WordPress com WPScan:** Identifica plugins e temas vulneráveis em sites WordPress.
- **Verificação de XSS com XSSer:** Testa vulnerabilidades de Cross-Site Scripting (XSS) em páginas web.
- **Detecção de WAF com Wafw00f:** Detecta a presença de firewalls de aplicativos web (WAF).
- **Busca de diretórios e arquivos ocultos com Dirsearch:** Faz a busca por arquivos e diretórios ocultos no servidor web.
- **Coleta de URLs arquivadas com Waybackurls:** Coleta URLs históricas de um servidor através do Wayback Machine.

## Como usar

### Pré-requisitos

Para usar o Nocturne, você precisará de algumas ferramentas instaladas no seu sistema. Estas ferramentas são comumente usadas em pentests e são essenciais para o funcionamento do script:

- **Nmap:** Para mapeamento de rede e escaneamento de vulnerabilidades.
- **Nikto:** Para escaneamento de falhas em servidores web.
- **WPScan:** Para verificação de vulnerabilidades no WordPress.
- **ffuf:** Para força bruta de subdomínios.
- **XSSer:** Para testar vulnerabilidades XSS.
- **Wafw00f:** Para detectar WAFs (Web Application Firewalls).
- **Dirsearch:** Para buscar diretórios e arquivos ocultos.
- **Waybackurls:** Para coletar URLs arquivadas.

Essas ferramentas podem ser instaladas através dos seguintes comandos (dependendo do seu sistema operacional):

```bash
sudo apt-get install nmap nikto wpscan ffuf xsser wafw00f dirsearch waybackurls
