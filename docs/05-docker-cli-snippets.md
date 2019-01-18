## Clean up

```bash
# Remove all untagged images
docker images | awk '/<none>/ {print $3}' | xargs -r docker rmi

# Docker images sort by size
docker images --format '{{.Size}}\t{{.Repository}}:{{.Tag}}\t{{.ID}}' | sort -h | column -t

# Docker volume size list
sudo du -sh /var/lib/docker/volumes/* | sort -h
```

### Cronjob: Clean Old Images

```bash
crontab -e
```

```
# m h  dom mon dow   command
# Clean old CI images
10 * * * * /home/ubuntu/devops-iac/scripts/clean_ci_images.sh
```
