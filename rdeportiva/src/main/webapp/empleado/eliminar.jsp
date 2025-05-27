<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.productos.negocio.*"%>
<%
    String mensaje = "";
    int idProducto = 0;
    String nombreProducto = "";
    String categoria = "";

    // Si llega por GET
    if (request.getParameter("id") != null) {
        idProducto = Integer.parseInt(request.getParameter("id"));
        Product pr = new Product();
        Object[] datos = pr.obtenerProductoPorId(idProducto);

        if (datos != null) {
            nombreProducto = (String) datos[0];
            categoria = (String) datos[1];
        } else {
            mensaje = "❌ Producto no encontrado.";
        }
    }

    // Si el usuario confirma la eliminación (POST)
    if (request.getParameter("confirmar") != null && request.getParameter("id") != null) {
        idProducto = Integer.parseInt(request.getParameter("id"));
        Product pr = new Product();
        mensaje = pr.eliminarProductoPorId(idProducto);
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
            <a href="cambioClave.jsp">Menú</a>
            <a href="productos.jsp">Administrar productos</a>
            <a href="clave.jsp">Cambiar Clave</a>
            <a href="../cerrarSesion.jsp">Cerrar Sesion</a>
        </nav>
        
        <div class="agrupar">
            <section>
                
				<div class="container mt-5">
				    <div class="row justify-content-center">
				        <div class="col-md-8">
				            <div class="card">
				                <div class="card-header bg-danger text-white">
				                    <h2 class="h4 mb-0">Eliminar Producto</h2>
				                </div>
				                
				                <div class="card-body">
				                    <% if (!mensaje.equals("")) { %>
				                        <div class="alert alert-success">
				                            <strong><%= mensaje %></strong>
				                        </div>
				                        <a href="productos.jsp" class="btn btn-primary">Volver a la lista de productos</a>
				                    
				                    <% } else if (nombreProducto != null && !nombreProducto.equals("")) { %>
				                        <div class="alert alert-warning">
				                            <p class="mb-0">¿Estás seguro de que deseas eliminar el siguiente producto?</p>
				                        </div>
				                        
				                        <div class="mb-4">
				                            <ul class="list-group">
				                                <li class="list-group-item"><strong>ID:</strong> <%= idProducto %></li>
				                                <li class="list-group-item"><strong>Nombre:</strong> <%= nombreProducto %></li>
				                                <li class="list-group-item"><strong>Categoría:</strong> <%= categoria %></li>
				                            </ul>
				                        </div>
				                        
				                        <form method="post" action="eliminar.jsp">
				                            <input type="hidden" name="id" value="<%= idProducto %>">
				                            <div class="d-flex gap-2">
				                                <button type="submit" name="confirmar" class="btn btn-danger">
				                                    <i class="bi bi-trash"></i> Sí, eliminar
				                                </button>
				                                <a href="productos.jsp" class="btn btn-secondary">Cancelar</a>
				                            </div>
				                        </form>
				                    
				                    <% } else { %>
				                        <div class="alert alert-danger">
				                            <p class="mb-0">No se ha especificado un producto válido para eliminar.</p>
				                        </div>
				                        <a href="productos.jsp" class="btn btn-primary">Volver</a>
				                    <% } %>
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