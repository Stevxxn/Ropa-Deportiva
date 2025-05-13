<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="consulta.jsp">Ver Todos Nuestros Productos</a>
            <a href="categoria.jsp">Buscar Por Categoría</a>
            <a href="login.jsp">Login</a>
        </nav>
        
        <div class="agrupar">
            <section>
                <h3>Registro de usuarios vendedores y administradores</h3>
			    <form action="nuevoUsuario.jsp" method="post">
			    <table border="1">
			    	<tr><td colspan="2">*campo obligatorio</td></tr>
			    	<tr><td>Nombre y Apellidos:</td><td><input type="text" name="txtNombre" id="Nombre" required/>*campo obligatorio</td></tr>
			    	<tr><td>Cédula:</td><td><input type="text" name="txtCedula" id="Cedula" maxlength="10" required/>*campo obligatorio</td></tr>
			    	<tr><td>
			    		Tipo de Perfil:</td>
			    		<td>
			    		<select name="cmbPerfil" id="cmbPerfil">
                			<option value="1">Administrador</option>
                			<option value="3">Vendedor</option>
			    		</select>
			    	</td></tr>
			    	<tr><td>Estado Civil:</td>
			    		<td><select name="cmbECivil" id="cmbECivil">
			    			<option value="2">Soltero</option>
			    			<option value="1">Casado</option>
			    			<option value="3">Divorciado</option>
			    			<option value="4">Viudo</option>
			    		</select></td></tr>
			    	<tr><td>Correo:</td><td><input type="email" id="Email" name="email" placeholder="usuario@nombreProveedor.dominio" required/>*campo obligatorio</td></tr>
			    	
			    	<tr><td><input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar Registro"/></td>
			    	<td><input type="reset" name="btnBorrar" id="btnBorrar" value="Borrar Registro"></td></tr>
			    </table>
				</form>
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
