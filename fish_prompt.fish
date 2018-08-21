function fish_prompt
	test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test "$USER" = 'root'
    and echo (set_color red)"#"
    set changes (git status -s) > /dev/null ^ /dev/null
    if test -z $changes
        set changeEmoji "✅  "
    else
        set changeEmoji "⚠️  "
    end
    # Main
    echo -n (set_color cyan)(prompt_pwd)' 🦑  '$changeEmoji(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end
