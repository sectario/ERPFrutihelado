const url = ":8080/api/tercero"
const btnAbrirModal =document.querySelector("#btn-abrir-modal");
const btnCerrarModal=document.querySelector("#btn-cerrar-modal");
const modal =document.querySelector("#modal");


fetch(url)
.then(response => response.json() )   
.then(data =>{
    console.log(data)
})
.catch(err=>console.log(err))


btnAbrirModal.addEventListener('click',()=>{
    modal.show();
})

btnCerrarModal.addEventListener('click',()=>{
    modal.close();
})

document.querySelector("input[type=submit]").addEventListener("click",function(e){
    e.preventDefault();
    const nombre=document.querySelector("input[name=nombre]");
    const telefono=document.querySelector("input[name=telefono]");
    const email=document.querySelector("input[name=email]");
    const direccion=document.querySelector("input[name=direccion]");
    const usuario=document.querySelector("input[name=usuario]");

    agregarFila(nombre.value, telefono.value, email.value, direccion.value, usuario.value);
    agregarInput(nombre.value, telefono.value, email.value, direccion.value, usuario.value);
 
    //limpiamos los valores del input
    nombre.value="";
    telefono.value="";
    email.value="";
    direccion.value="";
    usuario.value="";
    nombre.focus();
})

/*document.querySelector(".enviar").addEventListener("click", function(e) {
    this.closest("form").submit();
})*/

function agregarFila(nombre, telefono,email,direccion,usuario) {
    // añadimos el alumno a la tabla crando el tr, td's y el botón para eliminarlo
    const tr=document.createElement("tr");
 
    const tdNombre=document.createElement("td");
    let txt=document.createTextNode(nombre);
    tdNombre.appendChild(txt);
    tdNombre.className="nombre";

    const tdTelefono=document.createElement("td");
    txt=document.createTextNode(telefono);
    tdTelefono.appendChild(txt);
    tdTelefono.className="telefono";
 
    const tdEmail=document.createElement("td");
    txt=document.createTextNode(email);
    tdEmail.appendChild(txt);
    tdEmail.className="email";
    
    const tdDireccion=document.createElement("td");
    txt=document.createTextNode(direccion);
    tdDireccion.appendChild(txt);
    tdDireccion.className="direccion";

    const tdUsuario=document.createElement("td");
    txt=document.createTextNode(usuario);
    tdUsuario.appendChild(txt);
    tdUsuario.className="usuario";

    const tdRemove=document.createElement("td");
    const buttonRemove=document.createElement("img");
    buttonRemove.src="";
    buttonRemove.onclick=eliminarFila;
    tdRemove.appendChild(buttonRemove);
 
      
    tr.appendChild(tdNombre);
    tr.appendChild(tdTelefono);
    tr.appendChild(tdEmail);
    tr.appendChild(tdDireccion);
    tr.appendChild(tdUsuario);
    tr.appendChild(tdRemove);
 
    const tbody=document.getElementById("proveedor").querySelector("tbody").appendChild(tr);

    // eliminamos la clase que tiene oculta la tabla cando no hay ningun alumno
    document.getElementById("proveedor").classList.remove("hide");
}
function eliminarFila(e) {
    const tr=this.closest("tr")
    const nombre=tr.querySelector(".nombre").innerText;
    const telefono=tr.querySelector(".telefono").innerText;
    const email=tr.querySelector(".email").innerText;
    const direccion=tr.querySelector(".direccion").innerText;
    const usuario=tr.querySelector(".usuario").innerText;
 
    eliminarInput(nombre, telefono,email,direccion,usuario);
    tr.remove();
 
    // Si no hay ningun elemento en la lista, escondemos la tabla
    if (document.getElementById("proveedor").querySelector("tbody").querySelectorAll("tr").length==0) {
        document.getElementById("proveedor").classList.add("hide");
    }
}

function agregarInput(nombre, telefono,email,direccion,usuario) {
    const input=document.createElement("input");
    input.type="hidden";
    input.name="nombres[]";
    input.value=nombre+"-"+telefono+"-"+email+"-"+direccion+"-"+usuario;
 
    document.querySelector("form").appendChild(input);
}

function eliminarInput(nombre, telefono,email,direccion,usuario) {
    const input=document.querySelector("input[type=hidden][value="+nombre+"-"+telefono+"-"+email+"-"+direccion+"-"+usuario+"]");
    input.remove();
}