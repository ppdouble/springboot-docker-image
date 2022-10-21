cd pemo
./mvnw package
cd ../
rm -rf target/dependency
mkdir -p target/dependency
jarpath=$(ls pemo/target/pemo*.jar)
echo $jarpath
cp $jarpath target/
cd target/dependency
pwd
jar -xf ../*.jar
