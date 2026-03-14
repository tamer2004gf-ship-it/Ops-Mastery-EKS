#!/bin/bash اخذتوا من شات لانوا تعبت وانا ادر على فاضي ممكن بعدين اكمل الفيديوا اليوتيوب وافهم الفكره

# 1️⃣ المتغيرات
GITHUB_REPO="https://github.com/tamer2004gf-ship-it/devops-mini-project29.12.25.git"
APP_USER="appuser"
APP_DIR="/home/${APP_USER}/app"

# 2️⃣ إنشاء المستخدم والدليل
useradd -m ${APP_USER}
mkdir -p ${APP_DIR}
chown -R ${APP_USER}:${APP_USER} ${APP_DIR}

# 3️⃣ تحديث النظام وتثبيت Python/git
apt-get update -y && apt-get upgrade -y
apt-get install -y python3.11 python3-pip git

# 4️⃣ استنساخ الريبو
sudo -u ${APP_USER} git clone ${GITHUB_REPO} ${APP_DIR}

# 5️⃣ إنشاء virtual environment وتثبيت dependencies
sudo -u ${APP_USER} python3 -m venv ${APP_DIR}/venv
sudo -u ${APP_USER} ${APP_DIR}/venv/bin/pip install --upgrade pip
sudo -u ${APP_USER} ${APP_DIR}/venv/bin/pip install -r ${APP_DIR}/requirements.txt
sudo -u ${APP_USER} ${APP_DIR}/venv/bin/pip install gunicorn

# 6️⃣ إنشاء systemd service
cat <<EOT > /etc/systemd/system/app.service
[Unit]
Description=Python App Service
After=network.target

[Service]
User=${APP_USER}
Group=${APP_USER}
WorkingDirectory=${APP_DIR}
ExecStart=${APP_DIR}/venv/bin/gunicorn --bind 0.0.0.0:8000 main:app

[Install]
WantedBy=multi-user.target
EOT

# 7️⃣ تفعيل وتشغيل الخدمة
systemctl daemon-reload
systemctl enable app.service
systemctl start app.service
