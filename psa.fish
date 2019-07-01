function psa -a file
  title "LOGS"
  cd ~/gc
  pm2 start ~/gc/"$file".json --no-daemon
  cd -
  pm2 logs
end
