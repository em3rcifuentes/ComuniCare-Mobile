// 🔧 Este bloque configura los repositorios y dependencias del buildscript (Firebase y otros plugins)
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.google.gms:google-services:4.4.0") // Plugin de Firebase
    }
}

// Repositorios para todos los proyectos (ya estaba bien)
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Configuración del nuevo directorio de compilación
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

// Aplica configuración a todos los subproyectos
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Tarea personalizada para limpiar la compilación
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
