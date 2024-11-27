cp catalogue.service /etc/systemd/system/catalogue.service
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

sudo dnf module disable nodejs -y
sudo dnf module enable nodejs:20 -y
sudo dnf install nodejs -y

useradd roboshop

mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

cd /app
sudo npm install

sudo dnf install mongodb-mongosh -y
mongosh --host mongodb.devops11.online </app/db/master-data.js

sudo systemctl daemon-reload
sudo systemctl enable catalogue
sudo systemctl restart catalogue
