HISTFILE="$XDG_CACHE_HOME/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY       # timestamp each entry
setopt HIST_EXPIRE_DUPS_FIRST # drop dupes first when trimming
setopt HIST_IGNORE_DUPS       # don't record a line if it dupes the previous one
setopt HIST_IGNORE_SPACE      # commands starting with space aren't recorded
setopt SHARE_HISTORY          # sync history across sessions in real time
setopt AUTO_CD                # type a dir name to cd into it
setopt EXTENDED_GLOB          # enables ^ and ~ in globs
