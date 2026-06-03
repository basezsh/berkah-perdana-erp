#!/data/data/com.termux/files/usr/bin/bash

set -e

mkdir -p .github/workflows

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

      - name: Build Placeholder
        run: |
          mkdir -p release
          echo "TEST APK" > release/test.apk

      - uses: actions/upload-artifact@v4
        with:
          name: test-apk
          path: release/test.apk
EOF

git add .
git commit --allow-empty -m "codebuild $(date +%s)"
git push

echo
echo "DONE - check GitHub Actions artifact test-apk"
