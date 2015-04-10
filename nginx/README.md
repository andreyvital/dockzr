# nginx `1.7.9`

You fucking should run `nginx` and provide `nginx.conf` by yourself.

`$ nginx -c /etc/conf/nginx.conf`

Also, if you're **[docker-composing](https://docs.docker.com/compose/)**, you can:
```yaml
nginx:
    ...
    ...
    command: nginx -c /etc/conf/nginx.conf
    volumes:
        - "etc/nginx:/etc/conf"
```

*Assuming that you have an* **nginx.conf** at *`pwd`/etc/nginx*.


## Installed modules
- `simpl/ngx_devel_kit`
- `openresty/lua-nginx-module`
- `openresty/headers-more-nginx-module`
- `openresty/echo-nginx-module`
