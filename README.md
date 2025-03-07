# filebrowser

## api文档
- 可使用在线文档http://localhost:8080/swagger/index.html
- 可使用工具导入doc/openapi.yaml文件查看

## 关键词
- k8s
- podman

## 历史版本
*当前版本*：3.1.0 具体查看**version**文件
- 3.1.0
- 3.0.0

### 1.构建应用缓存镜像
开发阶段编译调试，适用于本地**无匹配的mvn版本**构建的场景
```
podman build -t cr.freeb.vip/freeb/filebrowser-cache:latest -f Dockerfile.cache .
```

#### 1.1 容器内构建调试
```
podman run -it --rm -v $(pwd)/:/app -w /app cr.freeb.vip/freeb/filebrowser-cache:latest bash

```

### 2.构建应用镜像
```
podman build -t cr.freeb.vip/freeb/filebrowser:dev -f Dockerfile .

#推送到镜像仓
podman push cr.freeb.vip/freeb/filebrowser:dev
```

#### 2.1 流水线构建


### 3.Helm 部署
[Helm](https://helm.sh/zh/)是k8s模板化部署高效工具，具体查看官网教程

部署命名空间:filebrowser
```
cd chart/
helm install filebrowser filebrowser/ -n filebrowser
```

### 4.Helm 升级

部署命名空间:a-filebrowser

```
cd chart/
helm upgrade filebrowser filebrowser/ -n filebrowser
```

### 5.Helm 卸载

部署命名空间:filebrowser

```
cd chart/
helm uninstall filebrowser filebrowser/ -n filebrowser
```

### 6.Helm 调试

部署命名空间:filebrowser

```
cd chart/

## 导出k8s可部署的yaml
helm template filebrowser filebrowser/ -n filebrowser > test.yaml

## 直接k8s部署
kubectl apply -f test.yaml

## debug模式输出，适用于模板有问题时调试使用
helm template filebrowser filebrowser/ -n a-filebrowser--debug > test.yaml
```



## Demo

url: https://demo.filebrowser.org/

credentials: `demo`/`demo`

## Features

Please refer to our docs at [https://filebrowser.org/features](https://filebrowser.org/features)

## Install

For installation instructions please refer to our docs at [https://filebrowser.org/installation](https://filebrowser.org/installation).

## Configuration

[Authentication Method](https://filebrowser.org/configuration/authentication-method) - You can change the way the user authenticates with the filebrowser server

[Command Runner](https://filebrowser.org/configuration/command-runner) - The command runner is a feature that enables you to execute any shell command you want before or after a certain event.

[Custom Branding](https://filebrowser.org/configuration/custom-branding) - You can customize your File Browser installation by change its name to any other you want, by adding a global custom style sheet and by using your own logotype if you want.

## Contributing

If you're interested in contributing to this project, our docs are best places to start [https://filebrowser.org/contributing](https://filebrowser.org/contributing).
