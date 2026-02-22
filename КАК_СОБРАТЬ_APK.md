# Как собрать реальный APK файл

## Требования
1. **Android Studio** - скачайте с [developer.android.com](https://developer.android.com/studio)
2. **Java Development Kit (JDK)** 11+ - скачайте с [oracle.com](https://www.oracle.com/java/technologies/downloads/)
3. **Android SDK** - устанавливается через Android Studio

## Способ 1: Сборка через Android Studio

### Шаг 1: Откройте проект
1. Запустите Android Studio
2. Выберите "Open an existing project"
3. Укажите путь к папке `готовое/android`

### Шаг 2: Соберите APK
1. В меню выберите **Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
2. Дождитесь завершения сборки
3. APK будет создан в: `готовое/android/app/build/outputs/apk/debug/app-debug.apk`

## Способ 2: Сборка через командную строку

### Для Windows:
```cmd
cd готовое\android
gradlew assembleDebug
```

### Для Linux/macOS:
```bash
cd готовое/android
./gradlew assembleDebug
```

## Способ 3: Сборка релизной версии

### 1. Создайте ключ подписи:
```bash
keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

### 2. Соберите подписанный APK:
```bash
cd готовое/android
gradlew assembleRelease
```

## Где найти собранный APK

### Отладочная версия:
```
готовое/android/app/build/outputs/apk/debug/app-debug.apk
```

### Релизная версия:
```
готовое/android/app/build/outputs/apk/release/app-release.apk
```

## Установка APK на устройство

### Способ 1: Через USB
1. Включите "Режим разработчика" на Android
2. Включите "Отладку по USB"
3. Подключите устройство к компьютеру
4. Выполните команду:
```bash
adb install готовое/android/app/build/outputs/apk/debug/app-debug.apk
```

### Способ 2: Через файловый менеджер
1. Скопируйте APK файл на устройство
2. Откройте файловый менеджер
3. Нажмите на APK файл
4. Разрешите установку из неизвестных источников
5. Следуйте инструкциям установки

## Устранение проблем

### Ошибка: "SDK location not found"
Установите переменную окружения `ANDROID_HOME`:
```bash
# Windows
set ANDROID_HOME=C:\Users\[username]\AppData\Local\Android\Sdk

# Linux/macOS
export ANDROID_HOME=~/Android/Sdk
```

### Ошибка: "Java not found"
Установите JDK 11+ и настройте переменную `JAVA_HOME`

### Ошибка сборки Gradle
Удалите кэш Gradle:
```bash
cd готовое/android
gradlew clean
```

## Альтернативный вариант: PWA
Если не получается собрать APK, используйте PWA:
1. Откройте `готовое/index.html` в браузере Chrome
2. Нажмите "Добавить на главный экран"
3. Приложение установится как нативное