programa ejercicio1c
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
  area1: AreaP(1, 1,1,10)
  area2: AreaP(2,11,2,20)
  area3: AreaP(3,21,3,30)
  area4: AreaP(4,31,4,40)
  area5: AreaP(5,41,5,50)
  area6: AreaP(6,51,6,60)
  area7: AreaP(2,1,2,1)
robots
  robot competidor
  variables
    cantFlores: numero
  comenzar
    recorrerArea(cantFlores)
    EnviarMensaje(cantFlores, robot7)
  fin

  robot fiscalizador
  variables
    cantFlores: numero
    maxFlores: numero
  comenzar
    maxFlores:= -1
    {Recibe 6 cantidades de flores, una por cada robot competidor}
    repetir 6
      RecibirMensaje(cantFlores, *)
      si cantFlores > maxFlores
        maxFlores:= cantFlores
    Informar(maxFlores)
  fin  
variables
  robot1: competidor
  robot2: competidor
  robot3: competidor
  robot4: competidor
  robot5: competidor
  robot6: competidor
  robot7: fiscalizador
comenzar
  AsignarArea(robot1, area1)
  AsignarArea(robot2, area2)
  AsignarArea(robot3, area3)
  AsignarArea(robot4, area4)
  AsignarArea(robot5, area5)
  AsignarArea(robot6, area6)
  AsignarArea(robot7, area7)
  Iniciar(robot1, 1, 1)
  Iniciar(robot2, 2, 11)
  Iniciar(robot3, 3, 21)  
  Iniciar(robot4, 4, 31)
  Iniciar(robot5, 5, 41)
  Iniciar(robot6, 6, 51)
  Iniciar(robot7, 2, 1)
fin
  