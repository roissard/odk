# Installation

Run:

    apt-get install -y git
    git clone https://github.com/roissard/odk.git
    cd odk
    bash ./install.sh
    bash ./prepare.sh
    docker-compose up -d

Open:

    http://localhost:7081/odk-aggregate/

Then change the administrator default password by login to:

    http://localhost:7081/odk-aggregate/multimode_login.html

Click "Sign in with Aggregate password" and enter:

User name: administrator
Password: aggregate

Then click on "Site Admin" and "Change Password" for "administrator" user.

You're done!
