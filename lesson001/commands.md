[toc]

###  1. **启动指令**

##### 1.1  使用镜像加速器

**Ubuntu 16.04+、Debian 8+、CentOS 7**

对于使用 [systemd](https://www.freedesktop.org/wiki/Software/systemd/) 的系统，请在 `/etc/docker/daemon.json` 中写入如下内容（如果文件不存在请新建该文件）

```json
{
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://hub-mirror.c.163.com"
  ]
}
```

> 注意，一定要保证该文件符合 json 规范，否则 Docker 将不能启动。

之后重新启动服务。

```bash
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```

> 注意：如果您之前查看旧教程，修改了 `docker.service` 文件内容，请去掉您添加的内容（`--registry-mirror=https://dockerhub.azk8s.cn`）。

**macOS**

```json
{
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://hub-mirror.c.163.com"
  ]
}
```

##### 1.2 拉取镜像

```dockerfile
docker pull [选项] [Docker Registry 地址[:端口号]/]仓库名[:标签]
docker pull ubuntu:18.04
```

##### 1.3 运行镜像

```dockerfile
docker run -it --rm ubuntu:18.04     bash
```

 就是运行容器的命令，具体格式我们会在 [容器](https://yeasy.gitbooks.io/docker_practice/content/container) 一节进行详细讲解，我们这里简要的说明一下上面用到的参数。

- `-it`：这是两个参数，一个是 `-i`：交互式操作，一个是 `-t` 终端。我们这里打算进入 `bash` 执行一些命令并查看返回结果，因此我们需要交互式终端。
- `--rm`：这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容器并不会立即删除，除非手动 `docker rm`。我们这里只是随便执行个命令，看看结果，不需要排障和保留结果，因此使用 `--rm` 可以避免浪费空间。
- `ubuntu:18.04`：这是指用 `ubuntu:18.04` 镜像为基础来启动容器。
- `bash`：放在镜像名后的是 **命令**，这里我们希望有个交互式 Shell，因此用的是 `bash`。

##### 1.4 列出本地docker列表

```
docker image ls
docker images
```

##### 1.5 虚悬镜像的处理（没有仓库也没有tag的镜像）

```
##展示虚悬镜像
docker image ls -f dangling=true
##删除虚悬
docker image prune
```

##### 1.6 docker展示镜像列表

```bash
docker image ls --format "{{.ID}}: {{.Repository}}"
```

