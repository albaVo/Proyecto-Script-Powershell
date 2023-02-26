function menu {
  cls
  write-host ""
  write-host "========== Menu =========="
  write-host ""
  write-host "1. Gestion del software"
  write-host "2. Gestion de los procesos"
  write-host "3. Gestion de los servicios"
  write-host "4. Registros de eventos"
  write-host ""
  write-host ". Salir"
  write-host ""
}

do {
  menu
  $opcion = read-host "Introduce una opcion del menu"
  switch ($opcion) {
    1 {
      cls
      ./software.ps1
    }
    2 {
      cls
      ./procesos.ps1
    }
    3 {
      cls
      ./servicios.ps1
    }
    4 {
      cls
      ./eventos.ps1
    }
  }
  pause
}
until ($opcion -eq '')