<%@ page import="com.productos.negocio.*, java.util.*" %>
<%
	//Obtener par�metros del formulario
	int idProducto = Integer.parseInt(request.getParameter("id"));
	String nombreProducto = request.getParameter("nombre");
	int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    // Obtener el producto de la base de datos
    Product producto = new Product().obtenerProducto(idProducto);
    
    // Verificar si el producto existe y hay suficiente stock
    if (producto == null) {
        response.sendRedirect("error.jsp?mensaje=El producto no existe");
        return;
    }
    
    if (cantidad > producto.getCantidad()) {
        response.sendRedirect("error.jsp?mensaje=No hay suficiente stock");
        return;
    }
    
    // Obtener o crear el carrito en la sesi�n
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }
    
    // Agregar el producto al carrito
    carrito.agregarItem(producto, cantidad);
    

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
            <h2 class="destacado">Moda deportiva para tu mejor versi�n</h2>
            <h4 id="favorito">Rinde m�s, luce mejor</h4>
            <div id="image"><img src="../images/Logo.jpg" width="400" height="200" alt="Logo de Activo Sportwear"/></div>
        </header>
        
        <nav>
            <a href="#" onclick="window.history.back(); return false;">Volver atr�s</a>
            <a href="menu.jsp">Men�</a>
            <a href="../cerrarSesion.jsp">Cerrar Sesion</a>
        </nav>
        
        <div class="agrupar">
            <section> 
			    <div class="container mt-5">
				    <div class="row justify-content-center">
				        <div class="col-md-8 col-lg-6">
				            <div class="card text-center border-success">
				                <div class="card-header bg-success text-white">
				                    <h2 class="h4 mb-0"><i class="bi bi-check-circle-fill"></i> �Producto agregado al carrito!</h2>
				                </div>
				                
				                <div class="card-body">
				                    <div class="alert alert-success" role="alert">
				                        <p class="mb-0">Has agregado <strong><%= cantidad %></strong> unidad(es) de <strong>"<%= nombreProducto %>"</strong> a tu carrito.</p>
				                    </div>
				                    
				                    <div class="d-flex justify-content-center gap-3 mt-4">
				                        <a href="mostrarProductos.jsp" class="btn btn-outline-primary">
				                            <i class="bi bi-arrow-left"></i> Seguir comprando
				                        </a>
				                        <a href="carrito.jsp" class="btn btn-primary">
				                            <i class="bi bi-cart-check"></i> Ver carrito
				                        </a>
				                    </div>
				                </div>
				                
				                <div class="card-footer text-muted">
				                    <small>�Necesitas ayuda? <a href="#">Cont�ctanos</a></small>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
    		</section>

            <aside>
                <a href="https://www.linkedin.com/in/steven-parra-02516b32b">Ver m�s informaci�n sobre los desarrolladores</a></br>
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
            <p><a href="https://maps.app.goo.gl/N1hiiY9HRbSv2oEz7" target="_blank">Ver nuestra ubicaci�n en el mapa</a></br></p>
        </footer>
    </main>
</body>
</html>