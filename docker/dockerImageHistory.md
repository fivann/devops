The "docker image history" command is used to view the history of changes made to a Docker image. It shows a list of all the layers that make up the image, along with the commands that were used to create each layer. The output also shows the size of each layer and the time when it was created.

Here are some examples of how you can use the "docker image history" command:

View the history of a Docker image:
```
docker image history ubuntu:latest
```
This command will show the history of the "ubuntu:latest" image, including all the layers that were used to create it.

View the history of a Docker image and limit the output to a specific number of layers:
```
docker image history --limit=5 ubuntu:latest
```
This command will show the history of the "ubuntu:latest" image, but will only show the first 5 layers.

View the history of a Docker image and include the size of each layer:
```
docker image history --no-trunc ubuntu:latest
```
This command will show the history of the "ubuntu:latest" image, and will include the full size of each layer instead of truncating it.

View the history of a Docker image and filter the output to show only the layers that were created by a specific command:
```
docker image history --filter "CMD=/bin/bash" ubuntu:latest
```
This command will show the history of the "ubuntu:latest" image, but will only show the layers that were created by the "/bin/bash" command.

The "docker image history" command is useful for understanding how a Docker image was built and for troubleshooting any issues that may arise during image creation or usage. It can also be used to optimize the size of Docker images by identifying unnecessary layers that can be removed to reduce the overall image size.

