// Configura la gestión de plugins, incluido Flutter y Google Services
pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    // Incluye Flutter Tools para soporte en proyectos Flutter
    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()            // 🔹 Repositorio necesario para Google Services (Firebase)
        mavenCentral()
        gradlePluginPortal()
    }
}

// Plugins de Gradle requeridos por el proyecto
plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.7.0" apply false
    // START: FlutterFire Configuration
    id("com.google.gms.google-services") version("4.3.15") apply false
    // END: FlutterFire Configuration
    id("org.jetbrains.kotlin.android") version "1.8.22" apply false
}

// Incluye el módulo app
include(":app")
