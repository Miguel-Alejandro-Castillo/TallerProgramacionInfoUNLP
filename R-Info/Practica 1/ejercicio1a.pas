programa ejercicio1a
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
    Pos(1, 1)
    recorrerAvenida
    Pos(3, 1)
    recorrerAvenida
    Pos(5, 1)
    recorrerAvenida
  fin
variables
  robot1:tipo1
comenzar
  AsignarArea(robot1, ciudad)
  Iniciar(robot1, 1, 1)
fin