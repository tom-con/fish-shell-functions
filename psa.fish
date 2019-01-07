function psa -a file
  cd ~/gc
  pm2 start ./$file.json
  cd -
end
