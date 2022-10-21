dockerfile=$1
prefix=ppdouble
version=0.1
imagename=$prefix/$2:$version
containername=springboot-miniserver

docker container stop $containername
docker container rm --volumes $containername
docker image rm $imagename

docker build --file $1 -t $imagename .

docker image ls | head -n 1
docker image ls | grep $prefix/$2

./run.sh $2 $version $containername
