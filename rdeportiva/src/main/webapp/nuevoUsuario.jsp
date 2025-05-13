<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Cliente</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3>Datos del Nuevo Cliente</h3>
	<p>
	
	<%
	
	String nombre = request.getParameter("txtNombre");
	String cedula = request.getParameter("txtCedula");
	String perfil = request.getParameter("cmbPerfil");
	String ecivil = request.getParameter("cmbECivil");
	String correo = request.getParameter("email");
	int estadoCivil = Integer.parseInt(ecivil);
	int perfilUsuario = Integer.parseInt(perfil);
	
	Usuario user = new Usuario();
	user.setNombre(nombre);
	user.setCedula(cedula);
	user.setPerfil(perfilUsuario);
	user.setEstado(estadoCivil);
	user.setCorreo(correo);
	user.setClave("654321");
	
	if(user.ingresarEmpleado(perfilUsuario, estadoCivil, cedula, nombre, correo)){
		response.sendRedirect("menuAdministrador.jsp");
	}else{
        response.sendRedirect("nuevoUsuario.jsp");
    }
	
	%>
	<h1>Nombre: </h1>
	<p>
        <%
            out.println(nombre);
        %>
	</p>
	<h1>Cédula: </h1>
	<p>
        <%
            out.println(cedula);
        %>
    </p>
    <h1>Estado Civil: </h1>
    <p>
        <%
            out.println(ecivil);
        %>
    </p>
</body>
</html>