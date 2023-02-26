function menu {
  cls
  write-host ""
  write-host "========== Menu Gestion Procesos =========="
  write-host ""
  write-host "1. Informacion sobre los procesos"
  write-host ""
  write-host "2. Iniciar un proceso"
  write-host "3. Detener un proceso"
  write-host "4. Obtener todos los procesos"
  write-host "5. Obtener un proceso en concreto"
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
      do {   
        ""
        "======================"
        " INFORMACION PROCESOS "
        "======================"
        ""
        "Indica sobre que deseas ver informacion"
        "
          1. Todos los procesos que se estan ejecutando
          2. Un proceso en concreto en ejecucion

          3. Los procesos que superan un determinado tamaño de memoria
          4. Los 5 procesos con mayor consumo de memoria

          5. Los procesos con mas de x segundos de CPU consumido
          6. Los 5 procesos con mayor consumo de CPU
          
          7. Salir
        "
        $opcion = read-host "Selecciona una opcion"
        if ($opcion -eq 1){
          Get-Process
        }
        elseif ($opcion -eq 2){
          ""
          $proceso = read-host "Indica el proceso que deseas obtener"
          Get-Process $proceso
        }
        elseif ($opcion -eq 3){
          ""
          $tamano = read-host "Indica el tamaño de memoria en MB (se convertira automaticamente a bytes)"
          $n = 1000000
          ""
          function Get-Multi {
            param (
              [int]$tamano,
              [int]$n
            )
            return $tamano * $n
          }   

          $memoria = Get-Multi $tamano $n
          $procesos = Get-Process

          foreach($P in $procesos) {
            if ($P.WS -gt $memoria) {
              write-host $P.ProcessName "("$P.WS" Bytes)"
            }
          } 
        }
        elseif ($opcion -eq 4){
          ""
          Get-Process | Sort-Object -Property WS | Select-Object -Last 5
        }
        elseif ($opcion -eq 5){
          ""
          $seg = read-host "Introduce el tiempo de CPU consumido en segundos"
          ""
          Get-Process | Where-Object {$_.CPU -gt $seg} | Format-Table -Property ProcessName, Id, CPU
        }
        elseif ($opcion -eq 6){
          ""
          Get-Process | Sort-Object -Property CPU | Select-Object -Last 5
        }
        elseif ($opcion -eq 7){
          break
        }
        else {
          ""
          "Elige una opcion valida"
          ""
        }
      }
      until ($opcion -eq 7) 
    }
    2 {
        cls
        ""
        "================="
        " INICIAR PROCESO "
        "================="
        ""
        $proceso = read-host "Indica el proceso para iniciarlo"
        Start-Process -FilePath $proceso
        ""
        "------ Proceso iniciado con exito ------"
    }
    3 {
        cls
        ""
        "================="
        " DETENER PROCESO "
        "================="
        ""
        $proceso = read-host "Indica el proceso para detenerlo"
        Stop-Process -Name $proceso
        ""
        "------ Proceso detenido con exito ------"
    }
    4 {
        cls
        ""
        "=================="
        " OBTENER PROCESOS "
        "=================="
        ""
        Get-Process
    }
    5 {
        cls
        ""
        "================="
        " OBTENER PROCESO "
        "================="
        ""
        $proceso = read-host "Indica el proceso para obtener informacion"
        Get-Process -Name $proceso
    }
  }
  pause
}
until ($opcion -eq '6')