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
        ""
        "=================="
        " INICIAR SERVICIO "
        "=================="
        ""
        $servicio = read-host "Indica el servicio para iniciarlo"
        Start-Service $servicio
        ""
        "------ Servicio iniciado con exito ------"
    }
    2 {
        cls
        ""
        "=================="
        " DETENER SERVICIO "
        "=================="
        ""
        $servicio = read-host "Indica el servicio para detenerlo"
        Stop-Service $servicio -Force -Confirm
        ""
        "------ Servicio detenido con exito ------"
    }
    3 {
        cls
        ""
        "==================="
        " OBTENER SERVICIOS "
        "==================="
        ""
        Get-Service
    }
    4 {
        cls
        ""
        "================================"
        " OBTENER SERVICIOS EN EJECUCION "
        "================================"
        ""
        Get-Service | Where-Object {$_.Status -eq "Running"}
    }
    5 {
        cls
        ""
        "=================="
        " OBTENER SERVICIO "
        "=================="
        ""
        $servicio = read-host "Indica el servicio para obtener informacion"
        Get-Service $servicio
    }
  }
  pause
}
until ($opcion -eq '6')