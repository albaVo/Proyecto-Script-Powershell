function menu {
  cls
  write-host ""
  write-host "========== Menu Gestion Servicios =========="
  write-host ""
  write-host "1. Iniciar un servicio"
  write-host "2. Detener un servicio"
  write-host "3. Obtener todos los servicios"
  write-host "4. Obtener todos los servicios en ejecucion"
  write-host "5. Obener un servicio en concreto"
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
        $servicio = read-host "Indica el servicio para iniciarlo"
        Start-Service $servicio
        ""
        "------ Servicio iniciado con exito ------"
    }
    2 {
        cls
        $servicio = read-host "Indica el servicio para detenerlo"
        Stop-Service $servicio
        ""
        "------ Servicio detenido con exito ------"
    }
    3 {
        cls
        Get-Service
    }
    4 {
        cls
        Get-Service | Where-Object {$_.Status -eq "Running"}
    }
    5 {
        cls
        $servicio = read-host "Indica el servicio para obtener informacion"
        Get-Service $servicio
    }
  }
  pause
}
until ($opcion -eq '6')