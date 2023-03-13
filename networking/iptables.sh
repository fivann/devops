# Display current rules: 
iptables -L

# Flush all rules: 
iptables -F

# Allow incoming SSH traffic: 
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Allow outgoing SSH traffic: 
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Block all incoming traffic: 
iptables -P INPUT DROP

# Block all outgoing traffic: 
iptables -P OUTPUT DROP

# Allow incoming traffic from specific IP address: 
iptables -A INPUT -s [IP ADDRESS] -j ACCEPT

# Allow outgoing traffic to specific IP address: 
iptables -A OUTPUT -d [IP ADDRESS] -j ACCEPT

# Block incoming traffic to specific port: 
iptables -A INPUT -p tcp --dport [PORT NUMBER] -j DROP

# Block outgoing traffic to specific port: 
iptables -A OUTPUT -p tcp --dport [PORT NUMBER] -j DROP

