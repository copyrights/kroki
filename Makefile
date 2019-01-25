installLocalDependencies:
	mvn install:install-file -Dfile=./umlet/lib/umlet-mini-14.3.0.jar -DgroupId=com.umlet -DartifactId=umlet-mini -Dversion=14.3.0 -Dpackaging=jar
	mvn install:install-file -Dfile=./server/lib/ditaa-1.3.13.jar -DgroupId=ditaa -DartifactId=ditaa -Dversion=1.3.13 -Dpackaging=jar
	mvn install:install-file -Dfile=./server/lib/ditaamini-0.11.jar -DgroupId=ditaa -DartifactId=ditaa-mini -Dversion=0.11 -Dpackaging=jar

