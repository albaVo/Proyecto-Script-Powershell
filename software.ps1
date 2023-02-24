function menu {
  cls
  write-host ""
  write-host "========== Menu Software =========="
  write-host ""
  write-host "1. Listar programas instalados"
  write-host "2. Antivirus instalado"
  write-host "3. Numero de programas instalados"
  write-host "4. Buscar paquetes instalados"
  write-host "5. Instalar software"
  write-host "6. Desinstalar software"
  write-host "7. Listar actualizaciones"
  write-host "8. Examinar el equipo en busca de virus"
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
      "======================"
      " PROGRAMAS INSTALADOS "
      "======================"
      ""
      Get-Package
      ""
    }
    2 {
      cls
      ""
      "============================="
      " INDICAR ANTIVIRUS INSTALADO "
      "============================="
      ""
      ((Get-Package).name) | Select-String 'Defender'
      ""
    }
    3 {
      cls
      ""
      "================================"
      " NUMERO DE PROGRAMAS INSTALADOS "
      "================================"
      ""
      $numero = ((Get-Package).name).count
      "Hay $numero programas instalados"
      ""
    }
    4 {
      cls
      ""
      "================================="
      " BUSQUEDA DE PAQUETES INSTALADOS "
      "================================="
      ""
      $paquete = read-host "Introduce el paquete que deseas ver si esta instalado"
      ""
      Find-Package $paquete
      ""
    }
    5 {
      cls
      ""
      "======================"
      " INSTALACION SOFTWARE "
      "======================"
      ""
      $paquete = read-host "Introduce el paquete que deseas instalar"
      ""
      Install-Package $paquete
      ""
      "----- Paquete instalado con exito -----"
      ""
    }
    5 {
      cls
      ""
      "======================"
      " INSTALACION SOFTWARE "
      "======================"
      ""
      $paquete = read-host "Introduce el paquete que deseas instalar"
      ""
      Install-Package $paquete
      ""
      "----- Paquete instalado con exito -----"
      ""
    }
    6 {
      cls
      ""
      "========================="
      " DESINSTALACION SOFTWARE "
      "========================="
      ""
      $paquete = read-host "Introduce el paquete que deseas desinstalar"
      ""
      Uninstall-Package $paquete
      ""
      "----- Paquete desinstalado con exito -----"
      ""
    }
    7 {
      cls
      ""
      "================="
      " ACTUALIZACIONES "
      "================="
      ""
      Get-HotFix
      ""
    }
    8 {
      cls
      ""
      "==================="
      " BUSQUEDA DE VIRUS "
      "==================="
      ""
      Start-MpScan
      ""
    }
  }
  pause
}
until ($opcion -eq '9')