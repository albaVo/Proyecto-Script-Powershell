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
  write-host "6. Salir"
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
        host
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
  }
  pause
}
until ($opcion -eq '6')