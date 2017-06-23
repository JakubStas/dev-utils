# Useful Docker aliases

Add these lines to your profile:

```bash
alias dps="docker ps"
alias dcps="docker-compose ps"

alias deleteAllComposeImages="docker-compose rm --all"
alias deleteAllImages="docker rm $(docker ps -a -q)"
alias deleteAllUntaggedImages='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias deleteAllContainers="docker rmi $(docker images -q)"
```
# Proxy settings

Export proxies in the file: `/etc/defaults/docker.io`

```bash
ENV http_proxy 'http://user:password@proxy-host:proxy-port'
ENV https_proxy 'http://user:password@proxy-host:proxy-port'
ENV HTTP_PROXY 'http://user:password@proxy-host:proxy-port'
ENV HTTPS_PROXY 'http://user:password@proxy-host:proxy-port'
```

Restart the service:

```bash
service docker.io restart
```
