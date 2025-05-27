<%@page import="com.productos.seguridad.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar sesión y perfil
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
    if(usuarioSesion == null || usuarioSesion.getPerfil() != 1) {
        response.sendRedirect("../login.jsp?mensaje=Acceso+denegado");
        return;
    }

    // Obtener usuario a editar
    int idUsuario = Integer.parseInt(request.getParameter("id"));
    Usuario usuarioEditar = null;
    List<Usuario> usuarios = Usuario.obtenerTodosUsuarios();
    
    for(Usuario u : usuarios) {
        if(u.getId() == idUsuario) {
            usuarioEditar = u;
            break;
        }
    }
    
    if(usuarioEditar == null) {
        response.sendRedirect("usuarios.jsp?mensaje=Usuario+no+encontrado");
        return;
    }
    
    // Procesar actualización
    if(request.getParameter("actualizar") != null) {
        usuarioEditar.setNombre(request.getParameter("nombre"));
        usuarioEditar.setCedula(request.getParameter("cedula"));
        usuarioEditar.setCorreo(request.getParameter("correo"));
        usuarioEditar.setPerfil(Integer.parseInt(request.getParameter("perfil")));
        usuarioEditar.setEstado(Integer.parseInt(request.getParameter("estadoCivil")));
        
        if(Usuario.actualizarUsuario(usuarioEditar)) {
            response.sendRedirect("usuarios.jsp?mensaje=Usuario+actualizado");
            return;
        } else {
            out.print("<p style='color:red;'>Error al actualizar usuario</p>");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Activo Sportwear</title>
    <link href="../css/estilos.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
    <main>
        <header>
            <h1>Activo Sportwear</h1>
            <h2 class="destacado">Moda deportiva para tu mejor versión</h2>
            <h4 id="favorito">Rinde más, luce mejor</h4>
            <div id="image"><img src="../images/Logo.jpg" width="400" height="200" alt="Logo de Activo Sportwear"/></div>
        </header>
        
        <nav>
            <a href="../index.jsp">Home</a>
            <a href="../consulta.jsp">Ver Productos</a>
            <a href="../categoria.jsp">Buscar Por Categoría</a>
        </nav>
        
        <div class="agrupar">
            <section> 
			    <div class="container mt-4">
				    <div class="row justify-content-center">
				        <div class="col-md-8 col-lg-6">
				            <div class="card shadow">
				                <div class="card-header bg-primary text-white">
				                    <h1 class="h4 mb-0">Editar Usuario</h1>
				                </div>
				                
				                <div class="card-body">
				                    <form method="post">
				                        <input type="hidden" name="actualizar" value="true">
				                        
				                        <div class="mb-3">
				                            <label for="nombre" class="form-label">Nombre:</label>
				                            <input type="text" class="form-control" id="nombre" name="nombre" 
				                                   value="<%= usuarioEditar.getNombre() %>" required>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="cedula" class="form-label">Cédula:</label>
				                            <input type="text" class="form-control" id="cedula" name="cedula" 
				                                   value="<%= usuarioEditar.getCedula() %>" required>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="correo" class="form-label">Correo:</label>
				                            <input type="email" class="form-control" id="correo" name="correo" 
				                                   value="<%= usuarioEditar.getCorreo() %>" required>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="perfil" class="form-label">Perfil:</label>
				                            <select class="form-select" id="perfil" name="perfil">
				                                <option value="1" <%= usuarioEditar.getPerfil() == 1 ? "selected" : "" %>>Administrador</option>
				                                <option value="2" <%= usuarioEditar.getPerfil() == 2 ? "selected" : "" %>>Cliente</option>
				                            </select>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="estadoCivil" class="form-label">Estado Civil:</label>
				                            <select class="form-select" id="estadoCivil" name="estadoCivil" required>
				                                <option value="1" <%= usuarioEditar.getEstado() == 1 ? "selected" : "" %>>Soltero/a</option>
				                                <option value="2" <%= usuarioEditar.getEstado() == 2 ? "selected" : "" %>>Casado/a</option>
				                                <option value="3" <%= usuarioEditar.getEstado() == 3 ? "selected" : "" %>>Divorciado/a</option>
				                                <option value="4" <%= usuarioEditar.getEstado() == 4 ? "selected" : "" %>>Viudo/a</option>
				                            </select>
				                        </div>
				                        
				                        <div class="d-flex justify-content-between mt-4">
				                            <button type="submit" class="btn btn-primary">
				                                <i class="bi bi-save"></i> Guardar Cambios
				                            </button>
				                            <a href="usuarios.jsp" class="btn btn-outline-secondary">
				                                <i class="bi bi-x-circle"></i> Cancelar
				                            </a>
				                        </div>
				                    </form>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</section>

            <aside>
                <a href="https://www.linkedin.com/in/steven-parra-02516b32b">Ver más información sobre los desarrolladores</a></br>
                <iframe src="https://www.google.com/maps/d/embed?mid=1EfbeRnJknOZ-F_WdFwZqUiwD3gqtczo&ehbc=2E312F" width="600" height="440"></iframe>
            </aside>
        </div>
        
        <footer>
            <ul>
                <li><a href="https://www.facebook.com/stevenalexis.bautistaleon/" target="_blank">
                    <img src="../icons/facebook.png" width="30" height="30" alt="icono de facebook"/></a></li>
                <li><a href="https://www.instagram.com/_stevxxn/" target="_blank">
                    <img src="../icons/instagram.png" width="30" height="30" alt="icono de instagram"/></a></li>
                <li><a href="https://www.tiktok.com/@_stevxxn" target="_blank">
                    <img src="../icons/tik-tok.png" width="30" height="30" alt="icono de tiktok"/></a></li>
            </ul>
            <p><a href="https://maps.app.goo.gl/N1hiiY9HRbSv2oEz7" target="_blank">Ver nuestra ubicación en el mapa</a></br></p>
        </footer>
    </main>
</body>
</html>