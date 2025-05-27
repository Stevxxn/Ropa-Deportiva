<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.productos.negocio.*"%>
<%
    String mensaje = "";
    Product producto = new Product();

    String idStr = request.getParameter("id");
    if (idStr == null) {
        response.sendRedirect("productos.jsp");
        return;
    }
    int idProducto = Integer.parseInt(idStr);

    // Variables para formulario
    String nombre = "";
    int idCat = 0;
    int cantidad = 0;
    double precio = 0.0;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            nombre = request.getParameter("txtNombre");
            idCat = Integer.parseInt(request.getParameter("cmbCategoria"));
            cantidad = Integer.parseInt(request.getParameter("cantidad"));
            precio = Double.parseDouble(request.getParameter("precio"));

            mensaje = producto.actualizarProducto(idProducto, nombre, idCat, cantidad, precio);

            if (!mensaje.startsWith("❌")) {
                mensaje = "✔ Se ha actualizado el producto.";
            }

        } catch (Exception e) {
            mensaje = "❌ El producto: " + e.getMessage() + "No se puede actualizar.";
        }
    }

    if (!"POST".equalsIgnoreCase(request.getMethod()) || mensaje.startsWith("❌")) {
        Object[] datos = producto.obtenerProductoCompletoPorId(idProducto);
        if (datos != null) {
            nombre = (String) datos[0];
            idCat = (Integer) datos[1];
            cantidad = (Integer) datos[2];
            precio = (Double) datos[3];
        } else {
            response.sendRedirect("productos.jsp");
            return;
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
				                <div class="card-header bg-primary text-white">
				                    <h2 class="h4 mb-0">Actualizar Producto</h2>
				                </div>
				                
				                <div class="card-body">
				                    <% if (!mensaje.isEmpty()) { %>
				                        <div class="alert <%= mensaje.startsWith("❌") ? "alert-danger" : "alert-success" %>">
				                            <strong><%= mensaje %></strong>
				                        </div>
				                    <% } %>
				                    
				                    <form action="actualizar.jsp?id=<%= idProducto %>" method="post">
				                        <div class="mb-3">
				                            <label for="txtNombre" class="form-label">Nombre:</label>
				                            <input type="text" class="form-control" name="txtNombre" id="txtNombre" value="<%= nombre %>" required>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="Categoria" class="form-label" >Categoria</label>
											<select class="form-select" name="cmbCategoria">
											  <option selected>Seleccione una opción</option>
											  <option value="1">Jovenes</option>
											  <option value="2">Adultos</option>
											  <option value="3">Niños</option>
											</select>
				                        </div>
				                        
				                        <div class="row">
				                            <div class="col-md-6 mb-3">
				                                <label for="cantidad" class="form-label">Cantidad:</label>
				                                <input type="number" class="form-control" name="cantidad" id="cantidad" min="1" value="<%= cantidad %>" required>
				                            </div>
				                            
				                            <div class="col-md-6 mb-3">
				                                <label for="precio" class="form-label">Precio (USD):</label>
				                                <div class="input-group">
				                                    <span class="input-group-text">$</span>
				                                    <input type="number" class="form-control" name="precio" id="precio" step="0.01" min="0" value="<%= precio %>" required>
				                                </div>
				                            </div>
				                        </div>
				                        
				                        <div class="d-flex justify-content-between mt-4">
				                            <button type="submit" class="btn btn-primary">
				                                <i class="bi bi-check-circle"></i> Confirmar
				                            </button>
				                            <button type="button" class="btn btn-outline-secondary" onclick="window.location='productos.jsp'">
				                                <i class="bi bi-x-circle"></i> Cancelar
				                            </button>
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
