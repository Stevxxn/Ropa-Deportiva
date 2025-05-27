<%@page import="com.productos.seguridad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar sesión y perfil
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
    if(usuarioSesion == null || usuarioSesion.getPerfil() != 1) {
        response.sendRedirect("../login.jsp?mensaje=Acceso+denegado");
        return;
    }

    // Procesar nuevo usuario
    if(request.getParameter("guardar") != null) {
        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setNombre(request.getParameter("nombre"));
        nuevoUsuario.setCedula(request.getParameter("cedula"));
        nuevoUsuario.setCorreo(request.getParameter("correo"));
        nuevoUsuario.setClave(request.getParameter("clave"));
        nuevoUsuario.setPerfil(Integer.parseInt(request.getParameter("perfil")));
        nuevoUsuario.setEstado(Integer.parseInt(request.getParameter("estadoCivil")));
        nuevoUsuario.setActivo(true); // Asumimos que el usuario está activo al crearlo
        if(nuevoUsuario.ingresarEmpleado(
            nuevoUsuario.getPerfil(),
            nuevoUsuario.getEstado(),
            nuevoUsuario.getCedula(),
            nuevoUsuario.getNombre(),
            nuevoUsuario.getCorreo(),
            nuevoUsuario.isActivo())) {
            
            response.sendRedirect("usuarios.jsp?mensaje=Usuario+creado+exitosamente");
            return;
        } else {
            out.print("<p style='color:red;'>Error al crear usuario</p>");
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
        	<a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
            <a href="bitacora.jsp">Bitacora</a>
            <a href="../cerrarSesion.jsp">Cerrar Sesion</a>
        </nav>
        
        <div class="agrupar">
            <section> 
			    <h1>Agregar Nuevo Usuario</h1>
			    <div class="container mt-4">
				    <div class="row justify-content-center">
				        <div class="col-md-8 col-lg-6">
				            <div class="card shadow">
				                <div class="card-header bg-primary text-white">
				                    <h4 class="mb-0">Registro de Usuario</h4>
				                </div>
				                
				                <div class="card-body">
				                    <form method="post" action="guardarUsuario.jsp">
				                        <input type="hidden" name="guardar" value="true">
				                        
				                        <div class="row">
				                            <div class="col-md-6 mb-3">
				                                <label for="nombre" class="form-label">Nombre:</label>
				                                <input type="text" class="form-control" id="nombre" name="nombre" required>
				                            </div>
				                            
				                            <div class="col-md-6 mb-3">
				                                <label for="cedula" class="form-label">Cédula:</label>
				                                <input type="text" class="form-control" id="cedula" name="cedula" required>
				                            </div>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="correo" class="form-label">Correo electrónico:</label>
				                            <input type="email" class="form-control" id="correo" name="correo" required>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="clave" class="form-label">Contraseña:</label>
				                            <input type="password" class="form-control" id="clave" name="clave" required>
				                        </div>
				                        
				                        <div class="row">
				                            <div class="col-md-6 mb-3">
				                                <label for="perfil" class="form-label">Perfil:</label>
				                                <select class="form-select" id="perfil" name="perfil">
				                                    <option value="1">Administrador</option>
				                                    <option value="2" selected>Cliente</option>
				                                </select>
				                            </div>
				                            
				                            <div class="col-md-6 mb-3">
				                                <label for="estadoCivil" class="form-label">Estado Civil:</label>
				                                <select class="form-select" id="estadoCivil" name="estadoCivil" required>
				                                    <option value="1">Soltero/a</option>
				                                    <option value="2">Casado/a</option>
				                                    <option value="3">Divorciado/a</option>
				                                    <option value="4">Viudo/a</option>
				                                </select>
				                            </div>
				                        </div>
				                        
				                        <div class="d-flex justify-content-between mt-4">
				                            <button type="submit" class="btn btn-primary">
				                                <i class="bi bi-save"></i> Guardar
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