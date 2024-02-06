LAST_TWO=$(( $(wc -l <.zshrc)-2))
head -n$LAST_TWO .zshrc > tmp.txt && mv tmp.txt .zshrc
