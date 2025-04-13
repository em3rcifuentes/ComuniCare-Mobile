// Plugins de Gradle necesarios para Android, Kotlin y Flutter
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// Configuración del proyecto Android
android {
    namespace = "com.comunicare.app"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.comunicare.app"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Por ahora usa la firma de depuración (luego puedes cambiar esto)
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

// Ruta al proyecto raíz de Flutter
flutter {
    source = "../.."
}

// 🔽 Esta línea activa Firebase (debe ir al final)
apply(plugin = "com.google.gms.google-services")
