# docker-netdata

## Info:
Based on Alpine:latest

## Usage:
`sudo docker rm -f netdata ;sudo docker run --cap-add SYS_PTRACE -v /proc:/host/proc:ro -v /sys:/host/sys:ro --net=host -v /var/run/docker.sock:/var/run/docker.sock -p 19999:19999 -d --restart always --name=netdata lukasmrtvy/docker-netdata`




