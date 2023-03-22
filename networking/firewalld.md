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

----
### ZONES
Firewalld is a popular firewall management tool that uses zones to define different trust levels for network connections or interfaces. Here's a YAML representation of the default zones provided by firewalld, along with brief descriptions and examples:
```
- zone: DROP
  description: | 
    Any incoming network packets are dropped without any further processing. 
    Only outgoing network connections are possible.
  example:
    - command: firewall-cmd --zone=DROP --add-interface=eth1
      explanation: Assign interface eth1 to the DROP zone, dropping all incoming traffic on the interface.

- zone: BLOCK
  description: | 
    Similar to DROP, incoming connections are rejected with an icmp-host-prohibited or icmp6-adm-prohibited message. 
    Only outgoing network connections are possible.
  example:
    - command: firewall-cmd --zone=BLOCK --add-interface=eth1
      explanation: Assign interface eth1 to the BLOCK zone, rejecting all incoming traffic on the interface.

- zone: PUBLIC
  description: | 
    Represents public, untrusted networks. 
    You don't trust other computers but may allow selected incoming connections.
  example:
    - command: firewall-cmd --zone=PUBLIC --add-service=http
      explanation: Allow incoming HTTP traffic in the PUBLIC zone.

- zone: EXTERNAL
  description: |
    Used for external networks with NAT masquerading enabled, especially for routers. 
    You don't trust other computers.
  example:
    - command: firewall-cmd --zone=EXTERNAL --add-masquerade
      explanation: Enable NAT masquerading in the EXTERNAL zone.

- zone: INTERNAL
  description: | 
    For use on internal networks. 
    You mostly trust other computers but may only allow selected incoming connections.
  example:
    - command: firewall-cmd --zone=INTERNAL --add-service=http
      explanation: Allow incoming HTTP traffic in the INTERNAL zone.

- zone: DMZ
  description: | 
    Used for computers located in a DMZ (demilitarized zone). 
    Limited access is allowed for selected incoming connections.
  example:
    - command: firewall-cmd --zone=DMZ --add-service=http
      explanation: Allow incoming HTTP traffic in the DMZ zone.

- zone: WORK
  description: Used for work machines. Trust most other computers. Only selected incoming connections are allowed.
  example:
    - command: firewall-cmd --zone=WORK --add-service=http
      explanation: Allow incoming HTTP traffic in the WORK zone.

- zone: HOME
  description: Used for home machines. Trust most other computers. Only selected incoming connections are allowed.
  example:
    - command: firewall-cmd --zone=HOME --add-service=http
      explanation: Allow incoming HTTP traffic in the HOME zone.

- zone: TRUSTED
  description: All network connections are accepted. Trust all computers.
  example:
    - command: firewall-cmd --zone=TRUSTED --add-interface=eth1
      explanation: Assign interface eth1 to the TRUSTED zone, accepting all network connections on the interface.

```

### IPSet
  IP sets are a feature in firewalld that allow you to create sets of IP addresses, networks, or ports, which can then be used in firewalld rules. This can help simplify the management of firewall rules when working with a large number of IP addresses or ports. Here's a YAML representation of using IP sets with firewalld:
```
- step: Create an IP set
  description: Create an IP set with a specified type (e.g., hash:ip, hash:net, or hash:port).
  example:
    - command: firewall-cmd --permanent --new-ipset=blocked_ips --type=hash:ip
      explanation: Create a new IP set named "blocked_ips" with the type "hash:ip".

- step: Add elements to an IP set
  description: Add IP addresses, networks, or ports to an existing IP set.
  example:
    - command: firewall-cmd --permanent --ipset=blocked_ips --add-entry=192.168.1.10
      explanation: Add the IP address 192.168.1.10 to the "blocked_ips" IP set.

- step: Remove elements from an IP set
  description: Remove IP addresses, networks, or ports from an existing IP set.
  example:
    - command: firewall-cmd --permanent --ipset=blocked_ips --remove-entry=192.168.1.10
      explanation: Remove the IP address 192.168.1.10 from the "blocked_ips" IP set.

- step: Delete an IP set
  description: Delete an existing IP set.
  example:
    - command: firewall-cmd --permanent --delete-ipset=blocked_ips
      explanation: Delete the "blocked_ips" IP set.

- step: Use an IP set in a firewall rule
  description: | 
    Use an IP set in a firewall rule to apply actions (e.g., accept, reject, or drop) 
    to the specified set of IP addresses, networks, or ports.
  example:
    - command: firewall-cmd --permanent --zone=public --add-rich-rule='rule source ipset=blocked_ips drop'
      explanation: Drop all incoming traffic from IP addresses in the "blocked_ips" IP set in the public zone.

```
