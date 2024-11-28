cp mongodb.repo /etc/yum.repos.d/mongodb.repo
cp catalogue.service /etc/systemd/system/catalogue.service

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

useradd roboshop

mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifact.s3.amazonaws.com/catalogue-v3.zip
cd /app
npm install

dnf install mongodb-mongosh -y
mongosh --host mongodb.devops11.online </app/db/master-data.js

systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
