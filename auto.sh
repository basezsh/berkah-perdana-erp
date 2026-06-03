#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "[AUTO] overwrite build.gradle"

cat > build.gradle <<'EOF'
buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:8.7.3'
    }
}
EOF

echo "[AUTO] overwrite app/build.gradle"

cat > app/build.gradle <<'EOF'
apply plugin: 'com.android.application'

android {
    namespace "com.berkah.erp"
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
}

dependencies {
    implementation 'androidx.appcompat:appcompat:1.7.1'
}
EOF

git add .

git commit --allow-empty -m "auto $(date +%s)"

git push

echo
echo "DONE"
