<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp?error=Debe Auntenticarse Primero");
        }else{
        	String usuario = (String) session.getAttribute("usuario");
        	Integer perfil = (Integer) session.getAttribute("perfil");
        	String id = (String) session.getAttribute("id");
        	
        	if(request.getParameter("radioEliminar").equals("si")){
        		Product pr = new Product();
        		String msg = pr.eliminarProducto(id);
        	}
        	response.sendRedirect("productos.jsp?msg=eliminado");
        }
	%>
	<main>
		<%
			String usuario;
            HttpSession sesion = request.getSession();
            
            if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
            {
                %>
                <jsp:forward page="login.jsp">
                <jsp:param name="error" value="Debe registrarse en el sistema."/>
                </jsp:forward>
                <%
            }
            else
            {
            usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
            int perfil=(Integer)sesion.getAttribute("perfil");
     		Pagina pag=new Pagina();
            String menu=pag.mostrarMenu(perfil);
            
            out.print(menu);
		%>
	
	</main>
</body>
</html>