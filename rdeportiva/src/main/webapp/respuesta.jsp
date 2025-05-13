<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Cliente</title>
</head>
<body>
	<h3>Datos del Nuevo Cliente</h3>
	<p>
		<%
		
			String nombre = request.getParameter("txtNombre");
			String cedula = request.getParameter("txtCedula");
			String ecivil = request.getParameter("cmbECivil");
			String correo = request.getParameter("email");
			String clave = request.getParameter("clave");
			int estadoCivil = Integer.parseInt(ecivil);
			
			Usuario user = new Usuario(2,estadoCivil,cedula,nombre,correo,clave);
			user.ingresarCliente();
			
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