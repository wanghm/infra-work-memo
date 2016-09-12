## Clear memory cache

````
free && sync && echo 3 > /proc/sys/vm/drop_caches && free
````
 
#### To free pagecache:

````
# echo 1 > /proc/sys/vm/drop_caches
````


#### To free dentries and inodes:

````
# echo 2 > /proc/sys/vm/drop_caches
````

#### To free pagecache, dentries and inodes:

````
# echo 3 > /proc/sys/vm/drop_caches
````

## delete empty directory

````
 find . -type d -empty -delete
````

## Jenkins RestAPI

````
curl -i -u USERNAME:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -s -S \
--data-urlencode PARAM1=aaaa \
--data-urlencode PARAM2=bbbb \
https://xxx.xxx.xxx.xxx/JOBNAME/buildWithParameters?delay=0sec&token=xxxxxxxx
````

## Install maven by yum

````
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
mvn --version
````
