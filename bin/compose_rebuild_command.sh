inspect_args

# docker compose down && docker compose up "$@"

all=${other_args[*]}

docker compose down && docker compose up "$all"
