<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.productos.data.Conexion" %>

<%
    Product producto = new Product();
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
			    <h1>Nuestros Productos</h1>
    
			    <div class="container-fluid mt-4">
				    <div class="card shadow">
				        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
				            <h1 class="h4 mb-0">Nuestros Productos</h1>
				            <a href="carrito.jsp" class="btn btn-light btn-sm">
				                <i class="bi bi-cart"></i> Ver Carrito (<%= session.getAttribute("carrito") != null ? ((Carrito)session.getAttribute("carrito")).getItems().size() : 0 %>)
				            </a>
				        </div>
				        
				        <div class="card-body">
				            <div class="table-responsive">
				                <table class="table table-striped table-hover table-bordered">
				                    <thead class="table-dark">
				                        <tr>
				                            <th>ID</th>
				                            <th>Nombre</th>
				                            <th>Precio</th>
				                            <th>Disponibles</th>
				                            <th>Cantidad</th>
				                            <th class="text-center">Acciones</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <% 
				                            String sql = "SELECT * FROM tb_producto ORDER BY id_pr ASC";
				                            Conexion con = new Conexion();
				                            ResultSet rs = con.Consulta(sql);
				                            
				                            while(rs.next()) {
				                                int id = rs.getInt("id_pr");
				                                String nombre = rs.getString("nombre_pr");
				                                int cantidad = rs.getInt("cantidad_pr");
				                                double precio = rs.getDouble("precio_pr");
				                        %>
				                        <tr>
				                            <td><%= id %></td>
				                            <td><%= nombre %></td>
				                            <td>$<%= String.format("%.2f", precio) %></td>
				                            <td><%= cantidad %></td>
				                            <td>
				                                <form action="agregarAlCarrito.jsp" method="post" class="d-flex">
				                                    <input type="hidden" name="id" value="<%= id %>">
				                                    <input type="hidden" name="nombre" value="<%= nombre %>">
				                                    <input type="hidden" name="precio" value="<%= precio %>">
				                                    
				                                    <input type="number" name="cantidad" class="form-control form-control-sm" 
				                                           style="width: 80px;" min="1" max="<%= cantidad %>" value="1">
				                                </form>
				                            </td>
				                            <td class="text-center">
				                                <button type="submit" form="form-<%= id %>" class="btn btn-success btn-sm">
				                                    <i class="bi bi-cart-plus"></i> Agregar
				                                </button>
				                            </td>
				                        </tr>
				                        <% 
				                            }
				                            rs.close();
				                        %>
				                    </tbody>
				                </table>
				            </div>
				            
				            <div class="mt-3 text-end">
				                <a href="carrito.jsp" class="btn btn-primary">
				                    <i class="bi bi-cart-check"></i> Ver Carrito Completo
				                </a>
				            </div>
				        </div>
				    </div>
				</div>
				
				<!-- Script para manejar el formulario correctamente -->
				<script>
				// Asignar IDs únicos a cada formulario
				document.querySelectorAll('form').forEach((form, index) => {
				    form.id = 'form-' + form.querySelector('input[name="id"]').value;
				});
				</script>

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