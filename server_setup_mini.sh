
cat <<EOL | sudo tee /etc/apache2/sites-available/test_project.conf
<VirtualHost *:80>
    ServerName 192.168.74.126

    WSGIDaemonProcess test_project python-home=/home/dom/bruxpulse/venv python-path=/home/dom/bruxpulse/mini_src
    WSGIProcessGroup test_project
    WSGIScriptAlias / /home/dom/bruxpulse/mini_src/test_project.wsgi

    <Directory /home/dom/bruxpulse>
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/test_project_error.log
    CustomLog ${APACHE_LOG_DIR}/test_project_access.log combined
</VirtualHost>
EOL


sudo a2ensite test_project
sudo systemctl reload apache2