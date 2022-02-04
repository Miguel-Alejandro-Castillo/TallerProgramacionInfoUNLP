program parcial;

type
    tipo_vacuna = 1..4;
    r_notificacion = record
        fecha: string;
        pais: string;
        vacuna: tipo_vacuna;
        cant_dosis: integer;
    end;
    l_notificaciones = ^nodo;
    nodo = record
        dato: r_notificacion;
        siguiente: l_notificaciones;
    end;
    v_notificaciones = array[tipo_vacuna] of l_notificaciones;
    
    ABB = ^nodo_arbol;
    dato_nodo_arbol = record
        cant_total_dosis: integer;
        pais: string;
    end;
    nodo_arbol = record
        dato: dato_nodo_arbol;
        hi: ABB;
        hd: ABB;
    end;
    

procedure minimo_notificaciones(var notificaciones: v_notificaciones; var paisMin: string, var cant_dosis: integer);
var 
    iMin, i: integer;
    
begin
    paisMin:= 'ZZZZZZZZ';
    for i:= 1 to 4 do begin
        if(notificaciones[i] <> nil) then begin
            if(notificaciones[i]^.dato.pais <= paisMin) then begin
                paisMin:= notificaciones[i]^.dato.pais;
                iMin = i;
            end;
        end;
    end;
    if paisMin <> 'ZZZZZZZZ' then begin
        cant_dosis := notificaciones[iMin]^.dato.cant_dosis;
        minimo_notificaciones[iMin] =  notificaciones[iMin]^.siguiente;
    end;
    
end;
procedure merge_acumulador(notificaciones: v_notificaciones; var arbol: ABB);
var
   paisMin: string;
   cant_total_dosis: integer;
   paisAct: string;
   cant_dosis: integer;
   dato_arbol: dato_nodo_arbol;
begin
    arbol:= nil;
    minimo_notificaciones(notificaciones, paisMin, cant_dosis);
    while (paisMin <> 'ZZZZZZZZ') do begin
        cant_total_dosis:= 0;
        paisAct:= paisMin;
        while (paisMin <> 'ZZZZZZZZ') and (paisAct = paisMin) do begin
            cant_total_dosis := cant_total_dosis + cant_dosis;
            minimo_notificaciones(notificaciones, paisMin, cant_dosis);
        end;
        dato_arbol.cant_total_dosis = cant_total_dosis;
        dato_arbol.pais = paisAct;
        insertar_ordenado(arbol, dato_arbol);
    end;
    

end;
var
 notificaciones: v_notificaciones;
 arbol: ABB;
begin
  //cargar_notificaciones(notificaciones); SE DISPONE, ESTAN AGRUPADAS POR TIPO DE VACUNA
  merge_acumulador(notificaciones, arbol);
  
end.

