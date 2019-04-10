for n in `seq 1 6`; do
  (eval $(docker-machine env worker-$n)
  bin/docker-image-tool.sh -t v2.3 build >build-log-$n 2>&1)&
done
  (eval $(docker-machine env master)
  bin/docker-image-tool.sh -t v2.3 build >build-log-m 2>&1) &

  for n in `jobs -p`; do
    wait $n
  done
