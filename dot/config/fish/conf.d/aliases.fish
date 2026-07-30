if status is-interactive


    alias cls "printf '\033[2J\033[3J\033[1;1H'"

    # Programs
    alias zed "flatpak run dev.zed.Zed"
    alias kicat "kitty icat"
    alias icat "kitty icat"
    function cat
        bat $argv
    end
    function notepad
        flatpak run org.gnome.TextEditor $argv &
    end
end
