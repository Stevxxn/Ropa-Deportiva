<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Activo Sportwear</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
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
		       <article>
		       		<h3>Ingresar al sistema</h3>
				<form action="validarLogin.jsp" method="post">
			        <table border="1">
			            <tr>
			                <td>Correo electrónico</td>
			                <td><input type="text"name = "usuario" required />*</td>
			            </tr>
			            <tr>
			                <td>Clave</td>
			                <td><input type="password" id="clave"  name="clave" required/>*</td>
			            </tr>
			            <tr>
			                <td colspan="2">*campo obligatorio</td> <!-- Para colapsar dos columnas-->
			            </tr>
			            <tr> <td><input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar"/></td>
			            <td><input type="reset" name="btnDelete" id="btnDelete" value="Borrar"/></td></tr>
			        </table>
			    </form>
		        	<a href="registro.jsp">Registrarse</a>
		       </article>
               
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
