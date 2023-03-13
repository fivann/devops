### SELinux Status and Configuration
```
sestatus
```
Displays the current status of SELinux, including the mode, policy version, and enforcement state.

Example:

```
$ sestatus
SELinux status:                 enabled
SELinux mode:                   enforcing
SELinux policy:                 targeted
SELinux enforcing mode:          enforcing
```

```
getenforce
```
Displays the current enforcement mode of SELinux.

Example:
```
$ getenforce
Enforcing
/etc/selinux/config
```

### The configuration file for SELinux. It contains the SELINUX parameter that determines the mode of SELinux.

Example:
```
Copy code
SELINUX=enforcing
Managing SELinux Policy
```

```
semanage
```
Manages SELinux policy modules, port labeling, and boolean values.

Example:
```
$ semanage port -a -t http_port_t -p tcp 8080
$ semanage boolean -m ftpd_use_passive_mode on
```

```
semodule
```
Manages SELinux policy modules.

Example:
```
$ semodule -i mypolicy.pp
$ semodule -r mypolicy
```

#### Troubleshooting SELinux Issues
```
ausearch
```
Searches the audit log for SELinux-related messages.

Example:
```
$ ausearch -m avc -ts recent
```

```
audit2allow
```
Analyzes SELinux audit log messages and generates custom SELinux policies.

Example:
```
$ grep httpd /var/log/audit/audit.log | audit2allow -M mypol
$ semodule -i mypol.pp
```

```
setsebool
```
Manages SELinux boolean values.
```
$ setsebool -P httpd_can_network_connect 1
```

```
restorecon
```
Resets the SELinux context of files and directories.
```
$ restorecon -R /var/www/html
```


