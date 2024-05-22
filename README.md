
## Building a ros docker image

- `cd into the build folder`
- Change the working directory if needed in the build.sh file, default will be `~/Documents/docker_storage/ros-<distro name>`
- Run `./build.sh <ros distro name>` (foxy, humble, galactic).
- After build is finished run `./ros.sh <distro name>` will open a interactive shell with GUI support in linux.
- Rerun the `./ros.sh <distro name>` will attach a container.
