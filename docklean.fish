function docklean -d "Cleanup docker danglers"
	set size (ls -lah ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2 | awk '{print $5}')
	echo "Current size of docker driver is $size! Cleaning this up"
	set exited (docker ps -q -f 'status=exited')
	if test -n "$exited"
		docker rm $exited
	end
	set dangling (docker images -q -f "dangling=true")
	if test -n "$dangling"
		docker rmi $dangling
	end
	set sizetwo (ls -lah ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2 | awk '{print $5}')
	echo "Cleanup complete!"
	echo "Current size of docker driver is $sizetwo! After clean up"
end