function menu {
  cls
  write-host ""
  write-host "========== Menu Firewall =========="
  write-host ""
  write-host "1. Comprobar el estado"
  write-host "2. Habilitar el firewall"
  write-host "3. Deshabilitar el firewall"
  write-host "4. Ver todos los comandos que podemos utilizar para gestionar el firewall"
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
      ""
      "=================="
      " COMPROBAR ESTADO "
      "=================="
      ""
      netsh advfirewall show allprofiles state
    }
    2 {
      cls
      ""
      "=================="
      " ACTIVAR FIREWALL "
      "=================="
      ""
      Set-NetFirewallProfile -Enabled true
      ""
      "----- Firewall activado de todos los perfiles con exito -----"
    }
    3 {
      cls
      ""
      "====================="
      " DESACTIVAR FIREWALL "
      "====================="
      ""
      Set-NetFirewallProfile -Enabled false
      ""
      "----- Firewall desactivado de todos los perfiles con exito -----"
    }
    4 {
      cls
      ""
      "==================="
      " COMANDOS FIREWALL "
      "==================="
      ""
      Get-command *Firewall*
    }
  }
  pause
}
until ($opcion -eq '5')