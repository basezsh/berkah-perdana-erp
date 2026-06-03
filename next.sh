#!/data/data/com.termux/files/usr/bin/bash

set -e

mkdir -p .github/workflows

cat > settings.gradle <<'EOF'
rootProject.name = "BerkahERP"
include ':app'
EOF

cat > build.gradle <<'EOF'
plugins {
    id 'com.android.application' version '8.7.3' apply false
}
EOF

cat > gradle.properties <<'EOF'
org.gradle.jvmargs=-Xmx2048m
android.useAndroidX=true
android.nonTransitiveRClass=true
EOF

cat > app/build.gradle <<'EOF'
plugins {
    id 'com.android.application'
}

android {
    namespace 'com.berkah.erp'
    compileSdk 35

    defaultConfig {
        applicationId "com.berkah.erp"
        minSdk 24
        targetSdk 35
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            minifyEnabled false
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
}

dependencies {
    implementation 'androidx.appcompat:appcompat:1.7.1'
}
EOF

cat > .github/workflows/android.yml <<'EOF'
name: Android Build

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: 17

      - uses: android-actions/setup-android@v3

      - name: Gradle Wrapper
        run: |
          gradle wrapper

      - name: Build APK
        run: |
          ./gradlew assembleDebug

      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: app-debug
          path: app/build/outputs/apk/debug/*.apk
EOF

echo
echo "DONE"
find . -type f | sort
