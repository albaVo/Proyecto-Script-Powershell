function menu {
  cls
  write-host ""
  write-host "========== Menu Registros Eventos =========="
  write-host ""
  write-host "1. Informacion sobre los eventos"
  write-host "2. Las 5 entradas mas recientes del registro"
  write-host "3. Eventos con una palabra especifica en la descripcion"
  write-host "4. Todos los eventos de Windows Powershell"
  write-host ""
  write-host "5. Salir"
  write-host ""
}

do {
  menu
  $opcion = read-host "Introduce una opcion del menu"
  switch ($opcion) {
    1 {
        cls
        Get-EventLog -List
    }
    2 {
        cls
        Get-EventLog -LogName Application -Newest 5
    }
    3 {
        cls
        $palabra = read-host "Introduce la palabra"
        Get-EventLog -LogName System -Message "*$palabra*"
    }
    4 {
        cls
        Get-EventLog -LogName "Windows PowerShell"
    }
  }
  pause
}
until ($opcion -eq '5')