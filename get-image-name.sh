#clean all local Docker images if build & create & push is success
DockerName=$(echo "$JOB_NAME" | rev | cut -c 7- | rev)
docker images | grep "$DockerName" | awk '{system("docker rmi -f "$3)}'