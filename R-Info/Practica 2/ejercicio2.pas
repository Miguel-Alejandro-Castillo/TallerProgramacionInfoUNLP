programa ejercicio2
procesos
  proceso contarFloresPapelesEsquina(ES cantFlores: numero; ES cantPapeles: numero)
  comenzar
    mientras HayFlorEnLaEsquina
      tomarFlor
      cantFlores:= cantFlores + 1
    mientras HayPapelEnLaEsquina
      tomarPapel
      cantPapeles:= cantPapeles + 1
  fin
  
  proceso hacerEscalon(E alto: numero; E ancho: numero; ES cantFlores: numero; ES cantPapeles: numero)
  comenzar
    cantFlores:= 0
    cantPapeles:= 0
    repetir alto
      contarFloresPapelesEsquina(cantFlores, cantPapeles)
      mover
    derecha
    repetir ancho
      contarFloresPapelesEsquina(cantFlores, cantPapeles)
      mover
    contarFloresPapelesEsquina(cantFlores, cantPapeles)
    repetir 3
      derecha
  fin

  proceso hacerEscalera(ES cantEscalonesFlores: numero)
  variables
    cantFlores: numero
    cantPapeles: numero
    alto: numero
    ancho: numero
  comenzar
    cantEscalonesFlores:= 0
    ancho:= 1
    repetir 4
      Random(alto, 1, 5)
      hacerEscalon(alto, ancho, cantFlores, cantPapeles)
      si cantFlores > cantPapeles
        cantEscalonesFlores:= cantEscalonesFlores + 1
  fin

areas
  area1: AreaPC(1, 1,100,100)
robots
  robot robotEscalera
  variables
    cantEscalonesFlores: numero
  comenzar
    hacerEscalera(cantEscalonesFlores)
    EnviarMensaje(cantEscalonesFlores, robot4)
  fin

  robot jefe
  variables
    cantEscalonesFlores: numero
    totEscalonesFlores: numero
  comenzar
    totEscalonesFlores:= 0
    repetir 3
      RecibirMensaje(cantEscalonesFlores, *)
      totEscalonesFlores:= totEscalonesFlores + cantEscalonesFlores
    Informar(totEscalonesFlores)
  fin

variables
  robot1: robotEscalera
  robot2: robotEscalera
  robot3: robotEscalera
  robot4: jefe

comenzar
  AsignarArea(robot1, area1)
  AsignarArea(robot2, area1)
  AsignarArea(robot3, area1)
  AsignarArea(robot4, area1)
  Iniciar(robot1, 2, 1)
  Iniciar(robot2, 7, 1)
  Iniciar(robot3, 12, 1)  
  Iniciar(robot4, 1, 1)

fin
  