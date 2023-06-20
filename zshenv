## Used for setting user's environment variables; it should not contain commands 
## that produce output or assume the shell is attached to a TTY. When this file 
## exists it will always be read.

###
# PATH
###
function join_by { local IFS="$1"; shift; echo "$*"; }  ## utility function
## OS Directories
OS_PATH=()
OS_PATH+=("/bin")
OS_PATH+=("/usr/bin")
OS_PATH+=("/usr/sbin")
OS_PATH+=("/sbin")
OS_PATH+=("/usr/ucb")
## Local Directories
LOCAL_PATHS=()
LOCAL_PATHS+=("/usr/local/opt/coreutils/libexec/gnubin")        # macos coreutils
LOCAL_PATHS+=("/usr/local/bin")        # local binaries
LOCAL_PATHS+=("/usr/local/sbin")       # local system binaries
# LOCAL_PATHS+=("/snap/bin")             # local snap binaries
## User-based local directories
LOCAL_PATHS+=("${HOME}/.local/bin")    # user local binaries
#LOCAL_PATHS+=("${HOME}/lbin")          # user local binaries
#LOCAL_PATHS+=("${HOME}/bin")          # user local binaries
LOCAL_PATHS+=("${HOME}/git/scripts")       # my scripts
## Utilities
LOCAL_PATHS+=("/opt/samba/bin")        # SAMBA
LOCAL_PATHS+=("/opt/samba/sbin")       # SAMBA
LOCAL_PATHS+=("/opt/mysql/bin")        # MySQL
LOCAL_PATHS+=("/usr/bin/core_perl")    # Go language
## Shell Completing
# LOCAL_PATHS+=("/usr/local/aws/bin")      # aws cli
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
LOCAL_PATHS+=("${HOME}/.rvm/bin")        # rvm (ruby)

FULL_PATH=()
for PATH_ELEMENT in "${OS_PATH[@]}" "${LOCAL_PATHS[@]}"; do
  if [ -d $PATH_ELEMENT ]; then FULL_PATH+=("$PATH_ELEMENT"); fi
done
PATH=$(join_by : ${FULL_PATH[@]})
export PATH
unset join_by OS_PATH LOCAL_PATHS FULL_PATH

###
# Function Path
###
# fpath+=('${HOME}/zsh.d/zfunctions')
fpath=( ${HOME}/git/zsh.d/zfunctions "${fpath[@]}" )

export FPATH
# autoload -Uz ${HOME}/zsh.d/zfunctions/*(.:t)
autoload -Uz ${HOME}/git/zsh.d/zfunctions/*
 
 ## ruby/rvm
# [[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## AWS Vault
#export AWS_VAULT_BACKEND="file"
export AWS_VAULT_BACKEND="keychain"
