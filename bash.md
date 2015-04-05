## .bash_profile
* Show git branch on repository folder
* Color in some places
```
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
 
alias ls="ls -G"
alias ll="ls -l"
 
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
 
PS1="$GREEN\u@machine$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
```


## Executing anything with each file in folder:

```
for f in *.js; do echo "Do something $f"; g=`basename $f .js`; echo "Without ext: $g"; done;
```

## Execute Sublime everywhere

```
