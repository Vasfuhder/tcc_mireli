#!/bin/bash
read -p "Digite a mensagem do commit: " commitmsg

flutter build web --release --base-href="/tcc_mireli/"
cp -R build/web/* /home/vas/Projetos/vas/tcc_mireli
cd /home/vas/Projetos/vas/tcc_mireli
git add .
git commit -am "$commitmsg"
git push
