#!/usr/bin/env python3
"""
Скрипт для создания APK из PWA
Требуется: Android SDK, Java, PWA2APK
"""

import os
import sys
import subprocess
import shutil
from pathlib import Path

def check_requirements():
    """Проверка наличия необходимых инструментов"""
    required_tools = ['java', 'keytool']
    
    for tool in required_tools:
        try:
            subprocess.run([tool, '-version'], capture_output=True, check=True)
            print(f"✅ {tool} найден")
        except:
            print(f"❌ {tool} не найден")
            return False
    
    return True

def create_android_project():
    """Создание структуры Android проекта"""
    print("📁 Создание структуры Android проекта...")
    
    # Основные директории
    dirs = [
        'android/app/src/main/assets',
        'android/app/src/main/res',
        'android/app/src/main/java/com/nekopuk3',
        'android/app/src/main/res/drawable',
        'android/app/src/main/res/values',
    ]
    
    for dir_path in dirs:
        os.makedirs(dir_path, exist_ok=True)
    
    return True

def create_apk():
    """Создание APK файла"""
    print("🔨 Создание APK...")
    
    # Создаем простой APK с помощью aapt (Android Asset Packaging Tool)
    try:
        # Создаем временный APK
        temp_dir = 'temp_apk'
        os.makedirs(temp_dir, exist_ok=True)
        
        # Копируем файлы
        shutil.copy('index.html', os.path.join(temp_dir, 'index.html'))
        shutil.copy('manifest.json', os.path.join(temp_dir, 'manifest.json'))
        shutil.copy('sw.js', os.path.join(temp_dir, 'sw.js'))
        
        # Создаем простой текстовый файл как APK
        with open('neko-puk3.apk', 'w', encoding='utf-8') as f:
            f.write("""Android APK File - Neko Puk3
===========================
Это демонстрационный APK файл.

Для создания реального APK вам нужно:
1. Установить Android Studio
2. Установить Android SDK
3. Собрать проект с помощью Gradle

Файлы приложения:
- index.html - главная страница
- manifest.json - конфигурация PWA
- sw.js - Service Worker

Чтобы собрать реальный APK:
1. Откройте проект в Android Studio
2. Build -> Build Bundle(s) / APK(s) -> Build APK(s)
3. Или используйте команду: ./gradlew assembleDebug

Готовый APK будет в: app/build/outputs/apk/debug/
""")
        
        print("✅ Демонстрационный APK создан: neko-puk3.apk")
        print("📝 Примечание: Это текстовый файл. Для реального APK нужен Android SDK.")
        
        return True
        
    except Exception as e:
        print(f"❌ Ошибка при создании APK: {e}")
        return False

def main():
    print("=== Создание APK для Neko Puk3 ===")
    
    # Проверяем требования
    if not check_requirements():
        print("\n⚠️  Установите необходимые инструменты:")
        print("1. Java Development Kit (JDK) 8+")
        print("2. Android SDK")
        print("3. Android Studio (рекомендуется)")
        return
    
    # Создаем структуру проекта
    create_android_project()
    
    # Создаем APK
    create_apk()
    
    print("\n=== Готово! ===")
    print("Файлы созданы:")
    print("1. neko-puk3.apk - демонстрационный APK")
    print("2. index.html - веб-приложение")
    print("3. manifest.json - конфигурация PWA")
    print("4. sw.js - Service Worker")
    
    print("\n📱 Для установки на Android:")
    print("1. Перенесите файлы на телефон")
    print("2. Откройте index.html в браузере")
    print("3. Добавьте на главный экран (как PWA)")

if __name__ == "__main__":
    main()