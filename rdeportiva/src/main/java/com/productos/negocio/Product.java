package com.productos.negocio;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.data.Conexion;

public class Product {
	private int id;
	private int id_cat;
	private String nombre;
	private int cantidad;
	private float precio;
	
	public Product() {
		super();
	}
	
	public Product(int id_cat, String nombre, int cantidad, float precio) {
		super();
		this.id_cat = id_cat;
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.precio = precio;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	
	public String consultarTodo() {
		
		String sql = "SELECT * FROM tb_producto ORDER BY id_pr";
		String tabla="<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		ResultSet rs = null;
		Conexion con = new Conexion();
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getInt(1)+"</td>"
				+ "<td>"+rs.getString(3)+"</td>"
				+ "<td>"+rs.getInt(4)+"</td>"
				+ "<td>$ "+rs.getDouble(5)+"</td>"
				+ "</td></tr>";
			
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.print(e.getMessage());
			}
			tabla+="</table>";
		return tabla;
	}	

	public String mostrarCategoria(){
		String combo="<select class=form-select name=cmbCategoria>";
		String sql="SELECT * FROM tb_categoria";
		ResultSet rs=null;
		Conexion con=new Conexion();
		try{
			rs=con.Consulta(sql);
			while(rs.next()){
				combo+="<option value="+rs.getInt(1)+ ">"+rs.getString(2)+"</option>";
			}
			combo+="</select>";
		}catch(SQLException e){
			System.out.print(e.getMessage());
		}
		return combo;
	}
	
	public String buscarProductoCategoria(int cat){
		String sentencia="SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table border=3>";
		try{
			rs=con.Consulta(sentencia);
			while(rs.next()){
				resultado+="<tr><td>"+ rs.getString(1)+"</td>"
				 + "<td>$ "+rs.getDouble(2)+"</td></tr>";
			}
			resultado+="</table>";
		}catch(SQLException e){
			System.out.print(e.getMessage());
		}
		System.out.print(resultado);
		return resultado;
	}
	
	public String reporteProducto() {
	    String sql = "select pr.id_pr, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr "
	               + "from tb_producto pr, tb_categoria cat where pr.id_cat=cat.id_cat";
	    Conexion con = new Conexion();
	    String tabla = "<table class='table'>"
	                 + "<thead>"
	                 + "    <tr>"
	                 + "        <th scope='col'>ID</th>"
	                 + "        <th scope='col'>Nombre</th>"
	                 + "        <th scope='col'>Categoria</th>"
	                 + "        <th scope='col'>Cantidad</th>"
	                 + "        <th scope='col'>Precio</th>"
	                 + "        <th scope='col'>Actualizar</th>"
	                 + "        <th scope='col'>Eliminar</th>"
	                 + "    </tr>"
	                 + "</thead>"
	                 + "<tbody>";
	    
	    ResultSet rs = null;
	    try {
	        rs = con.Consulta(sql);
	        while(rs.next()) {
	            tabla += "<tr>"
	                  + "    <th scope='row'>" + rs.getInt(1) + "</th>"
	                  + "    <td>" + rs.getString(2) + "</td>"
	                  + "    <td>" + rs.getString(3) + "</td>"
	                  + "    <td>" + rs.getInt(4) + "</td>"
	                  + "    <td>" + rs.getDouble(5) + "</td>"
	                  + "    <td><a href='actualizar.jsp?id=" + rs.getInt(1) + "'>Actualizar</a></td>"
	                  + "    <td><a href='eliminar.jsp?id=" + rs.getInt(1) + "'>Eliminar</a></td>"
	                  + "</tr>";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(e.getMessage());
	    }
	    tabla += "</tbody></table>";    
	    return tabla;
	}
	
	public String reporteAuditoria() {
	    String sql = "SELECT id_aud, tabla_aud, operacion_aud, valoranterior_aud, valornuevo_aud, fecha_aud, usuario_aud "
	               + "FROM auditoria.tb_auditoria ORDER BY id_aud DESC";
	    Conexion con = new Conexion();
	    String tabla = "<table class='table'>"
	                 + "<thead>"
	                 + "    <tr>"
	                 + "        <th scope='col'>ID</th>"
	                 + "        <th scope='col'>Tabla</th>"
	                 + "        <th scope='col'>Operación</th>"
	                 + "        <th scope='col'>Valor Anterior</th>"
	                 + "        <th scope='col'>Valor Nuevo</th>"
	                 + "        <th scope='col'>Fecha</th>"
	                 + "        <th scope='col'>Usuario</th>"
	                 + "    </tr>"
	                 + "</thead>"
	                 + "<tbody>";
	    
	    ResultSet rs = null;
	    try {
	        rs = con.Consulta(sql);
	        while(rs.next()) {
	            tabla += "<tr>"
	                  + "    <th scope='row'>" + rs.getInt(1) + "</th>"
	                  + "    <td>" + (rs.getString(2) != null ? rs.getString(2) : "N/A") + "</td>"
	                  + "    <td>" + (rs.getString(3) != null ? rs.getString(3) : "N/A") + "</td>"
	                  + "    <td>" + (rs.getString(4) != null ? rs.getString(4) : "N/A") + "</td>"
	                  + "    <td>" + (rs.getString(5) != null ? rs.getString(5) : "N/A") + "</td>"
	                  + "    <td>" + (rs.getDate(6) != null ? rs.getDate(6).toString() : "N/A") + "</td>"
	                  + "    <td>" + (rs.getString(7) != null ? rs.getString(7) : "N/A") + "</td>"
	                  + "</tr>";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(e.getMessage());
	    }
	    
	    tabla += "</tbody></table>";    
	    return tabla;
	}
	
	public String eliminarProductoPorId(int id) {
        String sql = "DELETE FROM tb_producto WHERE id_pr = " + id;
        Conexion con = new Conexion();
        return con.Ejecutar(sql);
    }

    public Object[] obtenerProductoPorId(int id) {
        String sql = "SELECT pr.nombre_pr, cat.descripcion_cat " +
                     "FROM tb_producto pr, tb_categoria cat " +
                     "WHERE pr.id_cat = cat.id_cat AND pr.id_pr = " + id;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);
        try {
            if (rs.next()) {
                return new Object[]{ rs.getString(1), rs.getString(2) };
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
	
	public String agregarProducto ()
    {
    	String sqlSetVal = "SELECT setval(pg_get_serial_sequence('td_producto', 'id_pr'), (SELECT MAX(id_pr) FROM tb_producto))";

    	try (Connection con = new Conexion().getConexion();
    	     PreparedStatement ps = con.prepareStatement(sqlSetVal)) {
    	    ps.execute();
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	}

    	String result = "";
    	Conexion con = new Conexion ();
    	PreparedStatement pr = null;
    	String sql = "INSERT INTO tb_producto (id_cat, nombre_pr, cantidad_pr, precio_pr)\n"
    			+ "VALUES (?, ?, ?, ?);";
    	try
    	{
    		pr = con.getConexion().prepareStatement(sql);
    		pr.setInt(1, this.getId_cat());
    		pr.setString(2, this.getNombre());
    		pr.setInt(3, this.getCantidad());
    		pr.setDouble(4, this.getPrecio());
    		
    		if (pr.executeUpdate() == 1)
    		{
    			result = "Inserción Correcta";
    		}
    		else
    		{
    			result = "Error en la inserción";
    		}
    	} catch (Exception ex) {
	        result = ex.getMessage();
	        System.out.print(result);
	    } finally {
	        try {
	            pr.close();
	            con.getConexion().close();
	        } catch (Exception ex) {
	            System.out.print(ex.getMessage());
	        }
	    }
	    return result;
    }
	public String actualizarProducto(int id, String nombre, int idCategoria, int cantidad, double precio) {
        String sql = "UPDATE tb_producto SET "
                   + "nombre_pr = '" + nombre + "', "
                   + "id_cat = " + idCategoria + ", "
                   + "cantidad_pr = " + cantidad + ", "
                   + "precio_pr = " + precio + " "
                   + "WHERE id_pr = " + id;
        Conexion con = new Conexion();
        return con.Ejecutar(sql);
    }
    public Object[] obtenerProductoCompletoPorId(int id) {
        String sql = "SELECT nombre_pr, id_cat, cantidad_pr, precio_pr FROM tb_producto WHERE id_pr = " + id;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);
        try {
            if (rs.next()) {
                return new Object[]{
                    rs.getString("nombre_pr"),
                    rs.getInt("id_cat"),
                    rs.getInt("cantidad_pr"),
                    rs.getDouble("precio_pr")
                };
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}