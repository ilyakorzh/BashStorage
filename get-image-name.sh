#clean all local Docker images if build & create & push is success
# $1 = $JOBNAME
DockerName=$(echo "$1" | rev | cut -c 7- | rev)
docker images | grep "$DockerName" | awk '{system("docker rmi -f "$3)}'