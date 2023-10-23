#!/bin/zsh

# compile
make re
echo

# install
echo "installing to ~/.local/bin/"
cp bin/kappu ~/.local/bin/ 

# .desktop entry
echo "create .desktop entry"
eval df_loc="~/.local/share/applications/kappu.desktop"
echo "" > $df_loc
echo "[Desktop Entry]" >> $df_loc
echo "Name=kappu" >> $df_loc
echo "GenericName=black screen" >> $df_loc
echo "Exec=/bin/sh -c \"$HOME/.local/bin/kappu\"" >> $df_loc
echo "Type=Application" >> $df_loc
echo "Terminal=false" >> $df_loc

echo "done"
