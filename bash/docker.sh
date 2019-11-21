function DockerConfigurations()
{
    alias dockps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
}

DockerConfigurations

