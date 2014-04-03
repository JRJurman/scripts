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
            set vcgs (git status)
            set git_branch (echo $vcgs | head -n 1 | cut -d " " -f 3)
            set git_behind (echo $vcgs | head -n 2 | tail -n 1 | head -n 1 | grep -e "behind")
            set git_ahead  (echo $vcgs | head -n 2 | tail -n 1 | head -n 1 | grep -e "ahead")
            set git_dirty  (echo $vcgs | tail -n 1 | grep -e "working directory clean")

            p_echo $vspc     ']['
            # get and echo master branch
            p_echo $vsgc     $git_branch
            # print if there are changes to commit
            if test -s $git_dirty ^/dev/null
                p_echo 'yellow'  "*"
            end
            # print if there are changes to pull
            if not test -s $git_behind ^/dev/null
                p_echo 'cyan'     "*"
            end
            # print if there are changes to push
            if not test -s $git_ahead ^/dev/null
                p_echo 'red'   "*"
            end
    end
    p_echo $vspc     ']\n└──['
    p_echo 'white'   '>'
    p_echo $vspc     '] '
    set_color normal
end
