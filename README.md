= Apache Directory Services Docker container

This container enables you to run a GUI app from a docker container. The GUI app
in this case is Apache Direcory Services.

== How to use

```
$> cd /path/to/this/README
$> docker build -t ads .
$> chmod +x ./start_image.sh
$> ./start_image.sh
```

== Enter image to inspect contents

```
$> docker run --rm -t -i ads bash -l
```