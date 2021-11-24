programa ejercicio1
procesos

  proceso recolectarFlores
  comenzar
    mientras HayFlorEnLaEsquina
      tomarFlor
  fin

  proceso recolectarPapeles
  comenzar
    mientras HayPapelEnLaEsquina
      tomarPapel
  fin
  
  proceso depositarFlores
  comenzar
    mientras HayFlorEnLaBolsa
      depositarFlor
  fin

  proceso depositarPapeles
  comenzar
    mientras HayPapelEnLaBolsa
      depositarPapel
  fin
  
  proceso posInicial(ES av: numero; ES ca: numero)
  comenzar
    av:= PosAv
    ca:= PosCa
  fin

areas
  areaFloreros: AreaPC(1,1,5,10)
  areaPapeleros: AreaPC(6,1,10,9)
  areaRobots: AreaPC(6,10,10,10)
robots
  robot florero
  variables
    av: numero
    ca: numero
    avInicial: numero
    caInicial:numero
  comenzar
    {limpia la bolsa}
    depositarFlores
    posInicial(avInicial, caInicial)
    repetir 5
      Random(av, 1, 5)
      Random(ca,1, 10)
      BloquearEsquina(av, ca)
      Pos(av,ca)
      recolectarFlores
      Pos(avInicial, caInicial)
      LiberarEsquina(av, ca)
    BloquearEsquina(10, 10)
    Pos(10,10)
    depositarFlores
    Pos(avInicial, caInicial)
    LiberarEsquina(10, 10)
  fin
  robot papelero
  variables
    av: numero
    ca: numero
    avInicial: numero
    caInicial:numero
  comenzar
    {limpia la bolsa}
    depositarPapeles
    posInicial(avInicial, caInicial)
    repetir 3
      Random(av, 6, 10)
      Random(ca,1, 9)
      BloquearEsquina(av, ca)
      Pos(av,ca)
      recolectarPapeles
      Pos(avInicial, caInicial)
      LiberarEsquina(av, ca)
    BloquearEsquina(10, 10)
    Pos(10,10)
    depositarPapeles
    Pos(avInicial, caInicial)
    LiberarEsquina(10, 10)
  fin
variables
  florero1: florero
  florero2: florero
  papelero1: papelero
  papelero2: papelero
comenzar
  AsignarArea(florero1, areaFloreros)
  AsignarArea(florero2, areaFloreros)
  AsignarArea(papelero1, areaPapeleros)
  AsignarArea(papelero2, areaPapeleros)
  AsignarArea(florero1, areaRobots)
  AsignarArea(florero2, areaRobots)
  AsignarArea(papelero1, areaRobots)
  AsignarArea(papelero2, areaRobots)
  Iniciar(florero1, 6, 10)
  Iniciar(florero2, 7, 10)
  Iniciar(papelero1, 8, 10)
  Iniciar(papelero2, 9, 10)
fin