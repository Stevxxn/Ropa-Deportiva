<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.util.*, java.text.*" %>
<%
    List<Compra> historial = (List<Compra>) session.getAttribute("historialCompras");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
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
			    <h2>Historial de Compras</h2>
    
			    <% if (historial == null || historial.isEmpty()) { %>
			        <p>No has realizado ninguna compra aún.</p>
			    <% } else { %>
			        <% for (Compra compra : historial) { %>
			        <div style="margin-bottom: 20px;">
			            <table>
			                <tr class="compra-header">
			                    <th colspan="4">
			                        Compra realizada el: <%= sdf.format(compra.getFecha()) %> | 
			                        Estado: <%= compra.getEstado() %> | 
			                        Total: $<%= String.format("%.2f", compra.getTotal()) %>
			                    </th>
			                </tr>
			                <tr>
			                    <th>Producto</th>
			                    <th>Precio Unitario</th>
			                    <th>Cantidad</th>
			                    <th>Subtotal</th>
			                </tr>
			                <% for (ItemCarrito item : compra.getItems()) { %>
			                <tr>
			                    <td><%= item.getProducto().getNombre() %></td>
			                    <td>$<%= String.format("%.2f", item.getProducto().getPrecio()) %></td>
			                    <td><%= item.getCantidad() %></td>
			                    <td>$<%= String.format("%.2f", item.getProducto().getPrecio() * item.getCantidad()) %></td>
			                </tr>
			                <% } %>
			            </table>
			        </div>
			        <% } %>
			    <% } %>
			    
			    <br>
			    <a href="consulta.jsp">Volver a la tienda</a>
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