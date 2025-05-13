package com.productos.negocio;
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
		String combo="<select name=cmbCategoria>";
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
	
}