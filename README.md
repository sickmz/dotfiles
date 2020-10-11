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

## Things to do after installation

- Install microcode: Processor manufacturers release stability and security updates to the processor microcode. These updates provide bug fixes that can be critical to the stability of your system. Without them, you may experience spurious crashes or unexpected system halts that can be difficult to track down. All users with an AMD or Intel CPU should install the microcode updates to ensure system stability. 
   * Intel:  `$ sudo pacman -S intel-ucode`
   * AMD:  `$ sudo pacman -S amd-ucode`
      * In both cases update grub config file: `$ grub-mkconfig -o /boot/grub/grub.cfg`
 - Delete boot delay
   * `$ sudo nano /etc/default//grub`
   * Add the following line: `GRUB_FORCE_HIDDEN_MENU = 'true'`
   * Put file [31_hold_shift](https://gist.githubusercontent.com/anonymous/8eb2019db2e278ba99be/raw/257f15100fd46aeeb8e33a7629b209d0a14b9975/gistfile1.sh) to `/etc/grub.d/`
   * Make it executable: `$ sudo chmod a+x /etc/grub.d/31_hold_shift`
   * Regenerate grub configuration `$ sudo grub-mkconfig -o /boot/grub/grub.cfg`
- Remove orphans: `$ sudo pacman -Rns $(pacman -Qtdq)`
- Optimize pacman's database access speeds: `$ sudo pacman-optimize`
- Check for errors:
   * sudo `$ systemctl --failed`
   * sudo `$ journalctl -p 3 -xb`
