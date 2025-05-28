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
                <div class="container mt-4">
				    <div class="card shadow">
				        <div class="card-header bg-primary text-white">
				            <h3 class="h5 mb-0"><i class="bi bi-person-plus"></i> Registro de Nuevos Clientes</h3>
				        </div>
				        
				        <div class="card-body">
				            <form action="respuesta.jsp" method="post" enctype="multipart/form-data">
				                <div class="table-responsive">
				                    <table class="table table-borderless">
				                        <tbody>
				                            <!-- Fila de información obligatoria -->
				                            <tr class="table-light">
				                                <td colspan="2" class="text-muted small">
				                                    <i class="bi bi-exclamation-circle"></i> Campos marcados con <span class="text-danger">*</span> son obligatorios
				                                </td>
				                            </tr>
				                            
				                            <!-- Nombre -->
				                            <tr>
				                                <th class="text-end align-middle" style="width: 30%">
				                                    <label for="Nombre" class="form-label mb-0">Nombre <span class="text-danger">*</span></label>
				                                </th>
				                                <td>
				                                    <input type="text" class="form-control" id="Nombre" name="txtNombre" required>
				                                </td>
				                            </tr>
				                            
				                            <!-- Cédula -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label for="Cedula" class="form-label mb-0">Cédula <span class="text-danger">*</span></label>
				                                </th>
				                                <td>
				                                    <div class="input-group">
				                                        <input type="text" class="form-control" id="Cedula" name="txtCedula" maxlength="10" required>
				                                        <button class="btn btn-outline-secondary" type="button" id="btn-validar-cedula">
				                                            <i class="bi bi-check-circle"></i> Validar
				                                        </button>
				                                    </div>
				                                </td>
				                            </tr>
				                            
				                            <!-- Estado Civil -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label for="cmbECivil" class="form-label mb-0">Estado Civil</label>
				                                </th>
				                                <td>
				                                    <select class="form-select" id="cmbECivil" name="cmbECivil">
				                                        <option value="2">Soltero/a</option>
				                                        <option value="1">Casado/a</option>
				                                        <option value="3">Divorciado/a</option>
				                                        <option value="4">Viudo/a</option>
				                                    </select>
				                                </td>
				                            </tr>
				                            
				                            <!-- Lugar Residencia -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label class="form-label mb-0">Lugar Residencia</label>
				                                </th>
				                                <td>
				                                    <div class="d-flex flex-wrap gap-3">
				                                        <div class="form-check">
				                                            <input class="form-check-input" type="radio" name="rdResidencia" id="residenciaSur" value="Sur">
				                                            <label class="form-check-label" for="residenciaSur">Sur</label>
				                                        </div>
				                                        <div class="form-check">
				                                            <input class="form-check-input" type="radio" name="rdResidencia" id="residenciaNorte" value="Norte">
				                                            <label class="form-check-label" for="residenciaNorte">Norte</label>
				                                        </div>
				                                        <div class="form-check">
				                                            <input class="form-check-input" type="radio" name="rdResidencia" id="residenciaCentro" value="Centro">
				                                            <label class="form-check-label" for="residenciaCentro">Centro</label>
				                                        </div>
				                                    </div>
				                                </td>
				                            </tr>
				                            
				                            <!-- Foto -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label for="foto" class="form-label mb-0">Foto</label>
				                                </th>
				                                <td>
				                                    <input type="file" class="form-control" id="foto" name="fileFoto" accept=".jpg, .jpeg, .png">
				                                    <div class="form-text">Formatos aceptados: JPG, JPEG, PNG</div>
				                                    <img id="photoPreview" class="img-thumbnail mt-2" src="#" alt="Vista previa" style="max-width: 100px; display: none;">
				                                </td>
				                            </tr>
				                            
				                            <!-- Fecha Nacimiento -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label for="fecha" class="form-label mb-0">Fecha Nacimiento</label>
				                                </th>
				                                <td>
				                                    <input type="month" class="form-control" id="fecha" name="fecha">
				                                </td>
				                            </tr>
				                            
				                            <!-- Color Favorito -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label for="Color" class="form-label mb-0">Color Favorito</label>
				                                </th>
				                                <td>
				                                    <input type="color" class="form-control form-control-color" id="Color" name="color" value="#0d6efd">
				                                </td>
				                            </tr>
				                            
				                            <!-- Correo -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label for="Email" class="form-label mb-0">Correo <span class="text-danger">*</span></label>
				                                </th>
				                                <td>
				                                    <input type="email" class="form-control" id="Email" name="email" placeholder="usuario@ejemplo.com" required>
				                                </td>
				                            </tr>
				                            
				                            <!-- Clave -->
				                            <tr>
				                                <th class="text-end align-middle">
				                                    <label for="Clave" class="form-label mb-0">Clave <span class="text-danger">*</span></label>
				                                </th>
				                                <td>
				                                    <div class="input-group">
				                                        <input type="password" class="form-control" id="Clave" name="clave" required>
				                                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
				                                            <i class="bi bi-eye"></i>
				                                        </button>
				                                    </div>
				                                </td>
				                            </tr>
				                            
				                            <!-- Botones -->
				                            <tr>
				                                <td></td>
				                                <td class="pt-4">
				                                    <div class="d-flex justify-content-end gap-3">
				                                        <button type="reset" class="btn btn-outline-secondary">
				                                            <i class="bi bi-x-circle"></i> Limpiar
				                                        </button>
				                                        <button type="submit" class="btn btn-primary">
				                                            <i class="bi bi-send-check"></i> Registrar
				                                        </button>
				                                    </div>
				                                </td>
				                            </tr>
				                        </tbody>
				                    </table>
				                </div>
				            </form>
				        </div>
				    </div>
				</div>
				
				<!-- Scripts para funcionalidad -->
				<script>
				    // Mostrar/ocultar contraseña
				    document.getElementById('togglePassword').addEventListener('click', function() {
				        const passwordInput = document.getElementById('Clave');
				        const icon = this.querySelector('i');
				        if (passwordInput.type === 'password') {
				            passwordInput.type = 'text';
				            icon.classList.remove('bi-eye');
				            icon.classList.add('bi-eye-slash');
				        } else {
				            passwordInput.type = 'password';
				            icon.classList.remove('bi-eye-slash');
				            icon.classList.add('bi-eye');
				        }
				    });
				    
				    // Vista previa de foto
				    document.getElementById('foto').addEventListener('change', function(e) {
				        const preview = document.getElementById('photoPreview');
				        const file = e.target.files[0];
				        if (file) {
				            const reader = new FileReader();
				            reader.onload = function(e) {
				                preview.style.display = 'block';
				                preview.src = e.target.result;
				            }
				            reader.readAsDataURL(file);
				        }
				    });
				    
				    // Validación de cédula (simulada)
				    document.getElementById('btn-validar-cedula').addEventListener('click', function() {
				        const cedula = document.getElementById('Cedula').value;
				        if (cedula.length === 10) {
				            alert('Cédula válida (simulación)');
				        } else {
				            alert('La cédula debe tener 10 dígitos');
				        }
				    });
				</script>
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
