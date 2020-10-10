# dotfiles

## AUR helper
- [yay](https://github.com/Jguer/yay)
   ```
   $ git clone https://aur.archlinux.org/yay-git.git
   $ cd yay-git
   $ makepkg si
   ```
## Backup and restore script 

- Set post-transaction hooks in `/etc/pacman.d/hooks`:
   ```
   [Trigger]
   Operation = Install
   Operation = Remove
   Type = Package
   Target = *

   [Action]
   When = PostTransaction
   Exec = /bin/sh -c '/usr/bin/pacman -Qqen > ~/.backup/official_pkglist.txt && /usr/bin/pacman -Qqem > ~/.backup/aur_pkglist.txt '
   ```
 - Restore official packages from a list
    ```
    $ sudo pacman -S --needed - < official_pkglist.txt
   ```
 - Restore AUR packages from a list
    ```
    $ yay -S --needed - < aur_pkglist.txt
   ```
   
## Theme
[Dracula](https://draculatheme.com/): dark theme with some changes. 

## Arch installation guide

Follow this [gist](https://gist.github.com/sickmz/cd2a0527c0e9d61abd4e212a73fc5a00).
   
[General recommendations](https://wiki.archlinux.org/index.php/General_recommendations) for system management directions and post-installation tutorials (like setting up a graphical user interface, sound or a touchpad). For a list of applications that may be of interest, see [List of applications](https://wiki.archlinux.org/index.php/List_of_applications).
