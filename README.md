# Installation

Run:

``` bash
apt-get install -y git
git clone https://github.com/CartONG/odk.git
cd odk
bash ./install.sh
bash ./prepare.sh
systemctl start odk
```

If setup is to be done on a production domain, update the conf, in the `security.properties` file to follow your need:
``` yml
...
security.server.hostname=aggregate.domain.org
security.server.port=80
security.server.securePort=443
...
```

Open:

    http://<RASPBERRY_IP>/

Then change the administrator default password by login to:

    http://<RASPBERRY_IP>/multimode_login.html

Click "Sign in with Aggregate password" and enter:

User name: administrator
Password: aggregate

Then click on "Site Admin" and "Change Password" for "administrator" user.

You're done!
