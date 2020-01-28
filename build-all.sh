for n in `seq 1 8`; do
  (eval $(docker-machine env worker-$n)
  bin/docker-image-tool.sh -t v2.3 build >build-log-$n 2>&1)&
done
  (eval $(docker-machine env master)
  bin/docker-image-tool.sh -t v2.3 build >build-log-m 2>&1) &

  for n in `jobs -p`; do
    wait $n
  done
  # run dev/make-distribution.sh --tgz --name safe-spark -Phadoop-2.7

