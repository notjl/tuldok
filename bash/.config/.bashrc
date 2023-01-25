#!/usr/bin/env bash

# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

alias top='bpytop'
#alias python='python3'
alias bashtherc='source ~/.bashrc'
alias venvact='. .venv/Scripts/activate'
alias oldvim='\vim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias speedtest='speedtest.exe'
alias ani-view='npx node-anime-viewer'

wiki(){
    v ~/vimwiki/index.md
}

mkcdir(){
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	git rev-parse --is-inside-work-tree &>/dev/null || return;

	# Check for what branch we’re on.
	# Get the short symbolic ref. If HEAD isn’t a symbolic ref, get a
	# tracking remote branch or tag. Otherwise, get the
	# short SHA for the latest commit, or give up.
	branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
		git describe --all --exact-match HEAD 2> /dev/null || \
		git rev-parse --short HEAD 2> /dev/null || \
		echo '(unknown)')";

	# Early exit for Chromium & Blink repo, as the dirty check takes too long.
	# Thanks, @paulirish!
	# https://github.com/paulirish/dotfiles/blob/dd33151f/.bash_prompt#L110-L123
	repoUrl="$(git config --get remote.origin.url)";
	if grep -q 'chromium/src.git' <<< "${repoUrl}"; then
		s+='*';
	else
		# Check for uncommitted changes in the index.
		if ! $(git diff --quiet --ignore-submodules --cached); then
			s+='+';
		fi;
		# Check for unstaged changes.
		if ! $(git diff-files --quiet --ignore-submodules --); then
			s+='!';
		fi;
		# Check for untracked files.
		if [ -n "$(git ls-files --others --exclude-standard)" ]; then
			s+='?';
		fi;
		# Check for stashed files.
		if $(git rev-parse --verify refs/stash &>/dev/null); then
			s+='$';
		fi;
	fi;

	[ -n "${s}" ] && s=" [${s}]";

	echo -e "${1}${darkblue}[${branchName}]${2}${blue}${s}";
}

set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV=" [`basename \"$VIRTUAL_ENV\"`]"
  fi
}

if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);
	# Solarized colors, taken from http://git.io/solarized-colors.
	black=$(tput setaf 0);
	blue=$(tput setaf 111);
	cyan=$(tput setaf 87);
	green=$(tput setaf 64);
	orange=$(tput setaf 166);
	purple=$(tput setaf 125);
	red=$(tput setaf 124);
	gray=$(tput setaf 238);
    darkblue=$(tput setaf 39);
	white=$(tput setaf 15);
	yellow=$(tput setaf 136);
else
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	orange="\e[1;33m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${cyan}";
else
	userStyle="${cyan}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${cyan}";
else
	hostStyle="${cyan}";
fi;

function timer_now {
    date +%s%N
}

function timer_start {
    timer_start=${timer_start:-$(timer_now)}
}

function timer_stop {
    local delta_us=$((($(timer_now) - $timer_start) / 1000))
    local us=$((delta_us % 1000))
    local ms=$(((delta_us / 1000) % 1000))
    local s=$(((delta_us / 1000000) % 60))
    local m=$(((delta_us / 60000000) % 60))
    local h=$((delta_us / 3600000000))
    # Goal: always show around 3 digits of accuracy
    if ((h > 0)); then timer_show=${h}h${m}m
    elif ((m > 0)); then timer_show=${m}m${s}s
    elif ((s >= 10)); then timer_show=${s}.$((ms / 100))s
    elif ((s > 0)); then timer_show=${s}.$(printf %02d $ms)s
    elif ((ms >= 100)); then timer_show=${ms}ms
    elif ((ms > 0)); then timer_show=${ms}.$((us / 100))ms
    else timer_show=${us}us
    fi
    unset timer_start
}

function set_prompt {

	set_virtualenv

	# Set the terminal title and prompt.
	PS1="\[\033]0;\W\007\]"; # working directory base name
	PS1+="\[${bold}\]\n"; # newline
	PS1+="╭─\[${userStyle}\]\u"; # username
	PS1+="\[${white}\]@";
	PS1+="\[${hostStyle}\]\h"; # host
	PS1+="\[${white}\] in ";
	PS1+="\[${gray}\]\W\[${PYTHON_VIRTUALENV}\]"; # working directory full path
	PS1+=" $(prompt_git)"; # Git repository details
	PS1+="\n";
	timer_stop
	PS1+='\[${bold}\]\[${white}\]╰─\[${gray}\][${timer_show}] '
	PS1+="\[${white}\]λ \[${reset}\]"; # `$` (and reset color)
	export PS1;
}

trap 'timer_start' DEBUG
PROMPT_COMMAND="set_prompt"

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
