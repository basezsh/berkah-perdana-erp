#!/data/data/com.termux/files/usr/bin/bash

mkdir -p app/src/main/java/com/berkah/erp
mkdir -p app/src/main/res/values
mkdir -p app/src/main/res/drawable

cat > app/src/main/AndroidManifest.xml << 'EOF'
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>

    <application
        android:label="Berkah Perdana ERP">

        <activity
            android:name=".MainActivity"
            android:exported="true">

            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>

        </activity>
    </application>
</manifest>
EOF

cat > app/src/main/java/com/berkah/erp/MainActivity.java << 'EOF'
package com.berkah.erp;

import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        WebView webView = new WebView(this);
        setContentView(webView);

        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);

        webView.loadUrl("https://server-enterprise.pages.dev");
    }
}
EOF

cat > app/src/main/res/values/strings.xml << 'EOF'
<resources>
    <string name="app_name">Berkah Perdana ERP</string>
</resources>
EOF

cat > app/src/main/res/values/themes.xml << 'EOF'
<resources>
    <style name="Theme.BerkahERP"
        parent="Theme.Material3.DayNight.NoActionBar"/>
</resources>
EOF

cat > app/src/main/res/drawable/ic_berkah.xml << 'EOF'
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp"
    android:height="108dp"
    android:viewportWidth="108"
    android:viewportHeight="108">

    <path
        android:fillColor="#1565C0"
        android:pathData="M54,8A46,46 0 1,1 54,100A46,46 0 1,1 54,8"/>

    <path
        android:fillColor="#FFFFFF"
        android:pathData="M30,30H54A16,16 0 0,1 54,62H30Z"/>

    <path
        android:fillColor="#FFFFFF"
        android:pathData="M30,62H58A14,14 0 0,1 58,90H30Z"/>
</vector>
EOF

echo "Selesai."
find app | sort
