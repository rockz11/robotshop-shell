cp catalogue.service /etc/systemd/system/catalogue.service
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

dnf module disable nodejs -y

dnf module enable nodejs:20 -y

dnf install nodejs -y

useradd roboshop
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

dnf install mongodb-mongosh -y

mongosh --host mongodb.devops11.online </app/db/master-data.js

systemctl daemon-reload

systemctl enable catalogue

systemctl restart catalogue
