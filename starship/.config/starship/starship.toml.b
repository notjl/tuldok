# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

# Inserts a blank line between shell prompts
add_newline = true

# Format using powerline style
# format = """
# ╭─\
# [](#4db2d6)\
# $username\
# [](fg:#4db2d6 bg:#5e98d2)\
# $directory\
# [](fg:#5e98d2 bg:#7f7abd)\
# $git_branch\
# $git_status\
# [](fg:#7f7abd bg:#985996)\
# $c\
# $conda\
# $docker_context\
# $golang\
# $java\
# $julia\
# $lua\
# $nix_shell\
# $nodejs\
# $python\
# $rust\
# [](fg:#985996 bg:#9e3b62)\
# $os\
# [](fg:#9e3b62)\
# $fill\
# [](fg:#7f7abd)\
# $time\
# [](fg:#4db2d6 bg:#7f7abd)\
# $cmd_duration\
# $battery\
# \n╰─ﬦ 
# """

format = """
╭─\
$directory\
$git_branch\
$git_status  \
"""

# right_format = """
# $character
# """

[fill]
symbol = " "

[username]
style_user = "bg:#4db2d6 fg:#0D0D0D bold"
style_root = "bg:#65c8d0 fg:#ef703d bold"
show_always = true
format = "[ 🐙 ]($style)"
disabled = false

# [directory]
# style = "bg:#5e98d2 fg:#0f0f0f"
# truncation_length = 2
# truncation_symbol = ".../"
# home_symbol = "󰜥 "
# format = "[ $path ]($style)"

[directory]
style = "fg:#FFFFFF"
truncation_length = 3
truncation_symbol = ".../"
home_symbol = "󰜥 "
format = " [$path]($style) "

[directory.substitutions]
"Documents" = " "
"Downloads" = " "
"Music" = " "
"Pictures" = " "
"Repositories" = "󰳏 "
"Desktop" = " "
"Games" = " "
"Videos" = " "
".config" = " "
".cache" = "󰃨 "
".wine" = "󰡶"
"tuldok" = ""
"kaalaman" = " "

[git_branch]
symbol = "󰘵 "
style = "fg:#FFFFFF"
# style = "7f7abd"
format = "⏽ [$symbol $branch]($style)"

[git_status]
style = "fg:#FFFFFF"
# style = "bg:#7f7abd"
format = "[$all_status$ahead_behind]($style)"
conflicted = '  '
ahead = '\[󰤇 $count\]'
behind = '\[󱙷 $count\]'
diverged = ' 󱡷 '
up_to_date = '  '
untracked = ' 󰏑 '
stashed = ' 󰋻 '
modified = ' 󱩼 '
staged = '\[[󰷬 $count\]]($style bg:#7f7abd bold)'
renamed = ' 󰑕 '
deleted = '  '

[c]
symbol = " "
format = "[ $symbol$version ]($style)"
style = "bg:#985996"

[conda]
symbol = " "
format = "[ $symbol$environment ]($style)"
style = "bg:#985996"

[docker_context]
symbol = "🐳 "
format = "[ $symbol$version ]($style)"
style = "bg:#985996"

[golang]
symbol = "🐹 "
format = "[ $symbol$version ]($style)"
style = "bg:#985996"

[java]
symbol = "☕ "
format = "[ $symbol$version ]($style)"
style = "bg:#985996"

[julia]
symbol = " "
format = "[ $symbol$version ]($style)"
style = "bg:#985996"

[lua]
symbol = "🌙 "
format = "[ $symbol$version ]($style)"
style = "bg:#985996"

[nix_shell]
symbol = "❄️  "
format = "[ $symbol$state $name ]($style)"
style = "bg:#985996"

[nodejs]
symbol = " "
format = "[ $symbol$version ]($style)"
style = "bg:#985996"

[python]
symbol = "🐍 "
format = "[ $symbol$version $virtualenv]($style)"
style = "bg:#985996"

[rust]
symbol = "🦀 "
format = "[ $symbol$numver ]($style)"
style = "bg:#985996"

[os]
format = "[ $symbol]($style)"
style = "bg:#9e3b62"
disabled = false

[os.symbols]
EndeavourOS = "󱓞 "
Alpine = " "
Amazon = " "
Android = " "
Arch = " "
CentOS = " "
Debian = " "
DragonFly = " "
Emscripten = " "
Fedora = " "
FreeBSD = " "
Garuda = "﯑ "
Gentoo = " "
HardenedBSD = "ﲊ "
Illumos = " "
Linux = " "
Macos = " "
Manjaro = " "
Mariner = " "
MidnightBSD = " "
Mint = " "
NetBSD = " "
NixOS = " "
OpenBSD = " "
openSUSE = " "
OracleLinux = " "
Pop = " "
Raspbian = " "
Redhat = " "
RedHatEnterprise = " "
Redox = " "
Solus = "ﴱ "
SUSE = " "
Ubuntu = " "
Unknown = " "
Windows = " "

[status]
disabled = false
pipestatus = false
symbol = " [[](fg:#ff6961)  [](fg:#ff6961)](fg:#ffffff bg:#ff6961)"
success_symbol = " [[](fg:#77dd77)  [](fg:#77dd77)](fg:#ffffff bg:#77dd77)"
not_executable_symbol =  " [[](fg:#c23b22)  [](fg:#c23b22)](fg:#ffffff bg:#c23b22)"
not_found_symbol = " [[](fg:#fdfd96) 󱗣 [](fg:#fdfd96)](fg:#ffffff bg:#fdfd96)"
format = "[$symbol]($style)"

[cmd_duration]
style = "bg:#4db2d6 fg:#0d0d0d"
min_time = 0
show_milliseconds = true
format = "[  $duration ]($style)"

[time]
style = "bg:#7f7abd fg:#0d0d0d"
disabled = false
format = "[   $time ]($style)"
time_format = "%T"

[character]
success_symbol = "[ ❯ ](bold white)"
error_symbol = "[ ✖ ](bold red)"
vimcmd_symbol = "[  ](bold white)"

[battery]
format = "$symbol"
unknown_symbol = ""

[[battery.display]]
# From 0 to 10 percent battery charge
threshold = 10
charging_symbol = "[[](fg:#ff6961 bg:#4db2d6) 󰢟  ](bg:#ff6961 fg:#000000)"
discharging_symbol = "[[](fg:#ff6961 bg:#4db2d6)  ](bg:#ff6961 fg:#000000)"

[[battery.display]]
# From 10 to 20 percent battery charge
threshold = 20
charging_symbol = "[[](fg:#f9f871 bg:#4db2d6) 󰢜  ](bg:#f9f871 fg:#000000)"
discharging_symbol = "[[](fg:#f9f871 bg:#4db2d6)  ](bg:#f9f871 fg:#000000)"

[[battery.display]]
# From 20 to 30 percent battery charge
threshold = 30
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰂆  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

[[battery.display]]
# From 30 to 40 percent battery charge
threshold = 40
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰂇  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

[[battery.display]]
# From 40 to 50 percent battery charge
threshold = 50
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰂈  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

[[battery.display]]
# From 50 to 60 percent battery charge
threshold = 60
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰢝  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

[[battery.display]]
# From 60 to 70 percent battery charge
threshold = 70
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰂉  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

[[battery.display]]
# From 70 to 80 percent battery charge
threshold = 80
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰢞  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

[[battery.display]]
# From 80 to 90 percent battery charge
threshold = 90
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰂊  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

[[battery.display]]
# From 90 to 100 percent battery charge
threshold = 100
charging_symbol = "[[](fg:#96efa1 bg:#4db2d6) 󰂊  ](bg:#96efa1 fg:#000000)"
discharging_symbol = "[[](fg:#96efa1 bg:#4db2d6)  ](bg:#96efa1 fg:#000000)"

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true
