<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.text.NumberFormat" %>
<%
    // Obtener información de la última compra si es necesario
    Carrito carrito = (Carrito) session.getAttribute("carrito");
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
			    <div class="container py-5">
			        <div class="row justify-content-center">
			            <div class="col-lg-8">
			                <div class="card confirmation-card mb-4">
			                    <div class="card-header confirmation-header text-center py-4">
			                        <i class="bi bi-check-circle check-icon"></i>
			                        <h2 class="mt-3 mb-0">¡Gracias por tu compra!</h2>
			                    </div>
			                    <div class="card-body p-5">
			                        <div class="text-center mb-4">
			                            <p class="lead">Tu pedido ha sido procesado exitosamente.</p>
			                            <p>Hemos enviado los detalles de tu compra al correo electrónico registrado.</p>
			                        </div>
			                        
			                        <% if (carrito != null && !carrito.getItems().isEmpty()) { %>
			                        <div class="mt-4">
			                            <h5 class="mb-3"><i class="bi bi-receipt"></i> Resumen de tu compra</h5>
			                            <div class="bg-light p-3 rounded-3">
			                                <% for (ItemCarrito item : carrito.getItems()) { %>
			                                <div class="d-flex justify-content-between summary-item">
			                                    <span><%= item.getProducto().getNombre() %> x <%= item.getCantidad() %></span>
			                                    <strong><%= formatoMoneda.format(item.getProducto().getPrecio() * item.getCantidad()) %></strong>
			                                </div>
			                                <% } %>
			                                <div class="d-flex justify-content-between mt-3 pt-2">
			                                    <span class="fw-bold">Total:</span>
			                                    <span class="fw-bold fs-5 text-success"><%= formatoMoneda.format(carrito.getTotal()) %></span>
			                                </div>
			                            </div>
			                        </div>
			                        <% } %>
			                        
			                        <div class="d-flex flex-column flex-md-row justify-content-center gap-3 mt-5 pt-3">
			                            <a href="historial.jsp" class="btn btn-outline-primary action-btn">
			                                <i class="bi bi-clock-history"></i> Ver Historial de Compras
			                            </a>
			                            <a href="consulta.jsp" class="btn btn-success action-btn">
			                                <i class="bi bi-cart-plus"></i> Continuar Comprando
			                            </a>
			                        </div>
			                        
			                        <div class="text-center mt-4 pt-3">
			                            <p class="text-muted small">
			                                <i class="bi bi-info-circle"></i> ¿Necesitas ayuda? 
			                                <a href="contacto.jsp">Contáctanos</a> y con gusto te atenderemos.
			                            </p>
			                        </div>
			                    </div>
			                </div>
			                
			                <div class="text-center">
			                    <a href="index.jsp" class="text-decoration-none">
			                        <i class="bi bi-arrow-left"></i> Volver al inicio
			                    </a>
			                </div>
			            </div>
			        </div>
			    </div>
			
			    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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