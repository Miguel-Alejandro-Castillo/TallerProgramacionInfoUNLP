programa ejercicio1b
procesos
  proceso recorrerAvenida
  variables
    cantFloresRecolectadas: numero
    cantEsquinasSinFlor: numero
  comenzar
    cantFloresRecolectadas:=0
    cantEsquinasSinFlor:=0
    repetir 99
      si HayFlorEnLaEsquina
        mientras HayFlorEnLaEsquina
          cantFloresRecolectadas:=cantFloresRecolectadas+1
          tomarFlor
      sino
        cantEsquinasSinFlor:=cantEsquinasSinFlor+1
      mover
    si HayFlorEnLaEsquina
      mientras HayFlorEnLaEsquina
        cantFloresRecolectadas:=cantFloresRecolectadas+1
        tomarFlor
    sino
      cantEsquinasSinFlor:=cantEsquinasSinFlor+1

    repetir cantFloresRecolectadas
      depositarFlor
    Informar(cantFloresRecolectadas)
    Informar(cantEsquinasSinFlor)
  fin
areas
  ciudad: AreaC(1,1,100,100)
robots
  robot tipo1
  comenzar
    recorrerAvenida
  fin
variables
  robot1:tipo1
  robot2:tipo1
  robot3:tipo1
comenzar
  AsignarArea(robot1, ciudad)
  AsignarArea(robot2, ciudad)
  AsignarArea(robot3, ciudad)
  Iniciar(robot1, 1, 1)
  Iniciar(robot2, 3, 1)
  Iniciar(robot3, 5, 1)
fin
