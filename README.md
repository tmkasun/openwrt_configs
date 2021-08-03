# openwrt_configs
This repo contains the OpenWRT configurations for my customizations

- Here is the crontab jobs for switching the WAN connection at 8AM morning and 12 midnight, and taking backup of stats at every 6 hours
```
0 */6 * * * /etc/init.d/rrdbackup backup
0 8 * * * uci set mwan3.all.use_policy='all_wans'; uci commit; mwan3 restart
0 0 * * * uci set mwan3.all.use_policy='testp'; uci commit; mwan3 restart
```
- [Discussion on how to shedule wifi](https://forum.openwrt.org/t/scheduling-on-off-wifi/3385/25)

# How to update luci router tls cert using let's encrypt

1. Stop nginx or any other HTTP servers who is holding the port 80
```
sudo systemctl stop nginx.service
```

2. Make sure your domain names are resolvable in the server you are running the `certbot`
        
    - i:e Check in cloudflare `https://dash.cloudflare.com/` whether DNS are mapped correctly

3. run let's encrypt cert bot
```
sudo certbot renew
```

### Check the permissions before coping

4. Copy the certificate files to temporary location
```
sudo cp -R  /etc/letsencrypt/archive/router.knnect.com/ .
```

5.Copy and replace the router `uhttpd` key and cert
```
scp -v privkey2.pem  root@router.knnect.com:/etc/uhttpd.key
```
and
```
scp -v cert2.pem    root@router.knnect.com:/etc/uhttpd.crt
```
6. login to the router and restart the `uhttpd` server
```
/etc/init.d/uhttpd restart
```