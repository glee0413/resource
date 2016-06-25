端口重定向
sudo iptables -t nat -A PREROUTING -d 192.168.50.231 -p tcp -m tcp --dport 3021 -j REDIRECT --to-ports 21
     iptables -t nat -A PREROUTING -d 115.28.218.238 -p tcp -m tcp --dport 56789 -j REDIRECT --to-ports 3306
开启端口：
iptables -A INPUT -p tcp --dport 161 -j ACCEPT

开始linux防火墙nat转发
iptables -t nat -A PREROUTING -p tcp --dport 2022 -j DNAT --to-destination 10.173.35.157:22 
iptables -t nat -A POSTROUTING -d 10.173.35.157 -p tcp --dport 22 -j SNAT --to 10.171.37.38

snat
iptables -t nat -A POSTROUTING -s 1.1.1.0/255.255.255.0 -o wlan0 -j MASQUERADE

 service iptables save

service iptables restart 
崔超的Ip: 182.92.168.122/ 10.171.37.38 密码Cuichao123

防火墙:
普天nat
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 30154 -j DNAT --to-destination 10.9.30.154:8080
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -p icmp --icmp-type 11 -j DROP

开启snat和dnat,并开启端口转发
dnat修改目的端口,snat修改原端口
iptables -t nat -A PREROUTING -d local_ip -p tcp --dport 80 -j DNAT --to-destination remote_ip:80
iptables -t nat -A POSTROUTING -d remote_ip-p tcp --dport 80 -j SNAT --to local_ip
sysctl -w net.ipv4.ip_forward=1

ICMP timestamp请求响应漏洞解决方案：
iptables -A INPUT -p ICMP --icmp-type timestamp-request -j DROP
iptables -A OUTPUT -p ICMP --icmp-type timestamp-reply -j DROP

限制ip连接的个数
sudo iptables -A INPUT -p tcp --dport 22 -m connlimit --connlimit-above 3--connlimit-mask 0 -j DROP

linux作路由及nat
在子网内添加路由
sudo iptables -t nat -A POSTROUTING -s 192.168.7.0/24 -j MASQUERADE
