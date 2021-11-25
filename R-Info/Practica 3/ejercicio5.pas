programa ejercicio5
procesos

  proceso maximoCa(E ca: numero; E id: numero; ES maxCa: numero; ES maxId: numero)
  comenzar
    si ca > maxCa
      maxCa:= ca
      maxId:= id
  fin

areas
  areaAv4: AreaP(4,1,4,100)
  areaAv6: AreaP(6,1,6,100)
  areaAv8: AreaP(8,1,8,100)
  areaAv10: AreaP(10,1,10,100)
  areaFuente: AreaPC(11,11,11,11)
  areaCoordinador: AreaP(1,1,1,1)
robots
  robot recolector
  variables
    id: numero
    avInicial: numero
    caActual: numero
    fuenteVacia: boolean
  comenzar
    avInicial:= PosAv
    RecibirMensaje(id, robot5)
    fuenteVacia:= F
    caActual:= PosCa
    mientras caActual <= 100 & ~fuenteVacia 
      
      BloquearEsquina(11,11)
      Pos(11,11)
      si HayPapelEnLaEsquina
        tomarPapel
        Pos(avInicial, caActual)
        LiberarEsquina(11,11)
        depositarPapel
        caActual:= PosCa + 1
      sino
        Pos(avInicial, caActual)
        LiberarEsquina(11,11)
        fuenteVacia:= V
      
    caActual:= PosCa
    EnviarMensaje(id, robot5)
    EnviarMensaje(caActual, robot5)

  fin
  robot coordinador
  variables
    id: numero
    ca: numero
    maxCa: numero
    maxId: numero
  comenzar
    EnviarMensaje(1, robot1)
    EnviarMensaje(2, robot2)
    EnviarMensaje(3, robot3)
    EnviarMensaje(4, robot4)

    maxCa:= -1
    repetir 4
      RecibirMensaje(id, *)
      RecibirMensaje(ca, *)
      maximoCa(ca, id, maxCa, maxId)
    Informar(maxId)
    Informar(maxCa)
  fin
variables
  robot1: recolector
  robot2: recolector
  robot3: recolector
  robot4: recolector
  robot5: coordinador
comenzar
  AsignarArea(robot1, areaFuente)
  AsignarArea(robot2, areaFuente)
  AsignarArea(robot3, areaFuente)
  AsignarArea(robot4, areaFuente)

  AsignarArea(robot1, areaAv4)
  AsignarArea(robot2, areaAv6)
  AsignarArea(robot3, areaAv8)
  AsignarArea(robot4, areaAv10)
  
  AsignarArea(robot5, areaCoordinador)
  

  Iniciar(robot1, 4, 1)
  Iniciar(robot2, 6, 1)
  Iniciar(robot3, 8, 1)
  Iniciar(robot4, 10, 1)
  Iniciar(robot5, 1, 1)
fin
