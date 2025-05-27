<%@page import="com.productos.seguridad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Procesar el formulario de edición
    String idParam = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String correo = request.getParameter("correo");
    String perfilParam = request.getParameter("perfil");
    String estadoCivilParam = request.getParameter("estadoCivil");
    
    if(idParam != null && nombre != null && cedula != null && correo != null && 
       perfilParam != null && estadoCivilParam != null) {
        
        Usuario usuario = new Usuario();
        usuario.setId(Integer.parseInt(idParam));
        usuario.setNombre(nombre);
        usuario.setCedula(cedula);
        usuario.setCorreo(correo);
        usuario.setPerfil(Integer.parseInt(perfilParam));
        usuario.setEstado(Integer.parseInt(estadoCivilParam));
        
        if(Usuario.actualizarUsuario(usuario)) {
            response.sendRedirect("usuarios.jsp?mensaje=Usuario+actualizado+correctamente");
        } else {
            response.sendRedirect("usuarios.jsp?mensaje=Error+al+actualizar+el+usuario");
        }
    } else {
        response.sendRedirect("usuarios.jsp?mensaje=Datos+incompletos");
    }
%>