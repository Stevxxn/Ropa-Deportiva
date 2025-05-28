<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.util.*, java.text.NumberFormat" %>
<%
    // Obtener el carrito de la sesión o crear uno nuevo
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }
    
    // Procesar acciones (agregar, eliminar, actualizar)
    String action = request.getParameter("action");
    if (action != null) {
        int idProducto = Integer.parseInt(request.getParameter("id"));
        Product product = new Product().obtenerProducto(idProducto);
        
        switch(action) {
            case "add":
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.agregarItem(product, cantidad);
                break;
            case "remove":
                carrito.eliminarItem(idProducto);
                break;
            case "update":
                int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.actualizarCantidad(idProducto, nuevaCantidad);
                break;
        }
    }
    
    // Formateador para moneda
    NumberFormat formatoMoneda = NumberFormat.getCurrencyInstance();
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
			    <h2>Tu Carrito de Compras</h2>
    
			    <div class="container mt-4">
			    <% if (carrito.getItems().isEmpty()) { %>
			        <div class="card text-center py-5">
			            <div class="card-body">
			                <i class="bi bi-cart-x text-muted" style="font-size: 3rem;"></i>
			                <h3 class="h4 mt-3">Tu carrito está vacío</h3>
			                <p class="text-muted">Agrega productos para comenzar tu compra</p>
			                <a href="mostrarProductos.jsp" class="btn btn-primary mt-3">
			                    <i class="bi bi-bag"></i> Ver Productos
			                </a>
			            </div>
			        </div>
			    <% } else { %>
			        <div class="card shadow">
			            <div class="card-header bg-light">
			                <h3 class="h5 mb-0">Mi Carrito</h3>
			            </div>
			            
			            <div class="card-body">
			                <div class="table-responsive">
			                    <table class="table">
			                        <thead class="table-light">
			                            <tr>
			                                <th>Producto</th>
			                                <th class="text-end">Precio Unitario</th>
			                                <th class="text-center">Cantidad</th>
			                                <th class="text-end">Subtotal</th>
			                                <th class="text-center">Acciones</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <% for (ItemCarrito item : carrito.getItems()) { 
			                                Product producto = item.getProducto();
			                                double subtotal = producto.getPrecio() * item.getCantidad();
			                            %>
			                            <tr>
			                                <td><%= producto.getNombre() %></td>
			                                <td class="text-end"><%= formatoMoneda.format(producto.getPrecio()) %></td>
			                                <td class="text-center">
			                                    <form method="post" action="carrito.jsp" class="d-flex justify-content-center gap-2">
			                                        <input type="hidden" name="action" value="update">
			                                        <input type="hidden" name="id" value="<%= producto.getId() %>">
			                                        <input type="number" name="cantidad" value="<%= item.getCantidad() %>" 
			                                               min="1" max="<%= producto.getCantidad() %>" 
			                                               class="form-control form-control-sm text-center" style="width: 70px;">
			                                        <button type="submit" class="btn btn-sm btn-outline-primary">
			                                            <i class="bi bi-arrow-clockwise"></i>
			                                        </button>
			                                    </form>
			                                </td>
			                                <td class="text-end"><%= formatoMoneda.format(subtotal) %></td>
			                                <td class="text-center">
			                                    <a href="carrito.jsp?action=remove&id=<%= producto.getId() %>" 
			                                       class="btn btn-sm btn-outline-danger">
			                                        <i class="bi bi-trash"></i>
			                                    </a>
			                                </td>
			                            </tr>
			                            <% } %>
			                            <tr class="table-active">
			                                <td colspan="3" class="text-end"><strong>Total a Pagar</strong></td>
			                                <td class="text-end"><strong><%= formatoMoneda.format(carrito.getTotal()) %></strong></td>
			                                <td></td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			                
			                <div class="d-flex justify-content-between mt-4">
			                    <a href="mostrarProductos.jsp" class="btn btn-outline-secondary">
			                        <i class="bi bi-arrow-left"></i> Seguir Comprando
			                    </a>
			                    <a href="checkout.jsp" class="btn btn-success">
			                        <i class="bi bi-credit-card"></i> Proceder al Pago
			                    </a>
			                </div>
			            </div>
			        </div>
			    <% } %>
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