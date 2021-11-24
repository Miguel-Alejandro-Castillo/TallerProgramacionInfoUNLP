programa ejercicio1b
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
  area3: AreaP(2,1,2,1)
robots
  robot competidor
  variables
    cantFlores: numero
  comenzar
    recorrerArea(cantFlores)
    EnviarMensaje(cantFlores, robot3)
  fin

  robot fiscalizador
  variables
    cantFlores1: numero
    cantFlores2: numero
  comenzar
    RecibirMensaje(cantFlores1, *)
    RecibirMensaje(cantFlores2, *)
    si cantFlores1 > cantFlores2
      Informar(cantFlores1 - cantFlores2)
    sino
      Informar(cantFlores2 - cantFlores1)
  fin  
variables
  robot1: competidor
  robot2: competidor
  robot3: fiscalizador
comenzar
  AsignarArea(robot1, area1)
  AsignarArea(robot2, area2)
  AsignarArea(robot3, area3)
  Iniciar(robot1, 1, 1)
  Iniciar(robot2, 2, 11)
  Iniciar(robot3, 2, 1)
fin
  