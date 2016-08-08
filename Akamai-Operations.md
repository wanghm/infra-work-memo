
## confirm HTTP headers of Akamai 

```
curl -D - -o /dev/null -s -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no, akamai-x-feo-trace, akamai-x-get-request-id" \
-H "User-Agent: iPhone" "https://xxx.xxx.xxx.xxx/xxx/xxx/" -i -L
```
