# makertim/continuous-deployment
Containerized pulling from git, building the container, reloading docker compose.

## Setup & usage
Run inside the git repo directory.
It periodaticly checks git, pulls when there are changes avaiable.
When there is a succesfull pull, run the given script for a build phase.
After

> Notice -> id_rsa could/should be id_ed25519 or other SSH key-pair
```bash
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "${PWD}:/build" \
  -v "$HOME/.ssh/id_rsa:/root/.ssh/id_rsa" \
  -v "$HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub" \
  -e INTERVAL=3600 \
  '[script]'
``` 

## Build
```bash
docker build -t ${PWD##*/} .
```

## Test
#todo

## Open for suggestions
#always
