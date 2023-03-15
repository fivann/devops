```docker system prune```: This command removes all unused containers, networks, volumes, and images (both dangling and unreferenced). It's a quick way to free up space on your system. For example, to prune all unused resources, you would run docker system prune.

```docker container prune```: This command removes all stopped containers. For example, to remove all stopped containers, you would run docker container prune.

```docker image prune```: This command removes all dangling (unreferenced) images. For example, to remove all dangling images, you would run docker image prune.

```docker volume prune```: This command removes all unused volumes. For example, to remove all unused volumes, you would run docker volume prune.

```docker network prune```: This command removes all unused networks. For example, to remove all unused networks, you would run docker network prune.

```docker ps -a```: This command lists all containers, including stopped ones. This is useful for identifying containers that can be removed. For example, to list all containers (including stopped ones), you would run docker ps -a.

```docker rm [CONTAINER_NAME/CONTAINER_ID]```: This command removes a container. For example, to remove a container named mycontainer, you would run docker rm mycontainer.

```docker rmi [IMAGE_NAME/IMAGE_ID]```: This command removes an image. For example, to remove an image named myimage, you would run docker rmi myimage.

```docker volume rm [VOLUME_NAME]```: This command removes a volume. For example, to remove a volume named mydata, you would run docker volume rm mydata.

```docker network rm [NETWORK_NAME]```: This command removes a network. For example, to remove a network named mynetwork, you would run docker network rm mynetwork.

By using these commands, you can easily clean up your Docker system, remove unused containers, images, networks, and volumes, and free up space on your system. It's a good practice to regularly clean up your Docker system to prevent it from taking up too much space or becoming cluttered with unused resources.
