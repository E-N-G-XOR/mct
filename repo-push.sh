tag="v1"
docker build -t "englotus/mct-web:$tag" .
docker push "englotus/mct-web:$tag"
