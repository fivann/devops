### Firewalld Cheat Sheet
#### Define a zone
```
  firewall-cmd --permanent --new-zone=myzone
  firewall-cmd --permanent --zone=myzone --set-target=ACCEPT
  firewall-cmd --permanent --zone=myzone --add-interface=eth0
  firewall-cmd --permanent --zone=myzone --add-source=192.168.0.0/24
  firewall-cmd --permanent --zone=myzone --add-service=ssh
  firewall-cmd --reload
```
This creates a new zone named "myzone" with a target of "ACCEPT", interfaces of "eth0", sources of "192.168.0.0/24", and a service of "ssh". The "firewall-cmd --reload" command reloads the firewall rules to apply the changes.

Allow incoming traffic
```
  firewall-cmd --permanent --zone=public --add-service=http
  firewall-cmd --permanent --zone=public --add-service=https
  firewall-cmd --reload
```
This allows incoming traffic on HTTP and HTTPS ports by adding the "http" and "https" services to the "public" zone.

Block incoming traffic
```
  firewall-cmd --permanent --zone=public --remove-service=http
  firewall-cmd --permanent --zone=public --remove-service=https
  firewall-cmd --reload
  ```
This blocks incoming traffic on HTTP and HTTPS ports by removing the "http" and "https" services from the "public" zone.

Enable logging
```
  firewall-cmd --permanent --set-log-denied=all
  firewall-cmd --reload
```
This enables logging of all denied traffic.

List zones
```
  firewall-cmd --get-zones
  ```
This lists all the defined zones.

List services
```
  firewall-cmd --get-services
  ```
This lists all the defined services.

List ports
```
firewall-cmd --list-p orts
```
This lists all the open ports.

List rules
```
  firewall-cmd --list-all
```
This lists all the defined rules.




