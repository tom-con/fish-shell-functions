function pop -a port
  lsof -n -i :$port | grep LISTEN
end