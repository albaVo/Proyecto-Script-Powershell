function menu {
  cls
  write-host ""
  write-host "========== Menú =========="
  write-host ""
  write-host "1. Gestión del software"
  write-host "2. "
  write-host "3. "
  write-host "4. Salir"
}

do {
  menu
  $opcion = read-host "Introduce una opción del menú"
  switch ($opcion) {
    1 {
      cls
      ./
    }
    2 {
      cls
      ./
    }
    3 {
      cls
      ./
    }
  }
  pause
}
until ($opcion -eq '4')