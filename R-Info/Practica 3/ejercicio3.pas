programa ejercicio3
procesos
  proceso posInicial(ES av: numero; ES ca: numero)
  comenzar
    av:= PosAv
    ca:= PosCa
  fin
  proceso maximoFlores(E cantFlores: numero; E id: numero; ES maxFlores: numero; ES maxId: numero)
  comenzar
    si cantFlores > maxFlores
      maxFlores:= cantFlores
      maxId:= id
  fin

areas
  cuadrante: AreaPC(2,2,10,10)
  areaRobots: AreaPC(1,1,5,1)
robots
  robot recolector
  variables
    id: numero
    av: numero
    ca: numero
    avInicial: numero
    caInicial: numero
    cantFlores: numero
  comenzar
    cantFlores:= 0
    posInicial(avInicial, caInicial)
    RecibirMensaje(id, robot5)
    RecibirMensaje(av, robot5)
    RecibirMensaje(ca, robot5)
    
    BloquearEsquina(av, ca)
    Pos(av, ca)
    mientras HayFlorEnLaEsquina
      tomarFlor
      Pos(avInicial, caInicial)
      LiberarEsquina(av, ca)
      { incrementar en uno el contador local del robot, deberia ser segura esta suma }
      cantFlores:= cantFlores + 1
      BloquearEsquina(av, ca)
      Pos(av, ca)
    Pos(avInicial, caInicial)
    LiberarEsquina(av, ca)
    
    EnviarMensaje(id, robot5)
    EnviarMensaje(cantFlores, robot5)
    
  fin
  robot jefe
  variables
    av: numero
    ca: numero
    id: numero
    cantFlores: numero
    maxId: numero
    maxFlores: numero
  comenzar
    Random(av,2,10)
    Random(ca,2,10)
    EnviarMensaje(1, robot1)
    EnviarMensaje(av, robot1)
    EnviarMensaje(ca, robot1)
    EnviarMensaje(2, robot2)
    EnviarMensaje(av, robot2)
    EnviarMensaje(ca, robot2)
    EnviarMensaje(3, robot3)
    EnviarMensaje(av, robot3)
    EnviarMensaje(ca, robot3)
    EnviarMensaje(4, robot4)
    EnviarMensaje(av, robot4)
    EnviarMensaje(ca, robot4)
    
    maxFlores:= -1
    repetir 4
      RecibirMensaje(id, *)
      RecibirMensaje(cantFlores, *)
      maximoFlores(cantFlores, id, maxFlores, maxId)
    Informar(maxId)
    Informar(maxFlores)
  fin
variables
  robot1: recolector
  robot2: recolector
  robot3: recolector
  robot4: recolector
  robot5: jefe
comenzar
  AsignarArea(robot1, cuadrante)
  AsignarArea(robot2, cuadrante)
  AsignarArea(robot3, cuadrante)
  AsignarArea(robot4, cuadrante)
  AsignarArea(robot1, areaRobots)
  AsignarArea(robot2, areaRobots)
  AsignarArea(robot3, areaRobots)
  AsignarArea(robot4, areaRobots)
  AsignarArea(robot5, areaRobots)
  Iniciar(robot1, 2, 1)
  Iniciar(robot2, 3, 1)
  Iniciar(robot3, 4, 1)
  Iniciar(robot4, 5, 1)
  Iniciar(robot5, 1, 1)
fin