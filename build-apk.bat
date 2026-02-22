@echo off
echo === Сборка APK для Neko Puk3 ===

echo 1. Установка зависимостей...
call npm install

echo 2. Сборка Android APK...
cd android

echo 3. Очистка предыдущих сборок...
call gradlew clean

echo 4. Сборка релизной версии APK...
call gradlew assembleRelease

echo 5. Проверка наличия APK...
if exist "app\build\outputs\apk\release\app-release.apk" (
    echo ✅ APK успешно собран!
    echo 📁 Путь к APK: app\build\outputs\apk\release\app-release.apk
    
    rem Копирование APK в корневую папку
    copy "app\build\outputs\apk\release\app-release.apk" ..\neko-puk3-release.apk
    echo 📄 APK скопирован в: neko-puk3-release.apk
) else (
    echo ❌ Ошибка: APK не найден
    exit /b 1
)

echo === Сборка завершена ===
pause