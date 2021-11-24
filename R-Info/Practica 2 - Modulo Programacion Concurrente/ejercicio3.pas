programa ejercicio3
procesos

  proceso contarFlores(ES cantFlores: numero)
  comenzar
    mientras HayFlorEnLaEsquina
      tomarFlor
      cantFlores:= cantFlores + 1
  fin

  proceso juntarFlores(ES cantFlores: numero)
  comenzar
    cantFlores:= 0
    repetir 9
      contarFlores(cantFlores)
      mover
    contarFlores(cantFlores) 
  fin

  proceso contarPapeles(ES cantPapeles: numero)
  comenzar
    mientras HayPapelEnLaEsquina
      tomarPapel
      cantPapeles:= cantPapeles + 1
  fin

  proceso juntarPapeles(ES cantPapeles: numero)
  comenzar
    cantPapeles:= 0
    repetir 9
      contarPapeles(cantPapeles)
      mover
    contarPapeles(cantPapeles) 
  fin

areas
  area1: AreaPC(1, 1,20,1)
  area2: AreaPC(1, 5,20, 5)
robots
  robot tipoA1
  variables
    cantPapeles: numero
  comenzar
    derecha
    juntarPapeles(cantPapeles)
    EnviarMensaje(cantPapeles, robotA2)
  fin

  robot tipoA2
  variables
    cantPapeles: numero
    cantPapelesAux: numero
  comenzar
    derecha
    RecibirMensaje(cantPapelesAux, robotA1)
    juntarPapeles(cantPapeles)
    Informar(cantPapelesAux + cantPapeles)
  fin
  robot tipoB1
  variables
    cantFlores: numero
  comenzar
    derecha
    juntarFlores(cantFlores)
    EnviarMensaje(cantFlores, robotB2)
  fin

  robot tipoB2
  variables
    cantFlores: numero
    cantFloresAux: numero
  comenzar
    derecha
    RecibirMensaje(cantFloresAux, robotB1)
    juntarFlores(cantFlores)
    Informar(cantFloresAux + cantFlores)
  fin


variables
  robotA1: tipoA1
  robotA2: tipoA2
  robotB1: tipoB1
  robotB2: tipoB2

comenzar
  AsignarArea(robotA1, area1)
  AsignarArea(robotA2, area1)
  AsignarArea(robotB1, area2)
  AsignarArea(robotB2, area2)
  Iniciar(robotA1, 1, 1)
  Iniciar(robotA2, 11, 1)
  Iniciar(robotB1, 1, 5)
  Iniciar(robotB2, 11, 5)
fin
  