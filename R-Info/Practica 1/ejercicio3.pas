programa ejercicio3
procesos
  proceso contarFloresEsquina(ES cantFloresEsquina: numero)
  comenzar
    cantFloresEsquina:=0
    mientras HayFlorEnLaEsquina
      tomarFlor
      cantFloresEsquina:=cantFloresEsquina + 1
    repetir cantFloresEsquina
      depositarFlor
  fin
  proceso contarPapelesEsquina(ES cantPapelesEsquina: numero)
  comenzar
    cantPapelesEsquina:=0
    mientras HayPapelEnLaEsquina
      tomarPapel
      cantPapelesEsquina:=cantPapelesEsquina + 1
    repetir cantPapelesEsquina
      depositarPapel
  fin
  proceso contarFloresPapeles(ES cantPapelesEscalon: numero; ES cantFloresEscalon: numero)
  variables
    cantFloresEsquina: numero
    cantPapelesEsquina: numero
  comenzar
    contarFloresEsquina(cantFloresEsquina)
    cantFloresEscalon:=cantFloresEscalon + cantFloresEsquina
    contarPapelesEsquina(cantPapelesEsquina)
    cantPapelesEscalon:=cantPapelesEscalon + cantPapelesEsquina 
  fin

  proceso hacerEscalon(E tamanio: numero; ES cantPapelesEscalon: numero; ES cantFloresEscalon: numero)
  comenzar
    cantPapelesEscalon:= 0
    cantFloresEscalon:= 0
    repetir tamanio
      contarFloresPapeles(cantPapelesEscalon, cantFloresEscalon)
      mover
    derecha
    repetir tamanio
      contarFloresPapeles(cantPapelesEscalon, cantFloresEscalon)
      mover
    contarFloresPapeles(cantPapelesEscalon, cantFloresEscalon)
    repetir 3
      derecha
  fin
  proceso hacerEscalera(E cantEscalones: numero)
  variables
    tamanioEscalon: numero
    cantPapelesEscalon: numero
    cantFloresEscalon: numero
    cantEscalonesMasPapeles:  numero
  comenzar
    cantEscalonesMasPapeles:= 0
    tamanioEscalon:= 1
    repetir cantEscalones
      hacerEscalon(tamanioEscalon, cantPapelesEscalon,cantFloresEscalon)
      tamanioEscalon:=tamanioEscalon + 1
      si cantPapelesEscalon > cantFloresEscalon
        cantEscalonesMasPapeles:= cantEscalonesMasPapeles +1
    Informar(cantEscalonesMasPapeles)
        
  fin
areas
  area: AreaPC(1, 1, 100, 100)
robots
  robot tipo1
  comenzar
    hacerEscalera(4)
  fin

variables
  robot1: tipo1
  robot2: tipo1
  robot3: tipo1
comenzar
  AsignarArea(robot1, area)
  AsignarArea(robot2, area)
  AsignarArea(robot3, area)
  Iniciar(robot1, 12, 14)
  Iniciar(robot2, 17, 10)
  Iniciar(robot3, 22, 6)
fin