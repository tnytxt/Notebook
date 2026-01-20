Add 'opt' to $PATH In bashrc


- To add '/opt' to PATH in ''~/.bashrc' add this line near end of file:

export PATH="/opt:$PATH"

- Save the file and update:

source ~/.bashrc

- If you only want executables under '/opt/bin':

export PATH="/opt/bin:$PATH"

