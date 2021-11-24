programa ejercicio1
procesos
  proceso tomarFloresEsquina(ES cantFlores: numero)
  comenzar
    mientras HayFlorEnLaEsquina
      cantFlores:=cantFlores+1
      tomarFlor
  fin
  proceso recorrerArea(ES cantFlores: numero)
  comenzar
    cantFlores:= 0
    repetir 9
      tomarFloresEsquina(cantFlores)
      mover
    tomarFloresEsquina(cantFlores)
  fin
areas
  area1: AreaP(1,1,1,10)
  area2: AreaP(2,11,2,20)
robots
  robot tipo1
  variables
    cantFlores: numero
    cantFloresR2: numero
    diferenciaFlores: numero
  comenzar
    recorrerArea(cantFlores)
    EnviarMensaje(cantFlores, robot2)
    RecibirMensaje(cantFloresR2, robot2)
    si cantFlores > cantFloresR2
      Informar(cantFlores - cantFloresR2)

  fin
  robot tipo2
  variables
    cantFlores: numero
    cantFloresR1: numero
    diferenciaFlores: numero
  comenzar
    recorrerArea(cantFlores)
    EnviarMensaje(cantFlores, robot1)
    RecibirMensaje(cantFloresR1, robot1)
    si cantFlores > cantFloresR1
      Informar(cantFlores - cantFloresR1)
  fin
variables
  robot1: tipo1
  robot2: tipo2
comenzar
  AsignarArea(robot1, area1)
  AsignarArea(robot2, area2)
  Iniciar(robot1, 1, 1)
  Iniciar(robot2, 2, 11)
fin
  