program ejercicio1;

const
    CANT_OFICINAS = 300;
    
type
    dimlog_vector = 0..CANT_OFICINAS;
    
    registro_oficina = record
        codigo_identificacion: integer;
        dni_propietario: integer;
        valor_expensa: real;
    end;
    vector_oficinas = array [1..CANT_OFICINAS] of registro_oficina;
    
procedure leer_oficina(var oficina: registro_oficina);
begin
    writeln('Ingrese codigo de identificacion: ');
    read(oficina.codigo_identificacion);
    if(oficina.codigo_identificacion <> -1) then begin
        writeln('Ingrese dni del propietario: ');
        read(oficina.dni_propietario);
        writeln('Ingrese valor de la expensa');
        read(oficina.valor_expensa);
    end;
end;

procedure leer_oficinas(var oficinas: vector_oficinas; var dimlog: dimlog_vector);
var 
 oficina: registro_oficina;
begin
    dimlog:= 0;
    leer_oficina(oficina);
    while (oficina.codigo_identificacion <> -1) and (dimlog < CANT_OFICINAS) do begin
        dimlog := dimlog + 1;
        oficinas[dimlog] := oficina;
        leer_oficina(oficina);
    end;
end;

procedure ordenamiento_insercion(var oficinas: vector_oficinas; dimlog: dimlog_vector);
var 
    i, j, p: integer; 
    oficina: registro_oficina;	
begin
    for i:=2 to dimlog do begin 
        oficina:= oficinas[i];
        j := i-1; 
        while (j > 0) and (oficinas[j].codigo_identificacion < oficina.codigo_identificacion) do begin
            oficinas[j+1] := oficinas[j];
            j := j - 1;
        end;  
        oficinas[j+1]:= oficina; 
    end;
end;

procedure ordenamiento_seleccion ( var oficinas: vector_oficinas; dimlog: dimlog_vector );
var 
    i, j, p: integer; 
    oficina: registro_oficina;	
begin
    for i := 1 to dimlog-1 do begin {busca el mínimo y guarda en p la posición}
        p := i;
        for j := i+1 to dimlog do
            if (oficinas[j].codigo_identificacion < oficinas[p].codigo_identificacion) then 
                p:=j;
        {intercambia oficinas[i] y oficinas[p]}
        oficina := oficinas[p];   
        oficinas[p] := oficinas[i];   
        oficinas[i] := oficina;
    end;
end;

var
    oficinas: vector_oficinas;
    dimlog: dimlog_vector;
begin
    leer_oficinas(oficinas, dimlog); {cargar vector de oficinas}
    ordenamiento_seleccion(oficinas, dimlog); {ordenamiento por método de selección }
    ordenamiento_insercion(oficinas, dimlog); {ordenamiento por método de insercion }
    
    writeln('Presione una tecla cualquiera para finalizar');
    readln;
    readln;
end.