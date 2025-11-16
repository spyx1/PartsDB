PartsBD находится по адресу: http://82.97.252.229:8080

**Подключение PartsDB к Altium**
- На компьютере где Altium, установить ODBC драйвер https://dev.mysql.com/downloads/connector/odbc/
- Нажмите Win + R → введите odbcad32.exe → OK
- Перейдите на вкладку Системный DSN
- Нажмите Добавить
- Выберите MySQL ODBC 8.0 Unicode Driver
    - Заполните настройки:
        - Data Source Name: PartsDB
        - TCP/IP Server: 82.97.252.229
        - Port: 3307
        - User: partdb
        - Password: 23reoG487wghd
        - Database: partdb
    - Нажмите Test → должно быть "Connection successful"
- В Altium выбрать Libraries Preferences... 
- На вкладке Installed нажать Install и выбрать тип файлов .DbLib и выбрать файл PartsDB.DbLib
 - Для выбора компонентов из установленной базы выбирите в списке библиотек PartsDB.DbLib - allParts (Для теста сделал передачу только Library Ref и Description)

**Установка ParsDB на новый сервер**
```bash
#Установка Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#Установка Docker Compose
sudo apt install docker-compose-plugin -y

git clone https://github.com/spyx1/PartsDB.git
cd parts-db

# Запуск всех сервисов
docker compose up -d

# Проверка статуса
docker compose ps

# Подождать около 1 минуту, далее посмотреть логи и в последних строчка будет пароль admin
docker-compose logs partdb

# Если пароль не увидели, то выполнить команду для сброса пароля
docker exec -it partdb php bin/console partdb:users:set-password admin

# Создать представления для Altium
./setup.sh

```
- В файле sql-scripts/create-allparts.sql лежит представление для Altium, его можно менять для передачи других полей из PartsDb в Altium
- Для теста помимо представления добавляются демо данные (несколько резисторов)
