# takes in a color and a line to print (no newlines, escapes okay)
function p_echo
    echo -ne (set_color -o $argv[1])$argv[2]
end

# color variables set for the prompt
set vspc 'blue'
set vsmc 'E7C547'
set vswc 'magenta'
set vsgc '65F15B'

function fish_prompt
  
    p_echo $vspc     '┌──['
    p_echo $vsmc     (hostname)
    p_echo $vspc     ']['
    p_echo $vswc     (prompt_pwd)
    switch (git rev-parse --is-inside-work-tree ^/dev/null; or echo false)
        case true
            # begin-end statement to run and capture output of git-fetch
            begin
                git fetch &
            end ^/dev/null
            set vcgb (git branch | grep -e "*" |  cut -d " " -f 2)
            p_echo $vspc     ']['
            # get and echo master branch
            p_echo $vsgc     $vcgb
            # print if there are changes to commit
            if test -s (git status | grep -e "working directory clean") ^/dev/null
                p_echo 'yellow'  "*"
            end
            # print if there are changes to pull
            if not test -s (git log $vcgb..origin/$vcgb) ^/dev/null
                p_echo 'cyan'     "*"
            end
            # print if there are changes to push
            if not test -s (git log origin/$vcgb..$vcgb) ^/dev/null
                p_echo 'red'   "*"
            end
    end
    p_echo $vspc     ']\n└──['
    p_echo 'white'    '$'
    p_echo $vspc     '] '
    set_color normal
end
