<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
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
			       <div class="container mt-5">
					    <div class="row justify-content-center">
					        <div class="col-md-6 col-lg-4">
					            <article class="card shadow-sm">
					                <div class="card-header bg-primary text-white">
					                    <h3 class="h4 mb-0 text-center">Ingresar al sistema</h3>
					                </div>
					                
					                <div class="card-body">
					                    <form action="validarLogin.jsp" method="post">
					                        <div class="mb-3">
					                            <label for="usuario" class="form-label">Correo electrónico <span class="text-danger">*</span></label>
					                            <input type="email" class="form-control" id="usuario" name="usuario" required>
					                        </div>
					                        
					                        <div class="mb-4">
					                            <label for="clave" class="form-label">Clave <span class="text-danger">*</span></label>
					                            <input type="password" class="form-control" id="clave" name="clave" required>
					                        </div>
					                        
					                        <div class="mb-3 form-text text-muted">
					                            <small>* Campos obligatorios</small>
					                        </div>
					                        
					                        <div class="d-grid gap-2 d-md-flex justify-content-md-between">
					                            <button type="submit" class="btn btn-primary me-md-2" id="btnEnviar">
					                                <i class="bi bi-box-arrow-in-right"></i> Enviar
					                            </button>
					                            <button type="reset" class="btn btn-outline-secondary" id="btnDelete">
					                                <i class="bi bi-eraser"></i> Borrar
					                            </button>
					                        </div>
					                    </form>
					                    
					                    <div class="text-center mt-3">
					                        <a href="registro.jsp" class="btn btn-link">¿No tienes cuenta? Regístrate aquí</a>
					                    </div>
					                </div>
					            </article>
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
