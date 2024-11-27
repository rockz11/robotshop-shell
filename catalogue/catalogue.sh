dnf module disable nodejs -y

dnf module enable nodejs:20 -y

dnf install nodejs -y

useradd roboshop
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

cp catalogue.service /etc/systemd/system/catalogue.service

dnf install mongodb-mongosh -y
cp mongodb.repo /etc/yum.repos.d/mongodb.repo
mongosh --host mongodb.devops11.online </app/db/master-data.js

systemctl daemon-reload

systemctl enable catalogue

systemctl restart catalogue
