# Linux-post-install

 It is a simple bash script to automate the post-installation process. Helps me back up and running on a new install of Ubuntu/Pop_Os without much hassle.

Currently, this script performs the following task:

- Update and install package upgrades
- Install all the tools and packages that I need
- Sets up `powertop` and `tlp` 
- Change the default shell to `fish` because I :heart: it
- Sets up and installs `pulseeffect` audio profiles
- Cleans up any packages that are no longer need
- Sets up `zram` swap
- reboots

## TO-DO:

- [ ] Improve the code structure
- [ ] Add the ability to restore backup of the `home` partition
- [ ] Install essential gnome-extensions
- [ ] Add support for other Linux distributions