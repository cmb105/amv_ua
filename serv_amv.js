
var express = require("express");
var app = express();
var rpc = require("./rpc.js");
app.use("/usuario", express.static("usuario"));
app.use(express.json()); 

const mysql = require('mysql');
const basedatos = {
    host : 'localhost',
    user : 'root',
    database : 'amv'
};

var conexion = mysql.createConnection(basedatos);

conexion.connect(function (err) {
    if (err) {
        console.log('Error en la conexion de BBDD: ', err);
        return;
    }
});


app.post("/api/usuario/login", function(req,res) {
    console.log("estoy dentro")
    var login_dato = req.body.login;
    var password_dato = req.body.password;
  
    var sql_usuario =("SELECT idusuario FROM usuarios WHERE  login= "+ mysql.escape(login_dato))+" AND password = " + mysql.escape(password_dato);
    console.log("EL SQL_USUARIO ES: ",sql_usuario);

    conexion.query(sql_usuario, function(err,idlogin){
        if(err){
            console.log("Error en la recuperacion de datos: " , err);
            res.status(403).json("error login");
            return;
        }
       
        console.log("res.status",idlogin[0].idusuario);
        res.status(200).json(idlogin[0].idusuario);
        console.log("me salgo");
    });
});


app.get("/api/usuario/:idusuario", function (req, res) {
    var id_url = req.params.idusuario;
    var sql_usuario = "SELECT idusuario, puesto FROM usuarios WHERE idusuario = " + mysql.escape(id_url);
    console.log("url: ", sql_usuario);

    conexion.query(sql_usuario, function(err, datos_usu){
        if (err){
            console.log("Error en la recuperacion de datos", err);
            res.status(404).json("No existe usuario");
            return;
        }
        res.status(200).json(datos_usu);
        console.log("datos del usuario:", datos_usu);
    })
});
//BOTONES ID_V PAGINA PRINCIPAL
app.get("/api/usuario/:id/victimas", function (req, res){
    var victimas=("SELECT id_v from victimas");
    console.log("victimas", victimas);
 
    conexion.query(victimas,function(err,datosV){
        if(err){
            console.log("Error al realizar la select",err);
            res.status(500).json("no existe");
        }
        console.log("datos de las victimas: ", datosV);
        res.status(200).json(datosV);
    });
}); 

//FUNCION QUE ME MUESTRE POR PANTALLA LAS ACCIONES A REALIZAR EN CADA PANTALLA
app.post("/api/victima/:id/pizarra/:pizarra", function (req, res) {
    console.log("me meto")
    var identificadorpac = req.params.id;
    console.log("IDDDDD",identificadorpac);
    const paginaActual = req.params.pizarra;
    console.log("query",paginaActual);
    var lista=[];

    var pizarra=("select*from pizarras where id_v_piz="+  mysql.escape(identificadorpac)+"and pizarra= "+ mysql.escape(paginaActual));
    console.log("pizarra",pizarra);
    conexion.query(pizarra,function(err,infoV){
        if(err){
            console.log("Error en carga de la pizarra",err);
            res.status(404).json("Error al cargar la pizarra");
            return;
        }
      else{
        for(var i = 0; i < infoV.length; i++){
            var muestra = {
                variables: infoV[i].variables,
                tiempo_teorico: infoV[i].tiempo_teorico,
                id_var: infoV[i].id_var,
                id_v_piz: infoV[i].id_v_piz
            };
            lista.push(muestra);
        
        };
        console.log(lista);
        res.status(200).json(lista);
      }

    });
    
});

//MODIFICAR TAREAS PENDIENTE-REALIZADA
app.put("/api/victima/:id/tarea/:idt",(req,res)=>{
    var idActual = req.params.id;
    var idT=req.params.idt;

    var actualizarV = ("update evolucion_piz set estado= 'real' where id_pac = " + mysql.escape(idActual) + "and id_var_piz="+mysql.escape(idT));
    console.log("act",actualizarV)
    conexion.query(actualizarV,function(err,victimaactual){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(201).json("Tarea no actualizada");
        }
        res.status(201).json('correcto');
        console.log("paciente actualizado");
    });
    //modificar el tiempo q se tarda en CADA TAREA



});
//AL PULSAR EL BOTÓN SALIR SE VUELVEN A PONER TODAS LAS TAREAS COMO PENDIENTES
app.put("/api/victimas",(req,res)=>{
    var actualizarV = "update evolucion_piz set estado= 'pend'";
    conexion.query(actualizarV,function(err,victimaactual){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(201).json("Tarea no actualizada");
        }
        res.status(201).json('correcto');
        console.log("pacientes actualizados");
    });

});
//AL PULSAR EL BOTON SALIR REESTABLECER EL COLOR DE LAS VICTIMAS
app.put("/api/victimas/colorsalir",(req,res)=>{
    var actualizarV = `
    UPDATE victimas
    JOIN evolucion_vict ON victimas.id_v = evolucion_vict.idvict_e
    SET victimas.evol_v = evolucion_vict.codigo_color
  `;
    conexion.query(actualizarV,function(err,victimaactual){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(201).json("Tarea no actualizada");
        }
        res.status(201).json('correcto');
        console.log("pacientes actualizados");
    });

});



//FUNCION PARA GESTIONAR LOS COLORES INICIALES DE LOS BOTONES
app.get("/api/victimas", function (req, res) {
    var peticion_i = "select idvict_e, codigo_color from evolucion_vict";
    console.log("act",peticion_i)
    conexion.query(peticion_i,function(err,color_i){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(201).json("Tarea no actualizada");
        }
        console.log("rs",color_i)
        res.status(201).json(color_i);
    });

});


//COLORES DE LAS VICTIMAS AL FINALIZAR EL SIMULACRO
app.put("/api/victima/:id/evolucion", function (req, res) {
    var idv=req.params.id;
    var actualizarC = "UPDATE victimas SET evol_v = CASE WHEN evol_v = 'am' THEN 'roj' WHEN evol_v = 'roj' THEN 'neg' WHEN evol_v = 'ver' THEN 'am' ELSE evol_v END WHERE id_v = " + mysql.escape(idv);
    console.log("act",actualizarC)
    conexion.query(actualizarC,function(err,victimaactual){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(201).json("Tarea no actualizada");
        }
        console.log("resppppp",victimaactual);
        res.status(201).json('correcto');
        console.log("paciente actualizado");
    });

});


//FUNCIONES PARA COGER EL TIEMPO DE CADA TAREA
app.put("/api/victima/:id/tarea/:tarea/tiempo/:tiempotarea", function (req, res) {
    console.log("entrooo puutttttttt");
    idv=req.params.id;
    piz=req.params.tarea;
    tiempotarea=req.params.tiempotarea;
    console.log("ttareaservvvvv",tiempotarea);
    var actualizarC = ("UPDATE evolucion_piz SET tiempo_real="+mysql.escape(tiempotarea)+"where id_var_piz="+mysql.escape(piz)+"and id_pac="+mysql.escape(idv));
    console.log("act",actualizarC)
    conexion.query(actualizarC,function(err,victimaactual){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(404).json("Tarea no actualizada");
        }
        console.log("resppppp",victimaactual);
        res.status(201).json('correcto');
        console.log("paciente actualizado");
    });

});
//por pizarraaassssssssssssss
app.get("/api/victima/:id/pizarra/:piz/tiempos", function (req, res) {
    console.log("entro");
    idv=req.params.id;
    piz=req.params.piz;
    var peticion_i = "select tiempo_vars from pizarras where id_v_piz="+mysql.escape(idv)+"and pizarra="+mysql.escape(piz);
    console.log("pido",peticion_i)
    conexion.query(peticion_i,function(err,tiempo){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(201).json("Tarea no actualizada");
        }
        console.log("rs",tiempo)
        res.status(201).json(tiempo);
    });

});


//saber a que pizarra pertenece esa tarea
app.post("/api/tarea/:idtarea/victima/:vict", function (req, res) {
    var tareamain=req.params.idtarea;
    var vict=req.params.vict;
    var piztarea=("select pizarra from pizarras where id_var="+mysql.escape(tareamain)+"and id_v_piz="+mysql.escape(vict))
    conexion.query(piztarea,function(err,pizarra){
        if(err){
            console.log("Error en carga de la pizarra",err);
            res.status(404).json("Error al cargar la pizarra");
            return;
        }
    
      else{
        res.status(200).json(pizarra);
      }
    })

})



///COMPROBAR()que todas las vars de esa pizarra esten realizadas
app.get("/api/victima/:id/pizarra/:piz/real", function (req, res) {
    console.log("entro");
    idv=req.params.id;
    piz=req.params.piz;
    //POR PIZARRA Y POR VICTIMA
    var peticion_i = "SELECT COUNT(*) AS pendientes FROM evolucion_piz WHERE estado != 'real' and id_pac="+mysql.escape(idv)+"and numpiz="+mysql.escape(piz);
    console.log("pido", peticion_i);
    conexion.query(peticion_i, function(err, resultado) {
    if (err) {
        console.log("Error en carga de las tareas", err);
        res.status(201).json("Tarea no actualizada");
    }
    
    var pendientes = resultado[0].pendientes;
    
    if (pendientes > 0) {
        res.status(201).json("pend");
    } else {
        res.status(201).json("real");
    }

    });

});

//coger las vict+pizz con ese tiempo max
app.get("/api/tiempo/:tiempo", function (req, res) {
    console.log("entro");
    t=req.params.tiempo;
    var peticion_i = "select id_pac,pizarra from tiempos_piz where i_pizarra="+mysql.escape(t);
    console.log("pido", peticion_i);
    conexion.query(peticion_i, function(err, resultado) {
    if (err) {
        console.log("Error en carga de las tareas", err);
        res.status(500).json("Tarea no actualizada");
    }else{
        res.status(201).json(resultado);
        console.log(resultado);

    }
    });

});

app.get("/api/victima/:id/pizarra/:piz/marcada", function (req, res) {
    console.log("entro");
    idv=req.params.id;
    piz=req.params.piz;
    //POR PIZARRA Y POR VICTIMA
    var peticion_i = "SELECT id_pac,id_var_piz FROM evolucion_piz WHERE estado ='real'";
    console.log("pido", peticion_i);
    conexion.query(peticion_i, function(err, resultado) {
    if (err) {
        console.log("Error en carga de las tareas", err);
        res.status(201).json("Tarea no actualizada");
    }else{

        res.status(201).json(resultado);
    }

    });

});

//IMPRIMIR
app.post("/api/victimas/imprimir", function (req, res) {
    console.log("entro");
    var peticion_i = "select id_pac, pizarra,i_pizarra, f_pizarra from tiempos_piz";
    console.log("pido", peticion_i);
    conexion.query(peticion_i, function(err, resultado) {
    if (err) {
        console.log("Error en carga de las tareas", err);
        res.status(404).json("Tarea no actualizada");
    }else{
        res.status(201).json(resultado);
        console.log(resultado);

    }
    });

});


//TIEMPOS TOTALES PIZARRA
app.put("/api/victima/:id/pizarra/:pizarra/tiempo/:tiempo", function (req, res) {
    var idv=req.params.id;
    var piz=req.params.pizarra;
    var tiempo=req.params.tiempo;
    var actualizarC = "UPDATE tiempos_piz SET f_pizarra="+tiempo+" WHERE id_pac = " + mysql.escape(idv)+"and pizarra="+ mysql.escape(piz);
    console.log("act",actualizarC)
    conexion.query(actualizarC,function(err,victimaactual){
        if(err){
            console.log("Error en carga de las tareas",err);
            res.status(201).json("Tarea no actualizada");
        }
        console.log("resppppp",victimaactual);
        res.status(201).json('correcto');
        console.log("paciente actualizado");
    });

});


app.listen(3030, function(){
    console.log("ESCUCHANDO SERVIDOR");
});