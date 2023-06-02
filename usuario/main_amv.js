
var idpac;
var seccionActual = "login";
var paginaactual;
function cambiarSeccion(seccion){
    document.getElementById(seccionActual).classList.remove("activa");
    document.getElementById(seccion).classList.add("activa");
    seccionActual=seccion;
}

function salir(){
    location.reload();
    cambiarSeccion("login");
    //conexion.close();
    rest.put("/api/victimas",function(estado, respuesta){
        if(estado == 201){
            console.log(respuesta);
        }
        else{
            alert("Error con la modificacion ")
        }
    });
    rest.put("/api/victimas/colorsalir",function(estado, respuesta){
        if(estado == 201){
            console.log(respuesta);
        }
        else{
            alert("Error con la modificacion ")
        }
    });

};

function menuPrincipal(){
    cambiarSeccion("menu-principal");
};




function tareas(idActual){
    idvict = idActual;
   
    tareas();
    datosVict(idActual);
}
//ACCESO LOGIN
function entrar() { 
    console.log("llamando funcion entrar");
    var usuario = {
        login: document.getElementById("usuarioHTML").value,
        password: document.getElementById("contraHTML").value
    };
    console.log(usuario.login);
    
    rest.post("/api/usuario/login", usuario, function (estado, respuesta) {
        console.log(estado);
        if (estado == 200) {
            console.log("RESPUESTA: ", respuesta);
            idUsuarioLogin = respuesta;
            cambiarSeccion("menu-principal");
            datosUsu();
            listaVict();
            colores();
            pizarradefecto();
           
        }
        else{
            alert("Error en el usuario introducido");
        }
    });
}

function presentacion(){
    console.log(idUsuarioLogin);
    var pres = {id: idUsuarioLogin, puesto: puestoLogin};
    console.log(pres);
    return pres;
}

//DATOS USUARIO PAGINA PRINCIPAL
function datosUsu(){
    console.log("ID del usuario: ",idUsuarioLogin);
    rest.get("/api/usuario/" + idUsuarioLogin, function (estado, resp) {
        if(estado == 200){
            console.log("LA resp es:",resp);
            var bienvenido = document.getElementById("bienvenido");
            bienvenido.innerHTML = "<p>Numero de identificacion: " + resp[0].idusuario+"</p>";
            var inicio = document.getElementById("puestoinicio");
            inicio.innerHTML ="<p>Puesto: " + resp[0].puesto+"</p>";
        }
        else{
            alert("Error cargando datos del usuario");
        }
        usuActual = resp;
        console.log("usuario actual", usuActual);
    });
}
vic_pagprincipal=[];
//Mostrar tantos botones como víctimas haya
function listaVict(){ 
    rest.get("/api/usuario/" + idUsuarioLogin+ "/victimas", function (estado, resp) {
        if (estado != 200) {//error
            console.log(estado);
            alert("Error cargando la lista de pacientes");
            return;
        }else{
            const resultado = [];
            for(j=0;j<resp.length;j++){
                vic_pagprincipal.push(resp[j]);
              
            }    
            
            console.log("vic_",vic_pagprincipal);
            var lista = document.getElementById("listaVictimas");
       
            lista.innerHTML="<table id='botones-table' class='botonesb'><thead><tr></tr></thead><tbody id='botones-body'></tbody></table>";
            const botonesTable = document.getElementById("botones-table");

            const botonesBody = document.getElementById("botones-body");

           
            const botonesArray = [];
            for (let i = 0; i <= resp.length-1; i++) {
                botonesArray.push(`${i+1}</button>`);
                
            };

            let currentColumn = 1;
            let currentRow = botonesBody.insertRow();
            for (let i = 0; i < botonesArray.length; i++) {
            const newCell = currentRow.insertCell();
            const newButton = document.createElement('button');
            newButton.innerHTML = botonesArray[i];
            newCell.appendChild(newButton);
            if ((i + 1) % 10 === 0) {
                // Crea una nueva columna después del boton 10
                currentColumn++;
                currentRow = botonesBody.insertRow();
            }
            }

            const botonesid = document.querySelectorAll('#botones-body button');
            botonesid.forEach((boton, idunico) => {
            boton.id = `${idunico+1}`;
            });
           
            const botones = document.querySelectorAll('button:not(#atras):not(#start):not(#stop):not(#imprimir)');

            var ultimoBotonSeleccionado = null;
             var estiloActual=null;
            botones.forEach(boton => {
                
                boton.addEventListener('click', function(event) {
                    
                      if (ultimoBotonSeleccionado !== null) {
                        
                        ultimoBotonSeleccionado.style.border = "none";
                      }
                      
                      boton.style.border = "0.25em solid blue";
                      ultimoBotonSeleccionado = boton;   
                    paginaactual=1;
                    var seleccion=event.target.id;
                    console.log("varseleccion",seleccion);
                 
                    pizarras(paginaactual,seleccion);
                   
                    console.log("llamo a contenidopizarras");
                });
            });
            
        }
        });
};
var variable;
var idglobal=1;
//FUNCIÓN DE NAVEGACIÓN ENTRE PIZARRAS 
function pizarras(paginaactual,seleccion){
    paginaactual=1;
    idglobal=seleccion;
    contenidopizarras(seleccion,1);
  

};


function pizarradefecto(){
    var idvictima=document.getElementById("tareas");
    idvictima.innerHTML="<p display='flex' justify-content='center'><b>SELECCIONE UNA VÍCTIMA</p>";
   
}



function contenidopizarras() {
    var paginaactual = parseInt(document.getElementById("pizarra").value);
    console.log("pagact", paginaactual);
    console.log("CONTENIDO");
    idVic = idglobal;
    console.log("idg", idglobal);
    var vez=1;
    //MOSTRAR CONTENIDO PIZARRAS
    rest.post("/api/victima/" + idVic + "/pizarra/" + paginaactual, function(estado, datos) {
      console.log("entrooooooooooooooooooooo")
      console.log("Estado:", estado, "infopizarras: ", datos);
      if (estado != 200) {
        alert("Error redirigiendo");
        return;
      } else {
        var idvictima = document.getElementById("idvict");
        var lista = document.getElementById("tareas");
        var mostrar = "";
       
        for (i = 0; i < datos.length; i++) {
          console.log("datos", datos[i]);
          mostrar = mostrar + "<ul></ul>";
          mostrar = mostrar + "<input type='checkbox' class='checkbox-class' onclick='realizados(" + idVic + ")' id='" + datos[i].id_var +"'checked</input>"+"  "+ datos[i].variables;

        }  
         
        idvictima.innerHTML = "<p class='idv'>VÍCTIMA " + idVic + "</p>";
        lista.innerHTML = mostrar;
  
        /*
        
        for (i = 0; i < datos.length; i++) {
          console.log("datos", datos[i]);
          mostrar = mostrar + "<ul></ul>";
          if((datos[i].id_var==lista.id_var && datos[i].idVic==lista.idVic) ||vez!=1){
            vez++;
            mostrar = mostrar + "<input type='checkbox' class='checkbox-class' onclick='realizados(" + idVic + ")' id='" + datos[i].id_var + "'checked";
          }else{
            mostrar = mostrar + "<input type='checkbox' class='checkbox-class' onclick='realizados(" + idVic + ")' id='" + datos[i].id_var + "'";

          }
         
        }
        
        */
        
      }
    });
  }
  
 
function marcar(pizarra,vic){
    console.log(pizarra,vic);
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    rest.get("/api/victima/"+vic+"/pizarra/"+pizarra+"/marcada", function(estado, r){  
        console.log("entrooooooooooooooooooooo")  
       console.log("Estado:", estado, "infopizarras: ", r);
       if (estado != 201) {
           alert("Error redirigiendo");
           return;
       }
       else{
        console.log("MARCADAS",r)
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        for (var i = 0; i < checkboxes.length; i++) {
            if (r.includes(checkboxes[i].id)) {
                checkboxes[i].checked = true;

            }
        }

       }
    }
    )
}
   

//FUNCION PARA CAMBIAR DE PENDIENTE A REALIZADA UNA TAREA
function realizados(idVic) {
    console.log("ME METO EN REALIZADOS");
    console.log("pagactual", paginaactual);
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      
      checkbox.addEventListener('change', () => {
       
          console.log(`El checkbox con valor ${checkbox.id} ha sido marcado`);
          var idtarea = `${checkbox.id}`;
          console.log(idtarea);
          var fin = new Date().getTime();
          var tiempotarea = (fin - startTime) / 1000;
          console.log("fin", fin);
          console.log("tiempotoooot", tiempotarea);
        //----------------------------------------------------------------

         
          contador(idtarea, idVic, tiempotarea);
          

          rest.put("/api/victima/" + idVic + "/tarea/" + idtarea, function(estado, respuesta) {
            if (estado == 201) {
              console.log("he cambiado la tarea", idtarea, "de pend a real", respuesta);
              //comprobar si están todas realizadas
              contadorpizarra(idtarea, idVic, tiempotarea);
              
            } else {
              alert("Error con la modificacion ")
            }
          });
        
      });
      
      
    });
  }
  
  
  
//COLORES INICIALES

function colores(){
    var color_i;
    var color_bd;
    rest.get("/api/victimas", function(estado, datos){  
       
       console.log("Estado:", estado, "infopizarras: ", datos);
       if (estado != 201) {
           alert("Error redirigiendo");
           return;
       }
       else{
        const botonesc = document.querySelectorAll('#botones-body button');
        console.log(botonesc)
        datos.sort((a, b) => a.idvict_e - b.idvict_e);
       
            for(var i=0;i<datos.length;i++){
                if (datos[i].codigo_color === "neg") {
                   
                    botonesc[i].style.backgroundColor="black";
                    botonesc[i].style.color="white";
                }
                if (datos[i].codigo_color === "roj") {
                   
                    botonesc[i].style.backgroundColor="red";
                }
                if (datos[i].codigo_color === "am") {
                  
                   botonesc[i].style.backgroundColor="yellow";
                }
                if (datos[i].codigo_color === "ver") {
                  
                   botonesc[i].style.backgroundColor="green";
                }
                };   
            };
        console.log(datos);
    } )
    }



//-----------------------CRONOMETRO-----------------------------------------------
let startTime = 0;
let intervalId = null;
var totalmins=0;
var elapsedMins=0; 
var comprobado = false;
var lastMinute=0;
function empezarcrono() {
  if (!intervalId) {
    intervalId = setInterval(actcrono, 10);
  }
  startTime=new Date().getTime();
};

function fincrono() {
  if (intervalId) {
    clearInterval(intervalId);
    intervalId = null;
    
    let endTime = new Date().getTime();
    console.log(startTime,endTime)
    let totalTime = (endTime - startTime) / 1000; // Convertir a segundos
    let formattedTime = new Date(totalTime * 1000).toISOString().slice(11, -1); 
    console.log("TIEMPO TOTAL EN SEGUNDOS: ", totalTime);
    totalmins=totalTime/60;
   totalmins.toFixed(4);//max 4 decimales
    console.log("TOTAL MINUTOS:", totalmins);
    document.getElementById("total").innerHTML=totalmins;
    //SE LLAMA A LA FUNCION IMPRIMIR PARA MOSTRAR TODOS LOS RESULTADOS FINALES
    imprimir();
    
  }
};

function actcrono() {
    var minutos=0;
  let currentTime = new Date().getTime();
  let elapsedTime = currentTime - startTime;
  let formattedTime = new Date(elapsedTime).toISOString().slice(11, -1);
  document.getElementById("timeDisplay").innerHTML = formattedTime;

  elapsedMins = Math.floor(elapsedTime / 1000); 
  comprobado = false; 

  let elapsedMinutes = Math.floor(elapsedTime / 60000);

  if (elapsedMinutes > lastMinute) {
    console.log("+1");
 
    lastMinute = elapsedMinutes;
    console.log(lastMinute)
    minutos=lastMinute;
}

  switch(minutos){
    case 1:
        comprobar(1);
        break;
    case 2:
        comprobar(2);
        break;
    case 40:
        comprobar(40);
        break;
    case 60:
        comprobar(60);
        break;
    case 120:
        comprobar(120);
        break;
    case 360:
        comprobar(360);
        break;
  }

};

//CONVERSION TIEMPO--------------------------------------------

function tiempoEnMinutos(tiempo) {
    console.log("trecibo",tiempo);
    var partes = tiempo.split(':');
    console.log(partes);

    var segundos = parseFloat(partes[2]);

    console.log("secs",segundos)
    // Calcular el tiempo total en minutos
    
        var tiempoTotal = parseInt(partes[0]) * 60 + parseInt(partes[1]) + segundos / 60;

        return tiempoTotal;
  }
  //volver al formato de la bd
  function convertirTiempo(segundos) {
    var horas = Math.floor(segundos / 3600);
    var minutos = Math.floor((segundos % 3600) / 60);
    var segundos = Math.floor(segundos % 60);
    var milisegundos = Math.floor((segundos % 1) * 1000000);
  
    var formato = horas.toString().padStart(2, '0') + ':' +
                  minutos.toString().padStart(2, '0') + ':' +
                  segundos.toString().padStart(2, '0') + '.' ;
                 
  
    return formato;
  }
  
  console.log(convertirTiempo(3601));

  function convertirmins(segundos) {
    var horas = Math.floor(segundos / 3600);
    var minutos = Math.floor((segundos % 3600) / 60);
    var segundosRestantes = Math.floor(segundos % 60);
    var milisegundos = Math.floor((segundos % 1) * 1000);
  
    var formato = horas.toString().padStart(2, '0') + ':' +
                  minutos.toString().padStart(2, '0') + ':' +
                  segundosRestantes.toString().padStart(2, '0') + '.' +
                  milisegundos.toString().padStart(6, '0');
  
    return formato;
  }
  
  //-------------------------------------------------------------------------------------------------------------------------------------------------
// CADA TAREA GUARDAR CUANTO TARDA -----evolucion_paz>tiempo_real
function contador(variablep,idp,tiempotarea){
    console.log("var",variablep, "idp",idp, "tiempot",tiempotarea);

    var tiempotot=0;
           var tiempoenviar=convertirTiempo(tiempotarea);
            console.log("emvio",tiempoenviar)
            rest.put("/api/victima/"+idp+"/tarea/"+variablep+"/tiempo/"+tiempoenviar,function(estado, respuesta){
                if(estado == 201){
                    console.log(respuesta);
                }
                else{
                    alert("Error con la modificacion ")
                }
            });

};

function contadorpizarra(idtarea,idvict,tiempo){
    var variablep;
    rest.post("/api/tarea/"+idtarea+"/victima/"+idvict, function(estado, datos){  
        console.log("entrooooooooooooooooooooo")  
       console.log("Estado:", estado, "infopizarras: ", datos);
       if (estado != 200) {
           alert("Error redirigiendo");
           return;
       }
       else{
        variablep=datos[0].pizarra;
        console.log("numpiz",variablep);
        //condiicon de que todas las variables de esa pizzz esten realizadas
        //FUNCION
        rest.get("/api/victima/" + idvict+ "/pizarra/"+variablep+"/real", function (estado, resultado) {
            if (estado != 201) {//error
                console.log(estado);
                alert("Error");
                return;
            }else{
                console.log(resultado)
                if(resultado=="real"){
                    rest.put("/api/victima/"+idvict+"/pizarra/"+variablep+"/tiempo/"+tiempo,function(estado, respuesta){
                        if(estado == 201){
                            console.log(respuesta);
                        }
                        else{
                            alert("Error con la modificacion ")
                        }
                    });

                    return resultado;
                }else{
                    console.log("real/pend del contpizarra",resultado) 

                }
                
    
            }
        })
       }
    });

};

function comprobar(tiempocrono){
    console.log(tiempocrono)
    var envio=convertirmins(tiempocrono*60);
    console.log("enviooo",envio);
    rest.get("/api/tiempo/"+envio, function (estado, r) {
        if (estado != 201) {//error
            console.log(estado);
            alert("Error");
            return;
        }else{
            console.log("r",r);
             
           async function peticion(result) {
            for (let i = 0; i < result.length; i++) {
              const idvict = result[i].id_pac;
              const variablep = result[i].pizarra;
          
              const resp = await new Promise((resolver, error) => {
                rest.get(`/api/victima/${idvict}/pizarra/${variablep}/real`, function (estado, resultado) {
                  if (estado !== 201) {

                    error(new Error(`Error ${estado}`));
                  } else {
                    console.log("VOY A RESOLVER", resultado)
                    resolver(resultado);
                  }
                });
              });
              if (resp === 'real') {
                console.log('PIZARRA REALIZADA');

              } else {
                console.log("QUEDAN TAREAS PENDIENTES")
                evolucioncolores(idvict, variablep);
              }
          
              console.log('real/pend', resp);
            }
          }

          peticion(r);
          
            
 

        }
    })
 };

function evolucioncolores(idvictim,pizarra){
  console.log("idbotooon",idvictim)
    rest.get("/api/victimas", function(estado, datos){  
       console.log("Estado:", estado, "infopizarras: ", datos);
       if (estado != 201) {
           alert("Error redirigiendo");
           return;
       }
       else{
        rest.put("/api/victima/"+idvictim+"/evolucion",function(estado, respuesta){
            if(estado == 201){
                console.log(respuesta);
            }
            else{
                alert("Error con la modificacion ")
            }
        });
        
        console.log("dat",datos)
        const boton = document.querySelector(`button[id="${idvictim}"]`);
        console.log("botooon",boton)
        for(var i=0;i<datos.length;i++){
            if(datos[i].idvict_e==idvictim){
                if (datos[i].codigo_color === "roj") {
                    boton.style.backgroundColor="black";
                    boton.style.color="white";
                }
                if (datos[i].codigo_color === "ver") {
                    boton.style.backgroundColor="yellow";
 
                }
                if (datos[i].codigo_color === "am") {
                   boton.style.backgroundColor="red";
                   
                }


            }
            
        };  
       
    
        };

})};


function imprimir(){
    rest.post("/api/victimas/imprimir", function(estado, datos) {

        if (estado != 201) {
          return;
        } else {
            console.log(datos)         
            const columnas = Object.keys(datos[0]);
            const tabla = document.createElement('table'); 
            const encabezado = tabla.insertRow();
            columnas.forEach(columna => {
            const th = document.createElement('th');
            th.textContent = columna;
            encabezado.appendChild(th);
            });

            datos.forEach(dato => {
            const fila = tabla.insertRow();
            columnas.forEach(columna => {
                const celda = fila.insertCell();
                celda.textContent = dato[columna];
            });
            });
            var ventana = window.open("", "_blank", "height=600,width=1000");

            ventana.document.write('<html><head><title>Tabla de resultados</title>');
            ventana.document.write('</head><body>');
            ventana.document.write('<h1>Tabla de resultados</h1>');
            ventana.document.write(tabla.outerHTML);
            ventana.document.write('</body></html>');
      
            ventana.document.close(); // Finalizar la escritura del documento
      
            ventana.print(); // Imprimir la ventana emergente


      }});
      
   
    

}

  

 