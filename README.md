# openwrt_configs
This repo contains the OpenWRT configurations for my customisations

- Here is the crontab jobs for switching the WAN connection at 8AM morning and 12 midnight, and taking backup of stats at every 6 hours
```
0 */6 * * * /etc/init.d/rrdbackup backup
0 8 * * * uci set mwan3.all.use_policy='all_wans'; uci commit; mwan3 restart
0 0 * * * uci set mwan3.all.use_policy='testp'; uci commit; mwan3 restart
```
- [Discussion on how to shedule wifi](https://forum.openwrt.org/t/scheduling-on-off-wifi/3385/25)
