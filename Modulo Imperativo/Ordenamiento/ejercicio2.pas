program ejercicio2;

const 
    CANT_GENEROS = 8;
type
    subrango_genero = 1..CANT_GENEROS;
    registro_pelicula = record
        codigo: integer;
        genero: subrango_genero;
        puntaje_promedio: real;
    end;
    lista_peliculas = ^nodo;
    nodo = record
        pelicula: registro_pelicula;
        siguiente: lista_peliculas;
    end;
    registro_max_genero = record
        codigo: integer;
        puntaje_promedio: real;
    end;
    vector_genero = array[subrango_genero] of registro_max_genero;

procedure leer_pelicula(var pelicula: registro_pelicula);
begin
    Writeln('Ingrese los siguientes datos de la pelicula');
    writeln('codigo: ');
    read(pelicula.codigo);
    if(pelicula.codigo <> -1) then begin
        writeln('genero: ');
        read(pelicula.genero);
        writeln('puntaje promedio: ');
        read(pelicula.puntaje_promedio);
    end;
end;

procedure agregar_final(var peliculas: lista_peliculas; pelicula: registro_pelicula);
var
    act,nue: lista_peliculas;
begin
    new(nue);
    nue^.pelicula := pelicula;
    nue^.siguiente := nil;
    if (peliculas <> nil) then begin
        act := peliculas;
        while (act^.siguiente<>NIL) do 
            act := act^.siguiente;
        act^.siguiente := nue;
    end
    else
        peliculas := nue;
end;

procedure leer_peliculas(var peliculas: lista_peliculas);
var
    pelicula: registro_pelicula;
begin
    { precondicion: leer las peliculas agrupadas por codigo de genero }
    peliculas := nil;
    leer_pelicula(pelicula);
    while (pelicula.codigo <> -1) do begin
        agregar_final(peliculas, pelicula); {almacene por orden de llegada y agrupados por código de género}
        leer_pelicula(pelicula);
    end;
end;

procedure inicializar_vector_genero(var generos: vector_genero);
var 
    i: integer;
begin 
    for i:= 1 to CANT_GENEROS do begin
        generos[i].puntaje_promedio := -1;
    end;
end;

procedure generar_vector_generos(var generos: vector_genero; peliculas: lista_peliculas);
var
    genero_actual: subrango_genero;
begin
    inicializar_vector_genero(generos);
    while (peliculas <> nil) do begin
        genero_actual := peliculas^.pelicula.genero;
        {Proceso las peliculas de cada genero} 
        while (peliculas <> nil) and (genero_actual = peliculas^.pelicula.genero) do begin
            if (peliculas^.pelicula.puntaje_promedio > generos[genero_actual].puntaje_promedio) then begin
                generos[genero_actual].puntaje_promedio := peliculas^.pelicula.puntaje_promedio;
                generos[genero_actual].codigo := peliculas^.pelicula.codigo;
            end;
            peliculas := peliculas^.siguiente;
        end;
    end;
end;

procedure ordenar_seleccion(var generos: vector_genero);
var 
    i, j, p: integer; 
    item : registro_max_genero;	
begin
 for i:=1 to CANT_GENEROS-1 do begin {busca el mínimo y guarda en p la posición}
          p := i;
          for j := i+1 to CANT_GENEROS do
             if (generos[j].puntaje_promedio < generos[p].puntaje_promedio) then 
                p:=j;
         {intercambia generos[i] y generos[p]}
         item := generos[p];   
         generos[p] := generos[i];   
         generos[i] := item;
      end;
end;

procedure informar(generos: vector_genero);
var
    i: integer;
    cod_min, cod_max: integer;
    puntaje_min, puntaje_max: real;
begin
    writeln('El código de película con mayor puntaje es: ', generos[CANT_GENEROS].codigo); 
    writeln('El código de película con menor puntaje es: ', generos[1].codigo); 
end;

var 
    peliculas: lista_peliculas;
    generos: vector_genero;
begin
    leer_peliculas(peliculas);
    generar_vector_generos(generos, peliculas);
    ordenar_seleccion(generos);
    informar(generos);
    
    writeln('Presione una tecla cualquiera para finalizar');
    readln;
    readln;
end.