programa ejercicio4
procesos
  proceso procesarEsquina(E recogerFlores: boolean; E recogerPapeles: boolean)
  comenzar
    si recogerFlores
      mientras HayFlorEnLaEsquina
        tomarFlor
    si recogerPapeles
      mientras HayPapelEnLaEsquina
        tomarPapel
  fin
  proceso recorrerAvenida(E recogerFlores: boolean; E recogerPapeles: boolean)
  comenzar
    repetir 99
      procesarEsquina(recogerFlores, recogerPapeles)
      mover
    procesarEsquina(recogerFlores, recogerPapeles)
  fin
  proceso recorrerArea(E cantAvenidas: numero; E recogerFlores: boolean; E recogerPapeles: boolean)
  variables
    avUltima: numero
  comenzar
    avUltima:= PosAv + cantAvenidas - 1
    repetir cantAvenidas
      recorrerAvenida(recogerFlores, recogerPapeles)
      si PosAv + 1 <= avUltima
        Pos(PosAv + 1, 1)
  fin
areas
  area1: AreaP(1,1,25,100)
  area2: AreaP(26,1,50,100)
  area3: AreaP(51,1, 75,100)
  area4: AreaP(76,1,100,100)
robots
  robot robotPar
  comenzar
    Pos(26,1)
    recorrerArea(25, F, V)
    Pos(76,1)
    recorrerArea(25, F, V)
  fin
  robot robotImpar
  comenzar
    {Pos(1,1)}
    recorrerArea(25, V, F)
    Pos(51,1)
    recorrerArea(25, V, F)
  fin
variables
  robot1: robotImpar
  robot2: robotPar
comenzar
  AsignarArea(robot1, area1)
  AsignarArea(robot1, area3)
  AsignarArea(robot2, area2)
  AsignarArea(robot2, area4)
  Iniciar(robot1, 1, 1)
  Iniciar(robot2, 26, 1)
fin
