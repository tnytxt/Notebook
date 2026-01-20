# PKG management with FZF

alias rmg='rclone mount --vfs-cache-mode full --vfs-cache-max-age 24h --vfs-cache-max-size 5G --#buffer-size 512M --vfs-read-chunk-size 128M --vfs-read-chunk-size-limit off --vfs-read-ahead 2G --#use-mmap --dir-cache-time 24h --vfs-write-back 5m --transfers=2 --cache-dir=/media/lee/Storage/#rclone-cache "Gdrive:" ~/gdrive &'

install() {
    apt-cache pkgnames | fzf --multi --preview 'apt show {1}' | xargs -r sudo apt install
}

recent() {
    dpkg-query -W --showformat='${Package}\t${Version}\t${Installed-Size}\n' | sort | tail -100
}

remove() {
    dpkg --get-selections | awk '{print $1}' | fzf --multi --preview 'apt show {1}' | xargs -r sudo apt remove --purge
}

alias sdn='sudo shutdown -h now'
alias rbn='reboot -f'
alias pwdgen='genpwd'

# Apt
alias upd='sudo apt update'
alias sea='apt search'
alias upg='sudo apt upgrade'
alias rem='sudo apt remove'
alias distup='sudo apt full-upgrade'
alias ins='sudo apt install'
alias rema='sudo apt remove --auto-remove'
alias purge='sudo apt purge'
alias clean='sudo apt clean'
alias sources='sudo mousepad /etc/apt/sources.list'
alias listupg='apt list --upgradable'
alias apth='cat /var/log/apt/history.log'
alias clean='sudo apt autoremove && sudo apt autoclean'
alias listins='dpkg --get-selections | grep -v deinstall' # List Installed
alias aptd='apt-cache depends'
alias aptls='apt list --installed'

aptr() {
    grep 'install' /var/log/dpkg.log
}


# pacstall
alias paci='pacstall -I'    # install
alias pacs='pacstall -S'  # search

# Checking Pkg Info
alias search='apt search'
alias show='apt show'

# Disk Usage
alias du='du -h --max-depth=1'

# System Info
alias sysi='neofetch'

# Sync & Backup
alias time='sudo timeshift --create'

# Xfce 
alias rp='xfce4-panel -r'        # Reload panel
alias rd='xfdesktop --reload'    # Reload desktop

# Avoid mistakes with common cmds
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Listing Files
alias ll='ls -la'                    # List files with details
alias la='ls -A'                     # List files except hidden
alias l='ls -CF'                     # List files in columns
alias ls='ls --color=auto'           # Colorized output for ls

# Rclone
alias rgui='rclone rcd --rc-web-gui'
alias rc='rclone config'


# Fix typo's
#alias cd..='cd ..'
#alias pdw='pwd'
#alias suda='sudo'
#alias suod='sudo'
#alias downlaod='download'

# Get iPlayer
alias gc='get_iplayer --cache'      # Update/create all programmes cache
alias gr='get_iplayer --refresh'    # Refesh for added programmes
#alias gd='get_iplayer --pid='      # Downlaod programmes

# Misc
alias bash='source ~/.bashrc'
alias pass='pwgen 12'                                    # Generate 12 character Password
alias grep='grep --color=auto'                           # Colorized output for grep
alias bashb='cp ~/.bash_history ~/.bash_history_backup'  # Backup bash history
alias xc='> ~/.xsession-errors'                          # Empty xsession log
alias cgrep='grep --color=always'
alias grep='grep --color=auto'
alias less='less -g'                                   
alias ls='ls --color=auto'
alias locate='du -ah / 2>&1 | grep'
alias snipe='du -ah ./ 2>&1 | grep'
alias cal='ncal -b'                                  # Display cal, highlite cur day

# Unblock adblocker
alias noblock='hblock -S none -D none'

# Terminal
alias h='history'                  # Show cmd history
alias c='clear'                    # Clear terminal
alias al='alias'                   # Show aliases

# Journal error logs
alias jurno='journalctl --user -b0 --no-pager'
alias jurr='sudo journalctl -r'                 # logs in reverse-recent fisrt
#sudo journalctl -r -n 50                       # Show only last 50 entries
#sudo journalctl -r -u ssh.service              # View logs for specific service 
#sudo journalctl -f -r                          # Continuous display new entries
#sudo journal -f                                # Show output of unresponsive app 
alias jcl='sudo journalctl --vacuum-size=1K'    # Clean logs regardless of age
alias jclo='sudo journalctl --vacuum-time=1s'   # Clean logs older than 1 second
alias jcd='journalctl --disk-usage'             # Check disk usage

#ncdu
alias ncduroot='x-terminal-emulator -e ncdu -r --color dark /'

# git
alias gp='git pull'
alias gc='git clone'

# Openbox
#alias ktint='killall -SIGUSR1 tint2'   # Force reload tint2 panel

#make rm command safer
alias rm="rm -i"


#alias rmg='rclone mount --vfs-cache-mode full --vfs-cache-max-age 24h --vfs-cache-max-size 5G --#buffer-#size 512M --vfs-read-chunk-size 128M --vfs-read-chunk-size-limit off --vfs-read-ahead 2G --#use-mmap --#dir-cache-time 24h --vfs-write-back 5m --transfers=2 --cache-dir=/media/lee/Storage/#rclone-cache #"Gdrive:" ~/gdrive &'