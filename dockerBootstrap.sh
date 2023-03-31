echo -e "----------登录镜像容器服务------------"
# 登录aliyun镜像容器服务, 在aliyun镜像仓库示例中操作指南查看登录命令
docker login --username=$1 registry.cn-shenzhen.aliyuncs.com --password=$2
echo -e "----------停掉镜像-------------"
# 停掉镜像
docker stop blog-code
echo -e "------------删除本地容器和镜像----------------"
# 删除本地容器
docker rm blog-code
# 删除本地镜像
docker rmi registry.cn-shenzhen.aliyuncs.com/ewan/first:latest
echo -e "---------从Registry中拉取镜像------------"
# 拉取镜像
docker pull registry.cn-shenzhen.aliyuncs.com/ewan/first:latest
echo -e "------------创建容器并运行容器---------------"
# -rm: docker会在容器退出时删除与它关联的数据卷
# -d: 后台运行容器，并返回容器id
# -p: 端口映射， 本机端口：容器端口
# --name: 指定容器名称
# 最后一个为镜像名称
docker run -rm -d -p 8080:80 --name blog-code registry.cn-shenzhen.aliyuncs.com/ewan/first:latest
echo -e "------------执行完毕------------------"