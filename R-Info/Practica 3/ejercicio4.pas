programa ejercicio4
procesos

  proceso posInicial(ES av: numero; ES ca: numero)
  comenzar
    av:= PosAv
    ca:= PosCa
  fin

  proceso tomarFlores
  comenzar
    mientras HayFlorEnLaEsquina
      tomarFlor
  fin

areas
  areaRecolectores: AreaPC(9,9,9,12)
  areaCoordinador: AreaP(1,1,1,1)
  areaTrabajo10: AreaP(10,10,10,10)
  areaTrabajo11: AreaP(11,11,11,11)
robots
  robot recolector
  variables
    id: numero
    avInicial: numero
    caInicial: numero
  comenzar
    posInicial(avInicial, caInicial)
    RecibirMensaje(id, robot5)
    
    BloquearEsquina(10, 10)
    Pos(10, 10)
    mientras HayFlorEnLaEsquina
      tomarFlor
      BloquearEsquina(11, 11)
      Pos(11, 11)
      LiberarEsquina(10, 10)
      depositarFlor
      Pos(avInicial, caInicial)
      LiberarEsquina(11,11)
      BloquearEsquina(10,10)
      Pos(10,10)
    Pos(avInicial, caInicial)
    LiberarEsquina(10, 10)
    
    EnviarMensaje(id, robot5)
  fin
  robot coordinador
  variables
    id: numero
  comenzar
    EnviarMensaje(1, robot1)
    EnviarMensaje(2, robot2)
    EnviarMensaje(3, robot3)
    EnviarMensaje(4, robot4)

    repetir 4
      RecibirMensaje(id, *)

    Informar(id)
    Pos(11,11)
    tomarFlores
    Pos(1,1)
  fin
variables
  robot1: recolector
  robot2: recolector
  robot3: recolector
  robot4: recolector
  robot5: coordinador
comenzar
  AsignarArea(robot1, areaTrabajo10)
  AsignarArea(robot2, areaTrabajo10)
  AsignarArea(robot3, areaTrabajo10)
  AsignarArea(robot4, areaTrabajo10)

  AsignarArea(robot1, areaTrabajo11)
  AsignarArea(robot2, areaTrabajo11)
  AsignarArea(robot3, areaTrabajo11)
  AsignarArea(robot4, areaTrabajo11)
  AsignarArea(robot5, areaTrabajo11)
  
  AsignarArea(robot1, areaRecolectores)
  AsignarArea(robot2, areaRecolectores)
  AsignarArea(robot3, areaRecolectores)
  AsignarArea(robot4, areaRecolectores)
  AsignarArea(robot5, areaCoordinador)

  Iniciar(robot1, 9, 9)
  Iniciar(robot2, 9, 10)
  Iniciar(robot3, 9, 11)
  Iniciar(robot4, 9, 12)
  Iniciar(robot5, 1, 1)
fin