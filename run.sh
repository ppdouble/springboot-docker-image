prefix=ppdouble
version=$2
imagename=$prefix/$1:$version

containername=$3

docker run --name $containername $imagename -p 8092:8092

docker ps -a | head -n 1
docker ps -a | grep $prefix/$1
