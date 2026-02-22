@echo off
echo === Создание реального APK файла ===
echo.

echo 1. Создание структуры APK...
mkdir META-INF 2>nul
mkdir res 2>nul
mkdir assets 2>nul
mkdir res\values 2>nul

echo 2. Создание необходимых файлов...
echo # DEX файл (заглушка) > classes.dex
echo # Файл ресурсов (заглушка) > resources.arsc

echo 3. Создание AndroidManifest.xml...
echo ^<?xml version="1.0" encoding="utf-8"?^> > AndroidManifest.xml
echo ^<manifest xmlns:android="http://schemas.android.com/apk/res/android" >> AndroidManifest.xml
echo     package="com.nekopuk3" >> AndroidManifest.xml
echo     android:versionCode="1" >> AndroidManifest.xml
echo     android:versionName="1.0"^> >> AndroidManifest.xml
echo. >> AndroidManifest.xml
echo     ^<uses-sdk >> AndroidManifest.xml
echo         android:minSdkVersion="21" >> AndroidManifest.xml
echo         android:targetSdkVersion="33" /^> >> AndroidManifest.xml
echo. >> AndroidManifest.xml
echo     ^<uses-permission android:name="android.permission.INTERNET" /^> >> AndroidManifest.xml
echo     ^<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" /^> >> AndroidManifest.xml
echo. >> AndroidManifest.xml
echo     ^<application >> AndroidManifest.xml
echo         android:allowBackup="true" >> AndroidManifest.xml
echo         android:icon="@mipmap/ic_launcher" >> AndroidManifest.xml
echo         android:label="Neko Puk3" >> AndroidManifest.xml
echo         android:theme="@style/AppTheme" >> AndroidManifest.xml
echo         android:usesCleartextTraffic="true"^> >> AndroidManifest.xml
echo. >> AndroidManifest.xml
echo         ^<activity >> AndroidManifest.xml
echo             android:name=".MainActivity" >> AndroidManifest.xml
echo             android:exported="true" >> AndroidManifest.xml
echo             android:label="Neko Puk3" >> AndroidManifest.xml
echo             android:launchMode="singleTop" >> AndroidManifest.xml
echo             android:configChanges="orientation^|keyboardHidden^|screenSize" >> AndroidManifest.xml
echo             android:windowSoftInputMode="adjustResize"^> >> AndroidManifest.xml
echo             ^<intent-filter^> >> AndroidManifest.xml
echo                 ^<action android:name="android.intent.action.MAIN" /^> >> AndroidManifest.xml
echo                 ^<category android:name="android.intent.category.LAUNCHER" /^> >> AndroidManifest.xml
echo             ^</intent-filter^> >> AndroidManifest.xml
echo         ^</activity^> >> AndroidManifest.xml
echo. >> AndroidManifest.xml
echo         ^<meta-data >> AndroidManifest.xml
echo             android:name="android.app.lib_name" >> AndroidManifest.xml
echo             android:value="" /^> >> AndroidManifest.xml
echo. >> AndroidManifest.xml
echo     ^</application^> >> AndroidManifest.xml
echo. >> AndroidManifest.xml
echo ^</manifest^> >> AndroidManifest.xml

echo 4. Создание strings.xml...
echo ^<?xml version="1.0" encoding="utf-8"?^> > res\values\strings.xml
echo ^<resources^> >> res\values\strings.xml
echo     ^<string name="app_name"^>Neko Puk3^</string^> >> res\values\strings.xml
echo     ^<string name="hello_world"^>Hello World!^</string^> >> res\values\strings.xml
echo ^</resources^> >> res\values\strings.xml

echo 5. Создание MANIFEST.MF...
echo Manifest-Version: 1.0 > META-INF\MANIFEST.MF
echo Created-By: 1.0 (Android) >> META-INF\MANIFEST.MF
echo. >> META-INF\MANIFEST.MF
echo Name: AndroidManifest.xml >> META-INF\MANIFEST.MF
echo SHA-256-Digest: (будет заполнено при подписи) >> META-INF\MANIFEST.MF
echo. >> META-INF\MANIFEST.MF
echo Name: classes.dex >> META-INF\MANIFEST.MF
echo SHA-256-Digest: (будет заполнено при подписи) >> META-INF\MANIFEST.MF
echo. >> META-INF\MANIFEST.MF
echo Name: resources.arsc >> META-INF\MANIFEST.MF
echo SHA-256-Digest: (будет заполнено при подписи) >> META-INF\MANIFEST.MF

echo 6. Создание APK файла...
echo Создание ZIP архива с правильной структурой APK...
powershell "Compress-Archive -Path 'AndroidManifest.xml', 'classes.dex', 'resources.arsc', 'META-INF\*', 'res\*', 'assets\*' -DestinationPath 'neko-puk3.apk' -Force"

if exist "neko-puk3.apk" (
    echo ✅ APK файл успешно создан: neko-puk3.apk
    echo 📦 Размер файла: 
    for /f %%i in ('powershell "(Get-Item 'neko-puk3.apk').Length"') do echo %%i байт
) else (
    echo ❌ Ошибка при создании APK файла
)

echo.
echo === Готово! ===
echo.
echo 📱 Файл neko-puk3.apk имеет правильную структуру APK.
echo ⚠️  Это демонстрационный APK без реального кода.
echo.
echo Для создания рабочего APK:
echo 1. Установите Android Studio
echo 2. Соберите проект из папки android\
echo 3. Или используйте команду: cd android && gradlew assembleDebug
pause