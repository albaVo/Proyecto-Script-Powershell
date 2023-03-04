function menu {
  cls
  write-host ""
  write-host "========== Menu Usuarios =========="
  write-host ""
  write-host "1. Ver todos los usuarios"
  write-host "2. Ver el usuario actual que ha iniciado sesion"
  write-host "3. Buscar un usuario"
  write-host ""
  write-host "4. Crear un usuario"
  write-host "5. Cambiar la contraseña a un usuario"
  write-host "6. Asignarle una descripcion a un usuario"
  write-host "7. Eliminar usuario"
  write-host ""
  write-host "8. Salir"
  write-host ""
}

do {
  menu
  $opcion = read-host "Introduce una opcion del menu"
  switch ($opcion) {
    1 {
      cls
      ""
      "=========="
      " USUARIOS "
      "=========="
      ""
      Get-LocalUser
    }
    2 {
      cls
      ""
      "================"
      " USUARIO ACTUAL "
      "================"
      ""
      ([System.Security.Principal.WindowsIdentity]::GetCurrent()).name
    }
    3 {
      cls
      ""
      "========="
      " USUARIO "
      "========="
      ""
      $usu = read-host "Indica el usuario que deseas buscar"
      Get-LocalUser $usu
    }
    4 {
      cls
      ""
      "=================="
      " CREACION USUARIO "
      "=================="
      ""
      $nombre = read-host "Introduce un nombre para el usuario"
      $pass = read-host "Introduce una contraseña segura" 
      $contra = ConvertTo-SecureString $pass -asplaintext -force
      New-LocalUser $nombre -Password $contra
      ""
      "------ Usuario creado con exito ------"
    }
    5 {
      cls
      ""
      "==================="
      " CAMBIO CONTRASEÑA "
      "==================="
      ""
      $usu = read-host "Indica el usuario al que deseas cambiarle la contraseña"
      $pass = read-host "Introduce la nueva contraseña segura" 
      $contra = ConvertTo-SecureString $pass -asplaintext -force
      Set-LocalUser -Name $usu -Password $contra
      ""
      "------ Contraseña cambiada con exito ------"
    }
    6 {
      cls
      ""
      "====================="
      " ASIGNAR DESCRIPCION "
      "====================="
      ""
      $usu = read-host "Indica el usuario al que deseas asignarle una descripcion"
      $des = read-host "Introduce una descripcion"
      Set-LocalUser -Name $usu -Description "$des"
      ""
      Get-LocalUser $usu
      ""
      "------ Descripcion asignada con exito ------"
    }
    7 {
      cls
      ""
      "====================="
      " ELIMINACION USUARIO "
      "====================="
      ""
      $usu = read-host "Indica el usuario que deseas eliminar"
      Remove-LocalUser $usu
      ""
      "------ Usuario eliminado con exito ------"
    }
  }
  pause
}
until ($opcion -eq '8')