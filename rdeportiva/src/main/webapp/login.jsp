<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@page import="com.productos.seguridad.Usuario"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Activo Sportwear</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
    <main>
        <header>
            <h1>Activo Sportwear</h1>
            <h2 class="destacado">Moda deportiva para tu mejor versión</h2>
            <h4 id="favorito">Rinde más, luce mejor</h4>
            <div id="image"><img src="images/Logo.jpg" width="400" height="200" alt="Logo de Activo Sportwear"/></div>
        </header>
        
        <nav>
            <a href="index.jsp">Home</a>
            <a href="consulta.jsp">Ver Productos</a>
            <a href="categoria.jsp">Buscar Por Categoría</a>
        </nav>
        
        <div class="agrupar">
            <section> 
			    <div class="card-body">
				    <%-- Mensajes de error --%>
				    <% if(request.getParameter("error") != null) { %>
				        <div class="alert alert-danger mb-3">
				            <% 
				                String error = request.getParameter("error");
				                if("credenciales".equals(error)) {
				                    out.print("Usuario o contraseña incorrectos");
				                } else if("bloqueado".equals(error)) {
				                    out.print("Su cuenta está bloqueada. Contacte al administrador.");
				                } else if("perfil".equals(error)) {
				                    out.print("No tiene permisos para acceder.");
				                }
				            %>
				        </div>
				    <% } %>
				    
				    <form action="validarLogin.jsp" method="post">
				        <div class="mb-3">
				            <label for="usuario" class="form-label">Correo electrónico <span class="text-danger">*</span></label>
				            <input type="email" class="form-control" id="usuario" name="usuario" required>
				        </div>
				        
				        <div class="mb-3">
				            <label for="clave" class="form-label">Clave <span class="text-danger">*</span></label>
				            <input type="password" class="form-control" id="clave" name="clave" required>
				        </div>
				        
				        <div class="mb-3 form-text">
				            <small class="text-muted">* Campos obligatorios</small>
				        </div>
				        
				        <div class="d-grid gap-2">
				            <button type="submit" class="btn btn-primary" id="btnEnviar">
				                <i class="bi bi-box-arrow-in-right"></i> Iniciar sesión
				            </button>
				            <button type="reset" class="btn btn-outline-secondary" id="btnDelete">
				                <i class="bi bi-eraser"></i> Limpiar
				            </button>
				        </div>
				        
				        <!-- Nuevo: Enlace para registro -->
				        <div class="text-center mt-3 pt-2 border-top">
				            <p class="small">¿No tienes una cuenta? 
				                <a href="registro.jsp" class="text-primary">Regístrate aquí</a>
				            </p>
				        </div>
				    </form>
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
                    <img src="icons/facebook.png" width="30" height="30" alt="icono de facebook"/></a></li>
                <li><a href="https://www.instagram.com/_stevxxn/" target="_blank">
                    <img src="icons/instagram.png" width="30" height="30" alt="icono de instagram"/></a></li>
                <li><a href="https://www.tiktok.com/@_stevxxn" target="_blank">
                    <img src="icons/tik-tok.png" width="30" height="30" alt="icono de tiktok"/></a></li>
            </ul>
            <p><a href="https://maps.app.goo.gl/N1hiiY9HRbSv2oEz7" target="_blank">Ver nuestra ubicación en el mapa</a></br></p>
        </footer>
    </main>
</body>
</html>