# nginx-foundation

Set up nginx for Amrita local applications and apis. 
- For internal we use app.amrita-local.net
- For apis we use api.amrita-local.io
- For external facing apps we use amrita-local.com

## Prerequisites
- This should be last step, make sure all the apis and apps are running 
- You have to generate certificates before docker compose up. Run the nginx-setup shell script nginx-setup.sh
- Add the created certificates (.crt) to the Trusted Root Certification Authorities

* The ngix conf path is a mounted volume, you would need to delete the volume to set up the conf and certs

```shell
./nginx-setup.sh
```
