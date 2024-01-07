#!/bin/bash

clear
echo "Starting XFCE and Termux-X11"
sleep 2

MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android --angle-gl &
>/dev/null 2>&1
sleep 1
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :1.0 &
sleep 1
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity >/dev/null 2>&1
sleep 1
env DISPLAY=:1.0 GALLIUM_DRIVER=virpipe dbus-launch --exit-with-session xfce4-session &
>/dev/null 2>&1

sleep 5
process_id=$(ps -aux | grep '[x]fce4-screensaver' | awk '{print $2}')
kill "$process_id" >/dev/null 2>&1
