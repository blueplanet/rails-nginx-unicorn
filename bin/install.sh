vagrant up
knife solo prepare vagrant@192.168.33.11
knife solo cook vagrant@192.168.33.11
cd ../blog
cap staging deploy
cd -
