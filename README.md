# Automated-ePOW-Installer ( Ubuntu)


## Automated installation 
``` curl -sSf https://raw.githubusercontent.com/ArgonStark/Automated-ePOW-Installer/refs/heads/main/automated_epow.sh -o automated_epow.sh && chmod +x automated_epow.sh && ./automated_epow.sh ``` 

6. Change RPC
```bash
solana config set --url https://mainnetbeta-rpc.eclipse.xyz/
```
   or
```bash
solana config set --url https://eclipse.helius-rpc.com/
```
   or
```bash
solana config set --url https://bitz-000.eclipserpc.xyz/
```
7. Open Screen
```bash
screen -S eclipse
```
8. Start eMining
```bash
bitz collect
```
- You need 0.005 $ETH on Eclipse to start mining, so send $ETH to your public key
- Detach from screen with CTRL + A + D
- Go back to screen with ```screen -r eclipse```
<br><br>
<br><br>
Other Commands:

  •	Claim your Bitz:
```bitz claim```
  
  •	Check your balance:
```bitz account```

  • Config CPU (change the number to change cores):
```bitz collect --cores 8```

  • Check Hashpower
```bitz benchmark```
  
  •	View all commands:
```bitz -h```
<br><br>
<br><br>
Import to backpack:
```bash
solana config get
```
copy path of Keypair path 
```bash
cat <Keypair path>
```
Copy array of number and import them on backpack in private key section
<br><br>

