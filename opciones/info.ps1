function menu {
  cls
  write-host ""
  write-host "========== Menu Informacion Software y Hardware =========="
  write-host ""
  write-host "1. Informacion de la BIOS"
  write-host "2. Informacion del procesador"
  write-host "3. Informacion del sistema"
  write-host "4. Informacion de la memoria RAM"
  write-host "5. Informacion del espacio en disco disponible"
  write-host "6. Informacion de la sesion de inicio"
  write-host "7. Informacion del estado del servicio"
  write-host "8. Informacion de los adaptadores de red"
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
        "=================="
        " INFORMACION BIOS "
        "=================="
        ""
        Get-CimInstance -ClassName Win32_BIOS
    }
    2 {
        cls
        ""
        "========================"
        " INFORMACION PROCESADOR "
        "========================"
        ""
        Get-CimInstance -ClassName Win32_Processor
    }
    3 {
        cls
        ""
        "====================="
        " INFORMACION SISTEMA "
        "====================="
        ""
        Get-CimInstance -ClassName Win32_ComputerSystem
    }
    4 {
        cls
        ""
        "========================="
        " INFORMACION MEMORIA RAM "
        "========================="
        ""
        Get-WmiObject win32_physicalmemory | Format-Table Manufacturer,MemoryType,BankLabel
    }
    5 {
        cls
        ""
        "============================"
        " INFORMACION ESPACIO DISCOS "
        "============================"
        ""
        Get-CimInstance -ClassName Win32_LogicalDisk
    }
    6 {
        cls
        ""
        "==========================="
        " INFORMACION SESION INICIO "
        "==========================="
        ""
        Get-CimInstance -ClassName Win32_LogonSession
    }
    7 {
        cls
        ""
        "============================="
        " INFORMACION ESTADO SERVICIO "
        "============================="
        ""
        Get-CimInstance -ClassName Win32_Service | Select-Object -Property Status,Name,DisplayName
    }
    8 {
        cls
        ""
        "============================="
        " INFORMACION ADAPTADORES RED "
        "============================="
        ""
        Get-NetAdapter
    }
  }
  pause
}
until ($opcion -eq '9')