# dotfiles
My personal dotfiles for my Arch system

Includes configurations for the following programs:
- <a href="https://github.com/alacritty/alacritty" target="_blank">alacritty</a>
- <a href="https://github.com/karlstav/cava" target="_blank">cava</a>
- <a href="https://dunst-project.org/" target="_blank">dunst</a>
- <a href="https://github.com/Airblader/i3" target="_blank">i3-gaps</a>
- <a href="https://github.com/vivien/i3blocks" target="_blank">i3blocks</a>
- <a href="https://github.com/LunarVim/LunarVim" target="_blank">LunarVim</a> (custom IDE-like build of neovim)
- <a href="https://neovim.io/" target="_blank">neovim</a>
- <a href="https://github.com/neovide/neovide" target="_blank">neovide</a>
- <a href="https://github.com/jonaburg/picom" target="_blank">picom-jonaburg</a>
- <a href="https://github.com/dakata1337/polybar-dwm-module/" target="_blank">polybar</a>
- <a href="https://github.com/qutebrowser/qutebrowser" target="_blank">qutebrowser</a>
- <a href="https://ranger.github.io/" target="_blank">ranger</a>
- <a href="https://github.com/davatorium/rofi" target="_blank">rofi</a>
- <a href="https://docs.xfce.org/xfce/thunar/start" target="_blank">Thunar</a>
- <a href="https://github.com/vim/vim" target="_blank">vim</a>
- <a href="https://www.zsh.org/" target="_blank">zsh</a>

**Note:** Some of my scripts, in particular the ones that have to do with laptop power management are made for use on my machine only so they may not apply to your system/may not work. Check out any scripts that are not working and modify them to your needs.

Additionally, some configs in this repo are unmaintained and might not work as I do not use them anymore. In particular, my i3-gaps, i3blocks and qutebrowser configs are no longer in use.

My current system is running a custom desktop using <a href="https://github.com/AM4283/dwm" target="_blank">dwm</a> as a window manager on Arch Linux. Many of the scripts in this repo are used in my build of it linked below.

<details><summary><h2>Theme Showcase</h2></summary>
<p>

**Dracula**
<img src="https://i.imgur.com/NLdMUEJ.png">

**Fairy Dark**
<img src="https://i.imgur.com/jfksYZx.png">

**Lunaria Eclipse**
<img src="https://i.imgur.com/rLEf7bR.png">

**Nord**
<img src="https://i.imgur.com/jDwSaPO.png">

**One Half Dark**
<img src="https://i.imgur.com/k0x4gyx.png">

**Sonokai**
<img src="https://i.imgur.com/uIqQnuC.png">

**Tokyo Night Storm**
<img src="https://i.imgur.com/BZQYizD.png">

</p>
</details>

### Background switcher
My background switcher script depends on an image viewer called ```sxiv``` for choosing the image and another image viewer called ```feh``` for setting the background. <br>
When ```sxiv``` opens, use ```m``` to mark the background you want to switch to and then quit using ```q```. <br>
Additionally, if using my build of dwm with the autostart script defined in ```~/.dwm/autostart.sh``` with a line for ```feh``` to automatically select a background, this script will update that autostart file  to keep the new background on reboot

### Theme switcher
My GTK/terminal/window manager theme switcher script(s) changes the colorscheme for terminals that use .Xresources (like my build of st), alacritty, rofi, i3-lock-color, the GTK themes, and the dwm window manager from a preset list.

I've only tested it to use my build of dwm, but it can be adapted to other custom desktop environments. In order to use my theme switcher, there are certain other dependencies that are assumed to be installed.

Fonts:<br>
```ttf-fira-code nerd-fonts-sans-regular-complete nerd-fonts-mononoki noto-fonts-cjk noto-fonts-emoji```

**Themes:**
- <a href="https://github.com/vinceliuice/Colloid-gtk-theme" target=_blank>Colloid</a> (dark theme, grey color, black & rimless tweak)
- <a href="https://www.gnome-look.org/p/1687249/" target="_blank">Dracula</a> (Original and pink-accent variants)
- <a href="https://www.opendesktop.org/p/1214931" target="_blank">Flat Remix</a> (Yellow-dark variant)
- <a href="https://www.gnome-look.org/p/1267246/" target="_blank">Nordic</a> (darker variant)
- <a href="https://github.com/Jannomag/Yaru-Colors" target="_blank">Yaru Colors</a> (Specifically the green-dark variant) 


**Icon Themes:** <br>
<a href="https://github.com/vinceliuice/Tela-circle-icon-theme" target="_blank">Tela Circle Icon Theme</a> (Install all variants)

**Cursor Themes:**
- <a href="https://github.com/0jdxt/oreo-nord-cursors" target="_blank">Oreo Nord Cursors</a> (Install all variants)
- <a href="https://www.gnome-look.org/p/1360254/" target="_blank">Oreo Cursors</a> (Spark purple and spark pink)


## Other Links
Some of my other configurations for programs not listed here can also be found on my GitHub:

- <a href="https://github.com/AM4283/dwm" target="_blank">dwm</a>
- <a href="https://github.com/AM4283/dwmblocks" target="_blank">dwmblocks</a>
- <a href="https://github.com/AM4283/st" target="_blank">st</a>

Use these builds along with these dotfiles to get (almost) my exact desktop!

Additionally, as a part of this repository, there are some configurations scripts that I have taken from others and modified to my needs:

<a href="https://gitlab.com/dwt1/dmscripts" target="_blank">dmscripts</a> - credit to Derek Taylor on GitLab

## Donate
If you enjoy this rice, or any of my other dots on my GitHub and are feeling extra generous, you can donate crypto using the addresses below:

**XMR**<br>
48bMjDgejjBa5JMLmUXWHfUxxc4VztE9dSxsnJ5STqDcUcjYk9xHoK59ovWgm6BvrzFfbx2kEA3QyUmgcpzYJ4dH9cLWCYV

**Bitcoin**<br>
bc1quaj9206k2ughk8ryh7yq2vqa0esxpkt048ggpx

**Ethereum**<br>
0x5f954056E04a5fc0F0E777409935823e98dC0C83

Make sure to give back to the creators of your favorite FOSS programs too!
