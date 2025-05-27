<%@page import="com.productos.seguridad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String correo = request.getParameter("usuario");
    String clave = request.getParameter("clave");
    
    Usuario usuario = new Usuario().verificarUsuario(correo, clave);
    
    if(usuario != null) {
        // Verificar si el usuario está activo
        if(usuario.isActivo()) {
            // Guardar usuario en sesión
            session.setAttribute("usuario", usuario);
            
         // Redirigir según perfil
            if(usuario.getPerfil() == 1) { // Suponiendo que 1 es el perfil de administrador
				response.sendRedirect("administrador/menuAdministrador.jsp");
			} else if(usuario.getPerfil() == 3){
				response.sendRedirect("empleado/cambioClave.jsp");
			} else {
				response.sendRedirect("cliente/menu.jsp");
			}
        } else {
            // Usuario bloqueado
            response.sendRedirect("login.jsp?error=bloqueado");
        }
    } else {
        // Credenciales incorrectas
        response.sendRedirect("login.jsp?error=credenciales");
    }
%>
