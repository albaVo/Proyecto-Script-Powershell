function menu {
  cls
  write-host ""
  write-host "========== Menu Gestion Software =========="
  write-host ""
  write-host "1. Programas instalados"
  write-host "2. Instalar software"
  write-host "3. Desinstalar software"
  write-host "4. Listar actualizaciones"
  write-host "5. Examinar el equipo en busca de virus"
  write-host " "
  write-host "6. Salir"
  write-host ""
}

do {
  menu
  $opcion = read-host "Introduce una opcion del menu"
  switch ($opcion) {
    1 {
      cls
      do {
        ""
        "======================"
        " PROGRAMAS INSTALADOS "
        "======================"
        ""
        "Sobre que deseas ver informacion"
        "
          1. Listar programas instalados
          2. Numero de programas instalados
          3. Buscar paquetes instalados

          4. Salir
        "
        $opcion = read-host "Selecciona una opcion"
        if ($opcion -eq 1){
          Get-Package | ft
        }
        elseif ($opcion -eq 2){
          $numero = ((Get-Package).name).count
          ""
          "Hay $numero programas instalados"
        }
        elseif ($opcion -eq 3){
          $paquete = read-host "Introduce el paquete que deseas ver si esta instalado"
          ""
          Find-Package $paquete
        }
        elseif ($opcion -eq 4){
          break
        }
        else {
          ""
          "Elige una opcion valida"
          ""
        }
      }
      until ($opcion -eq 4) 
    }
    2 {
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
    3 {
      cls
      ""
      "========================="
      " DESINSTALACION SOFTWARE "
      "========================="
      ""
      $paquete = read-host "Introduce el paquete que deseas desinstalar"
      ""
      Uninstall-Package $paquete -Force
      ""
      "----- Paquete desinstalado con exito -----"
      ""
    }
    4 {
      cls
      do {
        ""
        "================="
        " ACTUALIZACIONES "
        "================="
        ""
        "Indica que deseas listar"
        "
          1. Todas las actualizaciones
          2. Actualizaciones de seguridad
          3. Actualizacion mas reciente

          4. Salir
        "
        $opcion = read-host "Selecciona una opcion"
        if ($opcion -eq 1){
          ""
          Get-Hotfix
        }
        elseif ($opcion -eq 2){
          ""
          Get-Hotfix -Description "Security*"
        }
        elseif ($opcion -eq 3){
          ""
          (Get-HotFix | Sort-Object -Property InstalledOn)[-1]
        }
        elseif ($opcion -eq 4){
          break
        }
        else {
          ""
          "Elige una opcion valida"
          ""
        }
      }
      until ($opcion -eq 4)
    }
    5 {
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
until ($opcion -eq '6')