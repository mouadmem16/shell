
# WSL
## Import a wsl image
wsl --import <Image Name> <Directory where you want to store the imported image> <Directory where the exported .tar file exists>

## Launch a wsl container 
wsl –distribution <Image Name>

## Export a wsl conatiner
wsl --shutdown
wsl --export <Image Name> <Export location file name.tar>

