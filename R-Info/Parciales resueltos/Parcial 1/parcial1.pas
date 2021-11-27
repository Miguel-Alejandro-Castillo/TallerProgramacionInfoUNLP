programa parcial
procesos
  proceso posInicial(ES av: numero; ES ca: numero)
  comenzar
    av:= PosAv
    ca:= PosCa
  fin
  proceso puedenSeguir(E id1: numero; E id2: numero)
  variables
    puedeSeguir: numero
  comenzar
    si ((id1 = 1) | (id2 = 1))
      puedeSeguir:= 0
    sino
      puedeSeguir:= 1
    EnviarMensaje(puedeSeguir, robot1)
    si ((id1 = 2) | (id2 = 2))
      puedeSeguir:= 0
    sino
      puedeSeguir:= 1
    EnviarMensaje(puedeSeguir, robot2)
    si ((id1 = 3) | (id2 = 3))
      puedeSeguir:= 0
    sino
      puedeSeguir:= 1
    EnviarMensaje(puedeSeguir, robot3)


  fin
  proceso maximos(E id: numero; E cantObjetos: numero; ES maxId1: numero;  ES maxId2: numero; ES maxCantObjetos1: numero; ES maxCantObjetos2: numero)
  comenzar
    si cantObjetos > maxCantObjetos1
      maxCantObjetos2:= maxCantObjetos1
      maxId2:= maxId1
      maxCantObjetos1:= cantObjetos
      maxId1:= id
    sino
      si cantObjetos > maxCantObjetos2
        maxCantObjetos2:= cantObjetos
        maxId2:= id
  fin
  
  proceso tomarFlores(ES cantFlores: numero)
  comenzar
    mientras HayFlorEnLaEsquina
      tomarFlor
      cantFlores:= cantFlores + 1
  fin
  
  proceso tomarPapeles(ES cantPapeles: numero)
  comenzar
    mientras HayPapelEnLaEsquina
      tomarPapel
      cantPapeles:= cantPapeles + 1
  fin
  
  proceso bloquearPuntosChoques(E avSig: numero; E caSig: numero)
  comenzar
    si (((avSig = 5) | (avSig = 8) | (avSig = 10)  | (avSig = 13) | (avSig = 15) | (avSig = 18))  & (caSig = 3))
      BloquearEsquina(avSig, caSig)
  fin
  
  proceso liberarPuntosChoques(E avAnt: numero; E caAnt: numero)
  comenzar
    si (((avAnt = 5) | (avAnt = 8) | (avAnt = 10)  | (avAnt = 13) | (avAnt = 15) | (avAnt = 18))  & (caAnt = 3))
      LiberarEsquina(avAnt, caAnt)
  fin

  
  proceso hacerRectangulo(E base: numero; E altura: numero; ES cantFlores: numero; ES cantPapeles: numero)
  variables
    i: numero
    ca: numero
  comenzar
    cantFlores:= 0
    cantPapeles:= 0
    i:= 0
    repetir 2
      i:= i + 1
      repetir altura
        tomarFlores(cantFlores)
        tomarPapeles(cantPapeles)
        si i = 1
          ca:= PosCa + 1
        sino
          ca:= PosCa - 1
        bloquearPuntosChoques(PosAv, ca)
        mover
        si i = 1
          ca:= PosCa - 1
        sino
          ca:= PosCa + 1
        liberarPuntosChoques(PosAv, ca)
      derecha
      repetir base
        tomarFlores(cantFlores)
        tomarPapeles(cantPapeles)
        mover
      derecha
    tomarFlores(cantFlores)
    tomarPapeles(cantPapeles)
      
  fin
  proceso tomaFlorr
  comenzar
    si HayFlorEnLaEsquina
      tomarFlor
  fin

areas
  ciudad: AreaPC(1,1,100,100)
robots
  robot robotRectangulo
  variables
    id: numero
    base: numero
    altura: numero
    cantFlores: numero
    cantPapeles: numero
    puedoSeguir: numero
    avInicial: numero
    caInicial: numero
  comenzar
    RecibirMensaje(id, robot5)
    posInicial(avInicial, caInicial)
    base:= 3
    Random(altura, 5, 60)

    hacerRectangulo(base, altura, cantFlores, cantPapeles)
    EnviarMensaje(id, robot5)
    EnviarMensaje(cantFlores + cantPapeles, robot5)
    RecibirMensaje(puedoSeguir, robot5)
    si puedoSeguir = 0
      repetir cantFlores
        BloquearEsquina(61, 61)
        Pos(61,61)
        depositarFlor
        Pos(avInicial, caInicial)
        LiberarEsquina(61, 61)
  fin
  robot robotCallejero
  comenzar
    derecha
    repetir 99
      tomaFlorr
      bloquearPuntosChoques(PosAv + 1 , PosCa)
      mover
      liberarPuntosChoques(PosAv - 1, PosCa)
    tomaFlorr
  fin
  
  robot robotJefe
  variables
    id: numero
    cantObjetos: numero
    maxId1: numero
    maxId2: numero
    maxCantObjetos1: numero
    maxCantObjetos2: numero
  comenzar
    EnviarMensaje(1, robot1)
    EnviarMensaje(2, robot2)
    EnviarMensaje(3, robot3)
    maxCantObjetos1:= -1
    maxCantObjetos2:= -1
    repetir 3
      RecibirMensaje(id, *)
      RecibirMensaje(cantObjetos, *)
      maximos(id, cantObjetos, maxId1, maxId2, maxCantObjetos1, maxCantObjetos2)
    puedenSeguir(maxId1, maxId2)
  fin
variables
  robot1: robotRectangulo
  robot2: robotRectangulo
  robot3: robotRectangulo
  robot4: robotCallejero
  robot5: robotJefe
comenzar
  AsignarArea(robot1, ciudad)
  AsignarArea(robot2, ciudad)
  AsignarArea(robot3, ciudad)
  AsignarArea(robot4, ciudad)
  AsignarArea(robot5, ciudad)
  Iniciar(robot1, 5,1)
  Iniciar(robot2, 10,1)
  Iniciar(robot3, 15,1)
  Iniciar(robot4, 1,3)
  Iniciar(robot5, 1,1)
  
fin
