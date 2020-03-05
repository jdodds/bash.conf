![](https://github.com/jdodds/bash.conf/workflows/shellcheck/badge.svg)


base config for bash, using these rules:

+ .profile should be POSIX compliant
+ .bash_profile should load .profile and .bashrc in that order
+ .bashrc for things you want at an interactive prompt


this mostly ensures you don't have to think about the differences between these files.

see the discussion [here](https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc).
