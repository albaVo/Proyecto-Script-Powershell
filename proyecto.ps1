function menu {
  cls
  write-host ""
  write-host "========== Menu =========="
  write-host ""
  write-host "1. Gestion del software"
  write-host "2. Gestion de los procesos"
  write-host "3. Gestion de los servicios"
  write-host "4. Gestion de alias"
  write-host "5. Registros de eventos"
  write-host "6. Información sobre el software y el hardware del sistema"
  write-host "7. Gestion de las cuentas de usuario"
  write-host "8. Gestion de los grupos"
  write-host "9. Gestion de los archivos y carpetas"
  write-host ". Ayuda"
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
      ./opciones/software.ps1
    }
    2 {
      cls
      ./opciones/procesos.ps1
    }
    3 {
      cls
      ./opciones/servicios.ps1
    }
    4 {
      cls
      ./opciones/alias.ps1
    }
    5 {
      cls
      ./opciones/eventos.ps1
    }
    6 {
      cls
      ./opciones/info.ps1
    }
    7 {
      cls
      ./opciones/usuarios.ps1
    }
    8 {
      cls
      ./opciones/grupos.ps1
    }
    9 {
      cls
      ./opciones/ac.ps1
    }
  }
  pause
}
until ($opcion -eq '')