+program ejercicio3;
const
    CANT_PRODUCTOS = 30;
type
    s_rubro = 1..8;
    
    r_producto = record
        codigo: integer;
        rubro: s_rubro;
        precio: real;
    end;
    v_productos = array[1..CANT_PRODUCTOS] of r_producto;
    l_productos = ^nodo;
    nodo = record
        dato: r_producto;
        siguiente: l_productos;
    end;
    
procedure leer_producto(var producto: r_producto);
begin
    writeln('Ingrese codigo: ');
    read(producto.codigo);
    writeln('Ingrese rubro: ');
    read(producto.rubro);
    writeln('Ingrese precio: ');
    read(producto.precio);
end;

procedure mostrar_codigos_rubro(productos: l_productos);
var rubro_actual: s_rubro;
begin
    while(productos <> nil)do begin
        rubro_actual := productos^.dato.rubro;
        writeln('rubro: ', rubro_actual);
        while(productos <> nil) and (rubro_actual = productos^.dato.rubro) do begin
            writeln('codigo: ', productos^.dato.codigo);
            productos := productos^.siguiente;
        end;
    end;
end;

procedure generar_vector(var vector: v_productos; var dimlog: integer; lista: l_productos);
begin
    dimlog := 0;
    while (lista <> nil) and (lista^.dato.rubro <> 3) do
        lista := lista^.siguiente;
    while (lista <> nil) and (dimlog < CANT_PRODUCTOS) and (lista^.dato.rubro = 3) do begin
        dimlog := dimlog + 1;
        vector[dimlog] := lista^.dato;
        lista := lista^.siguiente;
    end;
end;
procedure insertar_ordenado(var productos: l_productos; producto: r_producto);
var
    ant, nue, act: l_productos;
begin
    new(nue);
    nue^.dato := producto;
    act := productos;
    ant := productos;
    
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while(act<> nil) and (act^.dato.rubro <= producto.rubro) and (act^.dato.codigo < producto.codigo) do begin
        ant:=act;
        act:=act^.siguiente;
    end;
    if (ant=act) then 
        productos:=nue {el dato va al principio}
    else 
        ant^.siguiente:=nue; {va entre otros dos o al final}
    nue^.siguiente:=act;
end;

procedure leer_productos(var productos: l_productos);
var 
    producto: r_producto;
begin
    productos := nil;
    leer_producto(producto);
    while (producto.codigo <> 0) do begin
        insertar_ordenado(productos, producto);
        leer_producto(producto);
    end;
end;

procedure ordenar_seleccion(var productos: v_productos, dimlog: integer);
var 
    i, j, p: integer; 
    item : r_producto;	
begin
    for i:=1 to dimlog-1 do begin {busca el mínimo y guarda en p la posición}
        p := i;
        for j := i+1 to dimlog do
            if (productos[j].precio < productos[p].precio) then 
                p:=j;
        {intercambia generos[i] y generos[p]}
        item := productos[p];   
        productos[p] := productos[i];   
        productos[i] := item;
    end;
end;

procedure informar(var productos: v_productos, dimlog: integer);
var
    i: integer;
begin
    for i:= 1 to dimlog do
        writeln(productos[i].precio);
end;

var
    lista: l_productos;
    vector: v_productos;
    dimlog: integer;
begin
    leer_productos(lista);
    mostrar_codigos_rubro(lista);
    generar_vector(vector, dimlog, lista);
    ordenar_seleccion(vector, dimlog);
    informar(vector, dimlog);
end.

