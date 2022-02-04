program parcial;
const 
    CANT_SUCURSALES = 5;
    CANT_VENTAS = 200;
    CODIGO_MINIMO = 9999;
type
    r_venta = record
        codigo_producto: integer;
        cantidad_vendida: integer;
        monto_total: real;
    end;
    v_ventas = array[1..CANT_VENTAS] of r_venta;
    item_sucursal = record
        ventas: v_ventas;
        dimlog: integer;
    end;
    v_sucursales = array[1..CANT_SUCURSALES] of item_sucursal;
    
    l_codigos = ^nodo;
    r_detalle_codigo = record
        codigo: integer;
        cant_total_vendida: integer;
    end;
    nodo = record
        dato: r_detalle_codigo;
        siguiente: l_codigos;
    end;
    
procedure leer_venta(var venta: r_venta);
begin
    writeln('Ingrese codigo de producto: ');
    read(venta.codigo_producto);
    writeln('Ingrese cantidad vendida: ');
    read(venta.cantidad_vendida);
    writeln('Ingrese monto total: ');
    read(venta.monto_total);
end;

function determinar_posicion(venta: r_venta; ventas: v_ventas; dimlog: integer): integer;
var posicion: integer;
begin
    posicion:= 1;
    while (posicion <= dimlog) and (venta.codigo_producto < ventas[posicion].codigo_producto) do
        posicion := posicion + 1;
    determinar_posicion := posicion;
end;

procedure insertar_posicion(var ventas: v_ventas; var dimlog: integer; posicion: integer; venta: r_venta );
var j: integer;
begin
    if (dimlog < CANT_VENTAS) and (posicion >= 1) and (posicion <= dimlog) then begin
        for j:= dimlog downto posicion do 
            ventas[j + 1] := ventas[j] ;
        ventas[posicion] := venta;
        dimlog := dimlog + 1;
    end;
end;


procedure insertar_ordenado_codigo(var ventas: v_ventas; var dimlog: integer; venta: r_venta);
var 
    posicion: integer;
begin
    if (dimlog < CANT_VENTAS) then begin
        posicion:= determinar_posicion(venta, ventas, dimlog);
        insertar_posicion(ventas, dimlog, posicion, venta);
    end;
end;

procedure leer_ventas_sucursal(var item: item_sucursal);
var
    venta: r_venta;
begin
    item.dimlog := 0;
    leer_venta(venta);
    while(venta.codigo_producto <> -1) and (item.dimlog < CANT_VENTAS) do begin
        insertar_ordenado_codigo(item.ventas, item.dimlog, venta);
        leer_venta(venta);
    end;
end;

procedure leer_ventas_sucursales(var sucursales: v_sucursales);
var
    i: integer;
begin
    for i:= 1 to CANT_SUCURSALES do begin
        writeln('Lea ventas para la sucursal ', i);
        leer_ventas_sucursal(sucursales[i]);
    end;
end;

procedure agregar_atras(var codigos: l_codigos; detalle_codigo: r_detalle_codigo);
var
    act, nue:l_codigos;
begin
    new(nue);
    nue^.dato := detalle_codigo;
    nue^.siguiente := nil;
    if codigos<> nil then begin
        act:=codigos;
        while (act^.siguiente<> nil) do 
            act:=act^.siguiente;
        act^.siguiente:=nue;
    end
    else
        codigos:=nue;
end;

procedure eliminar_posicion(var ventas: v_ventas; var dimlog: integer; posicion: integer);
var 
    j: integer;
begin
    if (posicion >= 1) and (posicion <= dimlog) then begin
        for j:= posicion to dimlog-1 do
            ventas[j] := ventas[j+1];
        dimlog := dimlog - 1;
    end;
end;

procedure minimo_sucursales(var sucursales: v_sucursales; var codigo_minimo: integer; var cantidad_vendida: integer);
var 
    i_minimo, i: integer;
begin
    codigo_minimo := CODIGO_MINIMO;
    i_minimo := -1;
    for i:= 1 to CANT_SUCURSALES do begin
        if (sucursales[i].dimlog > 0) then
            if (sucursales[i].ventas[1].codigo_producto <= codigo_minimo) then begin
                codigo_minimo := sucursales[i].ventas[1].codigo_producto;
                i_minimo := i;
            end;
    end;
    
    if (i_minimo <> -1) then begin
        cantidad_vendida := sucursales[i_minimo].ventas[1].cantidad_vendida;
        eliminar_posicion(sucursales[i_minimo].ventas, sucursales[i_minimo].dimlog, 1);
    end;
end;

procedure merge_acumulador(sucursales: v_sucursales; var codigos: l_codigos);
var
    codigo_minimo: integer;
    codigo_actual: integer;
    cant_total_vendida: integer;
    detalle_codigo: r_detalle_codigo;
    cantidad_vendida: integer;
begin
    codigos := nil;
    minimo_sucursales(sucursales, codigo_minimo, cantidad_vendida);
    while (codigo_minimo <> CODIGO_MINIMO) do begin
        cant_total_vendida := 0;
        codigo_actual:= codigo_minimo;
        while (codigo_minimo <> CODIGO_MINIMO) and (codigo_actual = codigo_minimo) do begin
             cant_total_vendida := cant_total_vendida + cantidad_vendida;
             minimo_sucursales(sucursales, codigo_minimo, cantidad_vendida);
        end;
        detalle_codigo.codigo := codigo_actual;
        detalle_codigo.cant_total_vendida := cant_total_vendida;
        agregar_atras(codigos, detalle_codigo);
       
    end;
end;

procedure contar_productos_aux(codigos: l_codigos; var cant_productos: integer);
begin
    if (codigos <> nil) then begin
        if (codigos^.dato.cant_total_vendida > 500) then
           cant_productos := cant_productos + 1;
        codigos := codigos^.siguiente;
        contar_productos_aux(codigos, cant_productos);
    end;
end;

procedure contar_productos(codigos: l_codigos; var cant_productos: integer);
begin
    cant_productos:=0;
    contar_productos_aux(codigos, cant_productos);
end;

var
    sucursales: v_sucursales;
    codigos: l_codigos;
    cant_productos: integer;
begin
    leer_ventas_sucursales(sucursales);
    merge_acumulador(sucursales, codigos);
    contar_productos(codigos, cant_productos);
end.