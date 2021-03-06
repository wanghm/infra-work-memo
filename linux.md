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

## Openssl

Confirm Expiredate of SSL certificate
```
openssl s_client -connect example.com:443 < /dev/null 2> /dev/null | openssl x509 -text | grep Not
openssl x509 -text -noout -in {certificate_file}
```


ftps
```
openssl s_client -showcerts -connect  <xxx.xxx.xxx.xxx>:21 -starttls ftp
```

## jq

Get IP ranges of AWS S3 (Tokyo region)
```
curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq '.prefixes[] | if .region == "ap-northeast-1" and .service == "S3"  then . else empty end'
```

## Customiz Query of Redmine

```
https://redmine.xxxxxxxxxx.com/projects/ppppppp/issues?set_filter=1&f[]=closed_on&op[closed_on]=><&v[closed_on][]=2018-05-23&v[closed_on][]=2018-05-29&f[]=&c[]=updated_on&c[]=category&c[]=subject&c[]=status&c[]=priority&c[]=done_ratio&c[]=assigned_to&c[]=created_on&c[]=due_date&group_by=
```

### Generate random MAC address 
```
openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
```

### Tree
````
pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'
````
