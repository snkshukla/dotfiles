# aliases
alias dcup="COMPOSE_HTTP_TIMEOUT=10000 docker-compose up"
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias drmc='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias drmv='docker volume rm $(docker volume ls -q -f "dangling=true")'
alias dcb="docker-compose build"
alias dcl="COMPOSE_HTTP_TIMEOUT=10000 docker-compose logs -f"
alias dcr="docker-compose restart"
alias dcs="docker-compose stop"
alias dexit="docker exec -it"
alias dcx="docker-compose exec"
alias dcp="docker-compose pull"
alias dcpb="docker-compose pull && docker-compose build"
alias dcps="docker-compose ps"
alias drs="docker restart"
alias k="kubectl"
alias kx="kubectx"
alias ke="kubens"

# Helper functions for using docker with rails
drc() {
    [ $# -eq 0 ] && { echo "\nUsage: $0 app_container_name [-s]\n"; return 1; }
    docker exec -it $1 bundle exec rails c $2;
}

dspec() {
    [ $# -eq 0 ] && { echo "\nUsage: $0 app_container_name file_name\n"; return 1; }
    docker exec -it $1 rspec --color $2 --format documentation;
}

ddlog() {
    [ $# -eq 0 ] && { echo "\nUsage: $0 app_container_name\n"; return 1; }
    docker exec -it $1 tail -f log/development.log;
}

ddb() {
    [ $# -eq 0 ] && { echo "\nUsage: $0 app_container_name mysql -u user_name -p\n"; return 1; }
    docker exec -it $1 mysql $2 $3 $4;
}

dbash() {
    [ $# -eq 0 ] && { echo "\nUsage: $0 app_container_name\n"; return 1; }
    docker exec -it $1 /bin/bash -c "stty cols $COLUMNS rows $LINES && bash";
}

dcbash() {
    [ $# -eq 0 ] && { echo "\nUsage: $0 app_container_name\n"; return 1; }
    docker-compose exec $1 /bin/bash -c "stty cols $COLUMNS rows $LINES && bash";
}

