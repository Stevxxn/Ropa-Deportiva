<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Usuario usuario=new Usuario();
	String nlogin=request.getParameter("usuario");
	String nclave=request.getParameter("clave");
	
	HttpSession sesion=request.getSession(); //Se crea la variable de sesión
	boolean respuesta=usuario.verificarUsuario(nlogin,nclave);
	if (respuesta)
	{
		sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributo usuario
		sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributo perfil
		Integer perfil = usuario.getPerfil();
		if(perfil != null) {
			if(perfil == 1) { // Suponiendo que 1 es el perfil de administrador
				response.sendRedirect("menuAdministrador.jsp");
			} else if(perfil == 3){
				response.sendRedirect("cambioClave.jsp");
			} else {
				response.sendRedirect("menu.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	else
	{
		%>
		<jsp:forward page="login.jsp">
		<jsp:param name="error" value="Datos incorrectos.<br/>Vuelva a intentarlo."/>
		</jsp:forward>
		<%
	}
%>
</body>
</html>