#!/system/bin/sh
rename ()
{
    if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
        command mv "$@";
        return;
    fi;
    read -ei "$1" newfilename;
    command mv -v -- "$1" "$newfilename"
}
