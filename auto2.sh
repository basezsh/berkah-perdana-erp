#!/data/data/com.termux/files/usr/bin/bash

set -e

mkdir -p app

cat > settings.gradle <<'EOF'
rootProject.name = "BerkahERP"
include ':app'
EOF

cat > build.gradle <<'EOF'
buildscript {
repositories {
google()
mavenCentral()
}

dependencies {
    classpath 'com.android.tools.build:gradle:8.4.2'
}

}

allprojects {
repositories {
google()
mavenCentral()
}
}
EOF

cat > app/build.gradle <<'EOF'
apply plugin: 'com.android.application'

android {
namespace "com.berkah.erp"
compileSdkVersion 34

defaultConfig {
    applicationId "com.berkah.erp"
    minSdkVersion 24
    targetSdkVersion 34
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
implementation 'androidx.appcompat:appcompat:1.7.0'
}
EOF

git add .
git commit --allow-empty -m "auto2 $(date +%s)"
git push

echo "DONE"
