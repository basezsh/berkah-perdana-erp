#!/data/data/com.termux/files/usr/bin/bash

TOKEN=$(tr -d '\r\n' < token.txt)

git remote remove origin 2>/dev/null

git remote add origin \
"https://basezsh:${TOKEN}@github.com/basezsh/berkah-perdana-erp.git"

git push -u origin main

git remote set-url origin \
"https://github.com/basezsh/berkah-perdana-erp.git"
