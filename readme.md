Данные для входа в PartsBD:
http://82.97.252.229:8080
логин: admin
пароль: Ky5wgWDeyc2cJKS

На компьютере где Altium, установить ODBC драйвер https://dev.mysql.com/downloads/connector/odbc/
Нажмите Win + R → введите odbcad32.exe → OK
Перейдите на вкладку Системный DSN
Нажмите Добавить
Выберите MySQL ODBC 8.0 Unicode Driver
Заполните настройки:
    Data Source Name: PartsDB
    TCP/IP Server: 82.97.252.229
    Port: 3307
    User: partdb
    Password: 23reoG487wghd
    Database: partdb
Нажмите Test → должно быть "Connection successful"

В Altium выбрать Libraries Preferences... 
На вкладке Installed нажать Install и выбрать тип файлов .DbLib и выбрать файл PartsDB.DbLib
Для выбора компонентов из установленной базы выбирите в списке библиотек PartsDB.DbLib - allParts

Для теста сделал передачу только Library Ref и Description

Установка ParsDB на сервер:
```bash
#Установка Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#Установка Docker Compose
sudo apt install docker-compose-plugin -y
```

Скопировать
