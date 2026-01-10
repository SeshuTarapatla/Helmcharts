Install command:
```ps
helm install wsl-config .\WSL\ --set host="$((wsl ip route show default).Split()[2])"
```
