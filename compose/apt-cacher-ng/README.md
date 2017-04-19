# Apt-cacher-ng

Docs: https://www.unix-ag.uni-kl.de/~bloch/acng/

## Using docker0 default

```sh
echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' | tee /etc/apt/apt.conf.d/01proxy
```

