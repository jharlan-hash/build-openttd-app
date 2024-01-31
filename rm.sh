LAST_TWO=$(( $(wc -l <.zshrc_backup)-2))
head -n$LAST_TWO .zshrc_backup > tmp.txt && mv tmp.txt .zshrc_backup
