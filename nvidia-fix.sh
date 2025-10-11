# run this command to fix nvidia-wayland error on tauri apps (and probaly some other things)
# Run `chmod u+x nvidia-fix.sh`
# And then `sh nvidia-fix.sh`

sudo bash -c "echo 'WEBKIT_DISABLE_DMABUF_RENDERER=1' > /etc/environment"
