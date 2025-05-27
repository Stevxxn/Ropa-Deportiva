<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.productos.seguridad.Usuario" import ="java.util.*"%>
<%
    // Verificar si el usuario es administrador
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
    if(usuarioSesion == null || usuarioSesion.getPerfil() != 1) {
        response.sendRedirect("login.jsp?mensaje=Acceso+denegado");
        return;
    }

    // Procesar acciones
    String accion = request.getParameter("accion");
    if(accion != null) {
        switch(accion) {
            case "cambiarEstado":
                int idUsuario = Integer.parseInt(request.getParameter("id"));
                boolean nuevoEstado = request.getParameter("estado").equals("activar");
                Usuario.cambiarEstadoUsuario(idUsuario, nuevoEstado);
                break;
                
            case "eliminar":
                // Implementar eliminación si es necesario
                break;
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
            <a href="bitacora.jsp">Bitacora</a>
            <a href="../cerrarSesion.jsp">Cerrar Sesion</a>
        </nav>
        
        <div class="agrupar">
            <div class="container-fluid mt-4">
			    <div class="card shadow">
			        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
			            <h1 class="h4 mb-0">Gestión de Usuarios</h1>
			            <a href="nuevoUsuario.jsp" class="btn btn-light btn-sm">
			                <i class="bi bi-plus-circle"></i> Agregar Nuevo Usuario
			            </a>
			        </div>
			        
			        <div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-hover table-bordered">
			                    <thead class="table-dark">
			                        <tr>
			                            <th>ID</th>
			                            <th>Nombre</th>
			                            <th>Cédula</th>
			                            <th>Correo</th>
			                            <th>Perfil</th>
			                            <th>Estado</th>
			                            <th class="text-center">Acciones</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <% 
			                            List<Usuario> usuarios = Usuario.obtenerTodosUsuarios();
			                            for(Usuario usuario : usuarios) {
			                        %>
			                        <tr>
			                            <td><%= usuario.getId() %></td>
			                            <td><%= usuario.getNombre() %></td>
			                            <td><%= usuario.getCedula() %></td>
			                            <td><%= usuario.getCorreo() %></td>
			                            <td>
			                                <span class="badge 
			                                    <% switch(usuario.getPerfil()) {
			                                        case 1: out.print("bg-danger"); break;
			                                        case 2: out.print("bg-success"); break;
			                                        case 3: out.print("bg-warning text-dark"); break;
			                                        default: out.print("bg-secondary");
			                                    } %>">
			                                    <% 
			                                        switch(usuario.getPerfil()) {
			                                            case 1: out.print("Admin"); break;
			                                            case 2: out.print("Cliente"); break;
			                                            case 3: out.print("Empleado"); break;
			                                            default: out.print("Desconocido");
			                                        }
			                                    %>
			                                </span>
			                            </td>
			                            <td>
			                                <span class="badge <%= usuario.isActivo() ? "bg-success" : "bg-secondary" %>">
			                                    <%= usuario.isActivo() ? "Activo" : "Inactivo" %>
			                                </span>
			                            </td>
			                            <td class="text-center">
			                                <div class="btn-group btn-group-sm" role="group">
			                                    <% if(usuario.isActivo()) { %>
			                                        <a href="usuarios.jsp?accion=cambiarEstado&id=<%= usuario.getId() %>&estado=bloquear" 
			                                           class="btn btn-outline-danger" title="Bloquear">
			                                            <i class="bi bi-lock"></i>
			                                        </a>
			                                    <% } else { %>
			                                        <a href="usuarios.jsp?accion=cambiarEstado&id=<%= usuario.getId() %>&estado=activar" 
			                                           class="btn btn-outline-success" title="Activar">
			                                            <i class="bi bi-unlock"></i>
			                                        </a>
			                                    <% } %>
			                                    <a href="editarUsuario.jsp?id=<%= usuario.getId() %>" 
			                                       class="btn btn-outline-primary" title="Editar">
			                                        <i class="bi bi-pencil-square"></i>
			                                    </a>
			                                </div>
			                            </td>
			                        </tr>
			                        <% } %>
			                    </tbody>
			                </table>
			            </div>
			            
			            <div class="mt-3 text-end">
			                <a href="menuAdministrador.jsp" class="btn btn-secondary">
			                    <i class="bi bi-arrow-left"></i> Volver al Menú
			                </a>
			            </div>
			        </div>
			    </div>
			</div>
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