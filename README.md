# docker-netdata

`sudo docker build --no-cache -t netdata . ; sudo docker stop netdata && sudo docker rm netdata ; sudo docker stop netdata && sudo docker rm netdata && sudo docker run --cap-add SYS_PTRACE  -v /proc:/host/proc:ro -v /sys:/host/sys:ro --net=host -d  --name=netdata netdata`




