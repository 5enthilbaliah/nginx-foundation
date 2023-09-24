# nginx-foundation

You have to generate certificates before docker compose up. Run the nginx-setup shell script

* The ngix conf path is a mounted volume, you would need to delete the volume to set up the conf and certs

```shell
./nginx-setup.sh
```