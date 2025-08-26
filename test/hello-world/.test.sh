docker run --rm -it \
  -v "$HOME/.ssh/id_rsa:/root/.ssh/id_rsa" \
  -v "$HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub" \
  -v "${PWD}:/build" -v /var/run/docker.sock:/var/run/docker.sock \
  -e INTERVAL=15 \
  -e LOOP_COUNT=1 \
  -e SKIP_GIT=1 \
  makertim/continuous-deployment \
  sh
