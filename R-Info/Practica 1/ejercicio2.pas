programa ejercicio2
procesos
  proceso girar(E cantidad: numero)
  comenzar
    repetir cantidad
      derecha
  fin
  proceso proximoPos(E sentido: numero; ES av: numero; ES ca: numero)
  comenzar
    av:=PosAv
    ca:=PosCa
    si sentido = 0
      ca:=ca + 1
    sino 
      si sentido = 1
        av:=av + 1
      sino 
        si sentido = 2
          ca:=ca - 1
        sino 
          si sentido = 3
            av:=av - 1
  fin
  proceso tomarPapelesEsquina(ES cantPapelesRecolectados: numero)
  comenzar
    mientras HayPapelEnLaEsquina
      tomarPapel
      cantPapelesRecolectados:=cantPapelesRecolectados + 1
  fin
  proceso recorrerLado(E sentido: numero; E lado: numero; ES cantPapelesRecolectadas: numero)
  variables
    av: numero
    ca: numero
  comenzar
    girar(sentido)
    cantPapelesRecolectadas:= 0
  
    { INICIO proceso la primer esquina del lado }
    av:= PosAv
    ca:= PosCa
    BloquearEsquina(av, ca)
    tomarPapelesEsquina(cantPapelesRecolectadas)
    mover
    LiberarEsquina(av, ca)
    { FIN proceso la primer esquina del lado }
    
    repetir lado - 3
      tomarPapelesEsquina(cantPapelesRecolectadas)
      mover
    tomarPapelesEsquina(cantPapelesRecolectadas)
    
    { INICIO proceso la ultima esquina del lado }
    proximoPos(sentido, av, ca)
    BloquearEsquina(av, ca)
    mover
    tomarPapelesEsquina(cantPapelesRecolectadas)
    LiberarEsquina(av, ca)
    { FIN proceso la ultima esquina del lado }
  fin
areas
  area: AreaPC(10, 10, 29, 29)
robots
  robot tipo1
  variables
    cantPapelesRecolectadas: numero
  comenzar
    recorrerLado(0, 20, cantPapelesRecolectadas)
    Informar(cantPapelesRecolectadas)
  fin
  robot tipo2
  variables
    cantPapelesRecolectadas: numero
  comenzar
    recorrerLado(1, 20, cantPapelesRecolectadas)
    Informar(cantPapelesRecolectadas)

  fin
  robot tipo3
  variables
    cantPapelesRecolectadas: numero
  comenzar
    recorrerLado(2,20,cantPapelesRecolectadas)
    Informar(cantPapelesRecolectadas)
  fin
  robot tipo4
  variables
    cantPapelesRecolectadas: numero
  comenzar
    recorrerLado(3, 20, cantPapelesRecolectadas)
    Informar(cantPapelesRecolectadas)
  fin


variables
  robot1: tipo1
  robot2: tipo2
  robot3: tipo3
  robot4: tipo4
comenzar
  AsignarArea(robot1, area)
  AsignarArea(robot2, area)
  AsignarArea(robot3, area)
  AsignarArea(robot4, area)
  Iniciar(robot1, 10, 10)
  Iniciar(robot2, 10, 29)
  Iniciar(robot3, 29, 29)
  Iniciar(robot4, 29, 10)
  
  
fin