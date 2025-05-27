<%@page import="com.productos.seguridad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Procesar el formulario de nuevo usuario
    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    String perfilParam = request.getParameter("perfil");
    String estadoCivilParam = request.getParameter("estadoCivil");
    
    if(nombre != null && cedula != null && correo != null && clave != null && 
       perfilParam != null && estadoCivilParam != null) {
        
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setCedula(cedula);
        usuario.setCorreo(correo);
        usuario.setClave(clave);
        usuario.setPerfil(Integer.parseInt(perfilParam));
        usuario.setEstado(Integer.parseInt(estadoCivilParam));
        usuario.setActivo(true);
        
        // Usamos el método ingresarEmpleado que ya tienes en tu clase Usuario
        if(usuario.ingresarEmpleado(
            usuario.getPerfil(),
            usuario.getEstado(),
            usuario.getCedula(),
            usuario.getNombre(),
            usuario.getCorreo(),
            usuario.isActivo())) {
            
            response.sendRedirect("usuarios.jsp?mensaje=Usuario+creado+correctamente");
        } else {
            response.sendRedirect("usuarios.jsp?mensaje=Error+al+crear+el+usuario");
        }
    } else {
        response.sendRedirect("usuarios.jsp?mensaje=Datos+incompletos");
    }
%>>