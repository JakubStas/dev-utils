# Useful Docker aliases

Add these lines to your profile:

```bash
alias deleteAllImages="docker rm $(docker ps -a -q)"
alias deleteAllUntaggedImages='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias deleteAllContainers="docker rmi $(docker images -q)"
```
