function menu {
  cls
  write-host ""
  write-host "========== Menu Alias =========="
  write-host ""
  write-host "1. Listar los alias del sistema"
  write-host "2. Buscar un alias"
  write-host "3. Crear un alias"
  write-host "4. Eliminar un alias"
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
        "=============="
        " LISTAR ALIAS "
        "=============="
        ""
        Get-Alias
    }
    2 {
        cls
        ""
        "=============="
        " BUSCAR ALIAS "
        "=============="
        ""
        $alias = read-host "Indica el alias que deseas buscar"
        Get-Alias $alias
    }
    3 {
        cls
        ""
        "============="
        " CREAR ALIAS "
        "============="
        ""
        $cmd = read-host "Indica a que cmdlet deseas asignarle un alias"
        $alias = read-host "Introduce un alias"
        New-Alias -Name $alias $cmd
        ""
        "------ Alias creado con exito ------"
    }
    4 {
        cls
        ""
        "================"
        " ELIMINAR ALIAS "
        "================"
        ""
        $alias = read-host "Introduce el alias que deseas eliminar"
        Remove-Item Alias:$alias
        ""
        "------ Alias eliminado con exito ------"
    }
  }
  pause
}
until ($opcion -eq '5')