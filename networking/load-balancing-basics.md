NGINX и HAProxy оба являются популярными решениями для балансировки нагрузки и обратного проксирования. Они обладают разными характеристиками, и выбор между ними зависит от ваших потребностей и требований к производительности.

### NGINX:

-  NGINX был первоначально разработан как веб-сервер и затем эволюционировал до полноценного балансировщика нагрузки и обратного прокси.
-  NGINX использует асинхронную архитектуру событий, что позволяет обрабатывать множество соединений одновременно с минимальными накладными расходами.
-  NGINX поддерживает HTTP, HTTPS, HTTP/2, gRPC и TCP протоколы.
-  NGINX хорошо подходит для статического содержимого и кэширования.
-  NGINX обеспечивает более высокую производительность при обработке SSL/TLS.
-  NGINX поддерживает различные алгоритмы балансировки нагрузки, такие как Round Robin, Least Connections, IP Hash и др.
-  
Пример использования NGINX:
```
http {
    upstream backend {
        server backend1.example.com weight=5;
        server backend2.example.com;
        server unix:/tmp/backend3;

        # Health check for the backend servers
        check interval=3000 rise=2 fall=5 timeout=1000 type=http;
        check_http_send "HEAD / HTTP/1.0\r\n\r\n";
        check_http_expect_alive http_2xx http_3xx;
    }

    server {
        listen 80;
        server_name example.com;

        location / {
            proxy_pass http://backend;
        }

        error_page 502 /502.html;
        location = /502.html {
            root /usr/share/nginx/html;
        }
    }
}
```
### HAProxy:
- HAProxy был специально разработан для балансировки нагрузки и обратного проксирования на протоколах TCP и HTTP.
- HAProxy использует многопоточную архитектуруру, что также позволяет обрабатывать множество соединений одновременно.
- HAProxy хорошо подходит для высоконагруженных приложений, где требуется продвинутая настройка балансировки нагрузки.
- HAProxy поддерживает только протоколы TCP и HTTP.
= HAProxy имеет больше возможностей для мониторинга и анализа состояния сервера.
```
global
    log /dev/log local0
    log /dev/log local1 notice
    chroot /var/lib/haproxy
    stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
    stats timeout 30s
    user haproxy
    group haproxy
    daemon

defaults
    log global
    mode http
    option httplog
    option dontlognull
    option forwardfor
    option http-server-close
    timeout connect 5000
    timeout client 50000
    timeout server 50000

frontend web_frontend
    bind *:80
    mode http
    default_backend web_servers

backend web_servers
    mode http
    balance roundrobin
    option httpchk HEAD / HTTP/1.1\r\nHost:localhost
    server web1 192.168.1.101:80 check
    server web2 192.168.1.102:80 check
```
---
```
# Создание балансировщика нагрузки
#----------------------------------------

# Аутентифицируйтесь на сервере

# Установите HAProxy на Server1
# Установка HAProxy
- name: Установка HAProxy
  become: true
  yum:
    name: haproxy
    state: present

# Включение и запуск службы HAProxy
- name: Включение и запуск службы HAProxy
  become: true
  service:
    name: haproxy
    enabled: true
    state: started

# Проверьте, что трафик на входящий порт 80 разрешен через брандмауэр
- name: Разрешение трафика на входящий порт 80
  become: true
  shell: firewall-cmd --add-service=http --permanent
- name: Перезагрузка брандмауэра
  become: true
  shell: firewall-cmd --reload

# Настройка HAProxy на Server1
- name: Настройка HAProxy на Server1
  become: true
  lineinfile:
    path: /etc/haproxy/haproxy.cfg
    line: |
      timeout check 10s
      maxconn 3000

      frontend app1
        bind *:80
        mode http
        default_backend apache_nodes

      backend apache_nodes
        mode http
        balance source
        server node1 10.0.1.20:8080 check
        server node2 10.0.1.30:8080 check

# Перезагрузка HAProxy для применения настроек
- name: Перезагрузка HAProxy для применения настроек
  become: true
  service:
    name: haproxy
    state: restarted
```
---
Объяснения для всех команд:
```
become: true - позволяет получить права суперпользователя (root);
yum - менеджер пакетов, используемый в операционных системах семейства Red Hat;
systemctl - утилита, используемая для управления службами в системах, использующих systemd;
firewall-cmd - утилита, используемая для настройки брандмауэра;
lineinfile - модуль Ansible, позволяющий добавлять, удалять или изменять строки в файле;
shell - модуль Ansible, позволяющий выполнять команды shell.
```

