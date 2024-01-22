# Near ![NEAR Protocol](https://raw.githubusercontent.com/ErikThiart/cryptocurrency-icons/master/16/near-protocol.png "NEAR Protocol (NEAR)")  inscriber automation


![BASH](https://github.com/odb/official-bash-logo/blob/61eff022f2dad3c7468f5deb4f06652d15f2c143/assets/Logos/Icons/PNG/128x128.png "Bourne-Again SHell")

**READ THIS BEFORE TO USE OR YOU CAN MAKE BIG MISTAKES!!**

**This software is provided 'as is' without any warranty!!**

*GNU LICENSE*

This repo contains some examples of Bash scripts with json inscriptions for `nrc-20` and `nrc161` at the moment. Other protocols will be integrated when arrived. 

```
git clone https://github.com/GaloisField2718/near_inscriber
cd near_inscriber
```

## Requirements

In this repo you can find the `near-cli-rs` binary built from [near/near-cli-rs](https://github.com/near/near-cli-rs). 
To build from source and don't use the version provided in the repo follow [near-cli-rs/docs/README.en.md](https://github.com/near/near-cli-rs/blob/main/docs/README.en.md#building).

You should be on Linux or Mac. 
If someone wants to built for Windows you should use [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.4). In other case you can use tools as [WSL](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/) or any others.

To activate binaries and be able to call them run : 
```
chmod +x mint.sh
chmod +x mint_fuckneat_example.sh
chmod +x mint_unifat_example.sh
```

For any more `sh` files run the same command before to execute them.

## Usage

Usage is very easy and can be customised as wished. This configuration runs `near-cli-rs` on the mainnet, with `'100 Tgas'` and `sign-with-legacy-keychain` flag. The signer flag provided avoid to enter password for each transaction. It's less secure but required if we launch 100 mints with `mint_fuckneat.sh` for example (you don't want to enter 100 times your password, right ?).

To configure your wallet with `near-cli-rs` as `legacy-keychain` I provided a small documentation into `quick_tuto_near-cli-rs` folder.

`./mint.sh CONTRACT_NAME FILE_PATH DEPOSIT ADDRESS`

The `DEPOSIT` is the amount send with the call function. For [`inscription.near`](https://nearblocks.io/address/inscription.near) contract it's 0 NEAR, so fill it with '' (see `mint_fuckneat_example.sh`). For [`unifat.near`](https://nearblocks.io/address/unifat.near), there is a more complex logic for minting process. You pay according to threshold reached of tokens already minted. The logic is implemented into `mint_unifat_example.sh`.

**For `mint_unifat_example.sh`**

You should open the file and modify line 4 `YOUR_ADDRESS` with your `near_id` (in general `.near` or a hashed id).

`./mint_unifat_example.sh YOUR_BALANCE`
`YOUR_BALANCE` is in token you try to mint. At the beginning it's 0, but you can run it with a non empty balance. Also, the logic applied is for [unifat token](unifat.xyz/inscribe/unifat). Other tokens can have different threshold, take care about it and update it if necessary.


## What to do?

The most interesting script is `mint_unifat_example.sh` cause it implements a quite funny logic in the mint. The script could be improve by for example checking before to process if the user has enough NEAR to process the call. Check that the call worked is also a good feature to add. 

The `mint.sh` script is really a ready-to-go script for inscriptions in general on [Near Protocol](near.org). Feel free to try different json files and different contracts. *Take care to not be snipped by some teams 🫠.*

The `mint_fuckneat_example.sh` is a good basic example to make several mints in one script. Warning there is no `sleep`, so you can be easily find from any explorer. Some projects don't like it, so take care and your own responsibilities by using this script.

## Author(s)

- GaloisField2718 : [X : @Blockcryptology](https://twitter.com/Blockcryptology) [💌 mail](galoisfield2718@gmail.com) 
- Any others who want to participate 🙃
