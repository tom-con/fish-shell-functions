function tun -a ip dbport myport
  if [ -z $myport ]
    set my_port 1234
  else
    set my_port $myport
  end

  if [ -z $dbport ]
    set db_port 27017
  else
    set db_port $dbport
  end
  echo "Tunneling $ip:$db_port to local port $my_port!"
  ssh -L $my_port:$ip:$db_port peon -N
end
