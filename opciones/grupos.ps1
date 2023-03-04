function menu {
  cls
  write-host ""
  write-host "========== Menu Grupos =========="
  write-host ""
  write-host "1. Ver todos los grupos"
  write-host "2. Buscar un grupo"
  write-host ""
  write-host "3. Crear un grupo"
  write-host "4. Eliminar un grupo"
  write-host ""
  write-host "5. Añadir un usuario a un grupo"
  write-host "6. Eliminar un usuario de un grupo"
  write-host "7. Ver los miembros de un grupo"
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
        "========"
        " GRUPOS "
        "========"
        ""
        Get-LocalGroup
    }
    2 {
        cls
        ""
        "========"
        " GRUPOS "
        "========"
        ""
        $grupo = read-host "Indica el grupo que deseas buscar"
        #Get-LocalGroup $grupo
    }
    3 {
        cls
        ""
        "================"
        " CREACION GRUPO "
        "================"
        ""
        $grupo = read-host "Introduce un nombre para el grupo"
        New-LocalGroup $grupo
        ""
        "------ Grupo creado con exito ------"
    }
    4 {
        cls
        ""
        "==================="
        " ELIMINACION GRUPO "
        "==================="
        ""
        $grupo = read-host "Indica el grupo que deseas eliminar"
        Remove-LocalGroup $grupo
        ""
        "------ Grupo eliminado con exito ------"  
    }
    5 {
        cls 
        ""
        "==========================="
        " AÑADIR USUARIO A UN GRUPO "
        "==========================="
        ""
        $usu = read-host "Indica el usuario que deseas añadir a un grupo"
        $gru = read-host "Indica el grupo"
        Add-LocalGroupMember -Member $usu -Group $gru 
        Get-LocalGroupMember $gru
        ""
        "------ Usuario añadido al grupo con exito ------"
    }
    6 {
        cls 
        ""
        "=============================="
        " ELIMINAR USUARIO DE UN GRUPO "
        "=============================="
        ""
        $usu = read-host "Indica el usuario que deseas eliminar de un grupo"
        $gru = read-host "Indica el grupo"
        Remove-LocalGroupMember -Member $usu -Group $gru 
        ""
        "------ Usuario eliminado del grupo con exito ------"
    }
    7 {
        cls 
        ""
        "======================"
        " MIEMBROS DE UN GRUPO "
        "======================"
        ""
        $gru = read-host "Indica el grupo"
        Get-LocalGroupMember $gru
    }
  }
  pause
}
until ($opcion -eq '8')