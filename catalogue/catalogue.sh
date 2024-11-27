cp mongodb.repo /etc/yum.repos.d/mongodb.repo
cp catalogue.service /etc/systemd/system/catalogue.service
#dnf module disablrnodejs -y
#dnf module enable nodejs:20 -y
#dnf install nodejs -y
#useradd roboshop

#mkdir /app

#curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
#cd /app
#unzip /tmp/catalogue.zip

#cd /app
#npm install

#dnf install mongodb-mongosh -y
#mongosh --host mongodb.devops11.online </app/db/master-data.js

#systemctl daemon-reload
#systemctl enable catalogue
#systemctl restart catalogue

##here we got the problem ,we havent updated the 127.0.0.1 to 0.0.0.0
## the are two ways to do it
#1 . with the help of sed command
#2 . pull the whole configuration and edit the file.
#

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
dnf install mongodb-mongosh -y
mongosh --host mongodb.devops11.online </app/db/master-data.js
