/*  Splash Screen - Android

tela que aparece antes do app estar rodando

- clicar na pasta 'android' com o botão direito
- clicar em 'Open in Android Studio'

- estrutura 'Android'

- pasta 'app/res/drawable'
- colocar imagem da splash-screen aqui


definir cores(do tema) em um único local
- pasta 'app/res/values'
- botão direito
- 'New'
- 'Values resource file'
- file name: 'colors.xml'
- 'OK'
- código:
--------------------
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="orange">#ff5500</color>
    <color name="white">#ffffff</color>
    <color name="black">#000000</color>
    <color name="purple">#673AB7</color>
    <color name="green">#4CAF50</color>
</resources>
--------------------


tela escura com logo
- pasta 'app/res/drawable'
- botão direito
- 'New'
- 'Drawable Resource File'
- file name: 'splash_bg.xml'
- 'OK'
- código:
--------------------
<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@color/black"/>
    <item>
        <bitmap
            android:gravity="center"
            android:src="@drawable/omni" />
    </item>
</layer-list>
--------------------


definir um novo tema para a splash-screen
- pasta 'app/res/values/styles/styles.xml'
- acrescentar ao código:
--------------------
<style name="SplashScreen" parent="@android:style/Theme.Light.NoTitleBar">
    <item name="android:src">@drawable/splash_bg</item>
    <item name="android:gravity">center</item>
    <item name="android:windowBackground">@color/black</item>
    <item name="android:windowDisablePreview">true</item>
</style>
--------------------
windowDisablePreview - não mostrar a tela de preview (frame depois da splash-screen)


mandar usar o tema que acabamos de criar
- pasta 'app/manisfest/AndroidManifest.xml'
- código:
--------------------
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application
        android:label="EBAC - Movies"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/SplashScreen"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
--------------------
android:label - nome do aplicativo
android:theme="@style/SplashScreen" - tema que vai ser usado


configurar ícone do app
- pasta 'app/res/'
- botão direito
- 'New'
- 'Image Asset'
- colocar o caminho em 'Path:'  
- configurar 'Resize'
- 'Next'
- 'Finish'






















*/