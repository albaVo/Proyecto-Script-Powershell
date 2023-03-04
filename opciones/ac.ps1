function menu {
  cls
  write-host ""
  write-host "========== Menu Archivos y Carpetas =========="
  write-host ""
  write-host "1. Ver el directorio actual"
  write-host "2. Ver todo el contenido de una carpeta"
  write-host ""
  write-host "3. Copiar archivos"
  write-host "4. Copiar carpetas"
  write-host ""
  write-host "5. Crear un archivo"
  write-host "6. Crear una carpeta"
  write-host ""
  write-host "7. Eliminar un archivo"
  write-host "8. Eliminar una carpeta"
  write-host ""
  write-host "9. Salir"
  write-host ""
}

do {
  menu
  $opcion = read-host "Introduce una opcion del menu"
  switch ($opcion) {
    1 {
        cls
        ""
        "==================="
        " DIRECTORIO ACTUAL "
        "==================="
        ""
        Get-Location
    }
    2 {
        cls
        ""
        "======================"
        " VISUALIZAR CONTENIDO "
        "======================"
        ""
        $ruta = read-host "Indica la ruta de la carpeta"
        Get-ChildItem -Path $ruta -Force
    }
    3 {
        cls
        ""
        "================"
        " COPIA ARCHIVOS "
        "================"
        ""
        $op = read-host "¿Deseas copiar el archivo en la misma ruta donde esta? si / no"
        ""
        if ($op -Match "si"){
            $archivo = read-host "Indica el archivo que deseas copiar"
            $ruta = read-host "Indica la ruta donde esta el archivo"
            ""
            $archivo2 = read-host "Introduce un nombre para el nuevo archivo que se creara"
            Copy-Item -Path $ruta\$archivo -Destination $ruta\$archivo2
            ""
            "----- Archivo copiado con exito -----"
        }
        elseif ($op -Match "no"){
            $archivo = read-host "Indica el archivo que deseas copiar"
            $ruta = read-host "Indica la ruta donde esta el archivo"
            "" 
            $archivo2 = read-host "Introduce un nombre para el nuevo archivo que se creara"
            $ruta2 = read-host "Indica la ruta donde deseas copiar el archivo"
            Copy-Item -Path $ruta\$archivo -Destination $ruta2\$archivo2
            ""
            "----- Archivo copiado con exito -----"
        }
        else {
            ""
            "Elige una opcion valida"
            ""
        }    
    }
    4 {
        cls
        ""
        "================"
        " COPIA CARPETAS "
        "================"
        ""
        $op = read-host "¿Deseas copiar la carpeta en la misma ruta donde esta? si / no"
        ""
        if ($op -Match "si"){
            $carpeta = read-host "Indica la carpeta que deseas copiar"
            $ruta = read-host "Indica la ruta donde esta la carpeta"
            ""
            $carpeta2 = read-host "Introduce un nombre para la nueva carpeta que se creara"
            Copy-Item $ruta\$carpeta -Recurse $ruta\$carpeta2
            ""
            "----- Carpeta copiada con exito -----"
        }
        elseif ($op -Match "no"){
            $carpeta = read-host "Indica la carpeta que deseas copiar"
            $ruta = read-host "Indica la ruta donde esta la carpeta"
            "" 
            $carpeta2 = read-host "Introduce un nombre para la nueva carpeta que se creara"
            $ruta2 = read-host "Indica la ruta donde deseas copiar la carpeta"
            Copy-Item $ruta\$carpeta -Recurse $ruta2\$carpeta2
            ""
            "----- Carpeta copiada con exito -----"
        }
        else {
            ""
            "Elige una opcion valida"
            ""
        }    
    }
    5 {
        cls
        ""
        "=================="
        " CREACION ARCHIVO "
        "=================="
        ""
        $archivo = read-host "Introduce un nombre para el archivo"
        $ruta = read-host "Indica la ruta donde seas crear el archivo"
        New-Item -Path $ruta\$archivo.txt -ItemType File
        ""
        "----- Archivo creado con exito -----"
    }
    6 {
        cls
        ""
        "=================="
        " CREACION CARPETA "
        "=================="
        ""
        $carpeta = read-host "Introduce un nombre para la carpeta"
        $ruta = read-host "Indica la ruta donde seas crear la carpeta"
        New-Item -Path $ruta\$carpeta -ItemType Directory
        ""
        "----- Carpeta creada con exito -----"
    }
    7 {
        cls
        ""
        "====================="
        " ELIMINACION ARCHIVO "
        "====================="
        ""
        $archivo = read-host "Indica el nombre del archivo que deseas eliminar"
        $ruta = read-host "Indica la ruta donde esta el archivo"
        Remove-Item -Path $ruta\$archivo.txt
        ""
        "----- Archivo eliminado con exito -----"
    }
    8 {
        cls
        ""
        "====================="
        " ELIMINACION CARPETA "
        "====================="
        ""
        $carpeta = read-host "Indica el nombre de la carpeta que deseas eliminar"
        $ruta = read-host "Indica la ruta donde esta la carpeta"
        Remove-Item -Path $ruta\$carpeta
        ""
        "----- Carpeta eliminada con exito -----"
    }
  }
  pause
}
until ($opcion -eq '9')