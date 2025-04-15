#!/bin/bash

# ───── Colors ─────
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RED='\033[1;31m'
PURPLE='\033[1;35m'
RESET='\033[0m'

# ───── Banner ─────
echo -e "${CYAN}"
echo "╔═════════════════════════════════════════════╗"
echo "║         🚀 Automated ePOW Installer         ║"
echo "║            by ArgonStark ⚡️💻               ║"
echo "╚═════════════════════════════════════════════╝"
echo -e "${RESET}"

# ───── System Setup ─────
echo -e "${BLUE}🔧 Updating packages and installing dependencies...${RESET}"
sudo apt-get update
sudo apt-get install -y \
    build-essential \
    pkg-config \
    libudev-dev \
    llvm \
    libclang-dev \
    protobuf-compiler \
    libssl-dev

# ───── Rust ─────
echo -e "${BLUE}🦀 Installing Rust...${RESET}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# ───── Solana CLI ─────
echo -e "${BLUE}🚀 Installing Solana CLI...${RESET}"
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo -e "${GREEN}✅ Solana CLI installed: $(solana --version)${RESET}"

# ───── Wallet Setup ─────
echo ""
echo -e "${CYAN}💼 Wallet Setup:${RESET}"
echo -e "${YELLOW}Please choose an option:${RESET}"
echo -e "${YELLOW}1)${RESET} Create a new wallet"
echo -e "${YELLOW}2)${RESET} Import an existing wallet using a mnemonic"

echo -ne "${YELLOW}Enter your choice (1 or 2): ${RESET}"
read WALLET_CHOICE

if [ "$WALLET_CHOICE" == "1" ]; then
    echo -e "${BLUE}🆕 Creating a new Solana wallet...${RESET}"
    solana-keygen new
elif [ "$WALLET_CHOICE" == "2" ]; then
    echo -e "${BLUE}🔑 Importing existing wallet...${RESET}"
    solana-keygen recover
else
    echo -e "${RED}❌ Invalid choice. Exiting.${RESET}"
    exit 1
fi

# ───── Bitz CLI ─────
echo -e "${BLUE}📦 Installing Bitz CLI...${RESET}"
cargo install bitz

# ───── Post-Setup Info ─────
echo -e "${PURPLE}\n# ───── Optional RPC Configuration ─────${RESET}"
echo -e "${PURPLE}# solana config set --url https://mainnetbeta-rpc.eclipse.xyz/"
echo "# or"
echo "# solana config set --url https://eclipse.helius-rpc.com/"
echo "# or"
echo "# solana config set --url https://bitz-000.eclipserpc.xyz/${RESET}"

echo -e "${PURPLE}\n# ───── Start eMining ─────${RESET}"
echo -e "${PURPLE}# screen -S eclipse"
echo "# bitz collect"
echo "# ⚠️ You need ~0.005 ETH on Eclipse to start mining${RESET}"

echo -e "${PURPLE}\n# ───── Screen Controls ─────${RESET}"
echo -e "${PURPLE}# Detach: CTRL + A + D"
echo "# Resume: screen -r eclipse${RESET}"

echo -e "${PURPLE}\n# ───── Bitz CLI Commands ─────${RESET}"
echo -e "${PURPLE}# • Claim rewards: bitz claim"
echo "# • Check balance: bitz account"
echo "# • Use specific CPU cores: bitz collect --cores 8"
echo "# • View help: bitz -h${RESET}"

echo -e "${PURPLE}\n# ───── Import Wallet to Backpack ─────${RESET}"
echo -e "${PURPLE}# solana config get   → Copy 'Keypair Path'"
echo "# cat <keypair path>${RESET}"

# ───── Done! ─────
echo -e "${GREEN}\n✅ Setup complete! You're ready to mine BITZ like a pro, ArgonStark!${RESET}"
