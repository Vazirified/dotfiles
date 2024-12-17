#!/bin/bash

clear
echo
echo This script abstracts the commands required to run a X11 server followed by a GUI application or a desktop session on Termux on Android through termux-x11 package...
echo
echo A X11 server should be running before executing this script or any shape of termux-x11 command.
options=("GNU Emacs" "XFCE Session" "Quit")

if [ -z $1 ]
    then
        echo
        echo No argument received from the command-line at runtime, you can abort the execution and provide the name of a desktop session or X11 application as an argument, or choose between the arguments from the list below by typing in a numeric value, followed by return key:
        echo
        select opt in "${options[@]}"
        do
            case $opt in
                "GNU Emacs")
                    echo
                    echo GNU Emacs will be executed after X11 startup.
                    execoption=emacs
                    break
                    ;;
                "XFCE Session")
                    echo
                    echo XFCE session will run after X11 startup.
                    execoption=xfce4-session
                    break
                    ;;
                "Quit")
                    echo
                    echo Exiting without any action.
                    exit 0
                    ;;
                *)
                    echo
                    echo Invalid option. Try again...
                    ;;
            esac
        done
    else
        echo $1 will be executed after X11 startup.
        execoption=$1
fi

echo
echo You can now switch to your external X11 session...
termux-x11 :1 -xstartup $execoption
