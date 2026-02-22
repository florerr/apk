@echo off
echo === Настройка Git и загрузка в GitHub ===
echo.

echo 1. Инициализация Git репозитория...
git init

echo.
echo 2. Добавление всех файлов...
git add .

echo.
echo 3. Создание первого коммита...
git commit -m "Initial commit - Neko Puk3 Android App"

echo.
echo 4. Добавление удаленного репозитория...
git remote add origin https://github.com/florerr/apk.git

echo.
echo 5. Переименование ветки в main...
git branch -M main

echo.
echo 6. Загрузка в GitHub...
git push -u origin main

echo.
echo === Готово! ===
echo.
echo Теперь:
echo 1. Перейдите на https://github.com/florerr/apk
echo 2. Откройте вкладку "Actions"
echo 3. Дождитесь завершения сборки APK
echo 4. Скачайте APK из раздела "Artifacts"
echo.
pause