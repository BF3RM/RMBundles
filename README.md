# RMBundles
Utility mod that loads all bundles that Reality Mod uses. Useful when working on custom levels for example

## Installation
This mod can be easily installed using [VUMM](https://github.com/BF3RM/vumm-cli):

```bash
vumm install rmbundles
```

## Manual
Incase you are not using VUMM it's also possible to manually install `RMBundles`.
Clone the project in the `Admin/Mods` directory (see the [documentation on mods](https://docs.veniceunleashed.net/hosting/mods/)):

```powershell
cd %userprofile%/Documents/Battlefield 3/Server/Admin/Mods
git clone --recurse-submodules https://github.com/BF3RM/RMBundles.git
```

After that add the following line to your ModList.txt
```
rmbundles
```
