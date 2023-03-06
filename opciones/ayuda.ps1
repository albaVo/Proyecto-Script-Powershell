function menu {
  cls
  write-host ""
  write-host "========== Menu Ayuda =========="
  write-host ""
  write-host "1. Mostrar la version instalada de PowerShell"
  write-host "2. Listar todos los cmdlets disponibles"
  write-host "3. Listar los cmdlets que contengan una palaba en concreto"
  write-host "4. Actualizar ayuda"
  write-host "5. Obtener la ayuda de un cmdlet con ejemplos de uso"
  write-host ""
  write-host "6. Obtener el historial de cmdlets"
  write-host "7. Recuperar un cmdlet del historial"
  write-host "8. Limpiar historial"
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
        "===================="
        " VERSION POWERSHELL "
        "===================="
        ""
        host | ft -Property Name, Version
    }
    2 {
        cls
        ""
        "====================="
        " CMDLETS DISPONIBLES "
        "====================="
        ""
        Get-Command
    }
    3 {
        cls
        ""
        "====================="
        " CMDLETS ESPECIFICOS "
        "====================="
        ""
        $pal = read-host "Introduce la palabra"
        Get-Command *$pal*
    }
    4 {
        cls
        ""
        "=================="
        " ACTUALIZAR AYUDA "
        "=================="
        ""
        Update-Help
        ""
        "------ Ayuda actualizada con exito ------"
    }
    5 {
        cls
        ""
        "===================="
        " AYUDA DE UN CMDLET "
        "===================="
        ""
        $cmd = read-host "Introduce el cmdlet del cual deseas obtener la ayuda"
        Get-Help $cmd -examples
    }
    6 {
        cls
        ""
        "==================="
        " HISTORIAL CMDLETS "
        "==================="
        ""
        Get-History
    }
    7 {
        cls
        ""
        "=================="
        " RECUPERAR CMDLET "
        "=================="
        ""
        $n = read-host "Introduce el numero del historial para recuperar el cmdlet"
        Invoke-History $n
    }
    8 {
        cls
        ""
        "==================="
        " LIMPIAR HISTORIAL "
        "==================="
        ""
        Clear-History
        ""
        "------ Historial limpiado con exito ------"
    }
  }
  pause
}
until ($opcion -eq '9')