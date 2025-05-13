package com.productos.seguridad;

import java.sql.*;

import com.productos.data.Conexion;

public class Usuario {
	private int id;
	private Integer perfil;
	private int estadoCivil;
	private String cedula;
	private String nombre;
	private String correo;
	private String clave;
	
	public Usuario() {
	
	}
	
	public Usuario(Integer perfil, int estadoCivil, String cedula, String nombre, String correo, String clave) {
		super();
		this.perfil = perfil;
		this.estadoCivil = estadoCivil;
		this.cedula = cedula;
		this.nombre = nombre;
		this.correo = correo;
		this.clave = clave;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getCedula() {
		return cedula;
	}
	
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	
	public int getEstado() {
		return estadoCivil;
	}
	
	public void setEstado(int estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	
	public String getCorreo() {
		return correo;
	}
	
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
	public String getClave() {
		return clave;
	}
	
	public void setClave(String clave) {
		this.clave = clave;
	}
	
	public Integer getPerfil() {
		return perfil;
	}
	
	public void setPerfil(Integer perfil) {
		this.perfil = perfil;
	}
	
	public boolean verificarUsuario(String ncorreo, String nclave){
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuario where correo_us='"+ncorreo+
		"' and clave_us='"+nclave+"';";
		//System.out.print(sentencia);
		try{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next()){
				respuesta=true;
				this.setCorreo(ncorreo);
				this.setClave(nclave);
				this.setPerfil(rs.getInt(2));
				this.setNombre(rs.getString(4));
			}else{
				respuesta=false;
				rs.close();
			}
		}
			catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
			return respuesta;
	}
	
	public String ingresarCliente()
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_per, id_est, nombre_us,"
		+ "cedula_us,correo_us,clave_us) "
		+ "VALUES(?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,2);
			pr.setInt(2, this.getEstado());
			pr.setString(3, this.getNombre());
			pr.setString(4, this.getCedula());
			pr.setString(5, this.getCorreo());
			pr.setString(6, this.getClave());
			if(pr.executeUpdate()==1){
				result="Insercion correcta";
			}else{
				result="Error en insercion";
			}
		}catch(Exception ex){
			result=ex.getMessage();
			System.out.print(result);
		}finally{
			try{
				pr.close();
			 	con.getConexion().close();
			}catch(Exception ex){
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}
	
	public Usuario buscarUsuario(String nombre) {
		Usuario usuario = null;
		String sql = "SELECT * FROM tb_usuario WHERE nombre_us = ?";
		Conexion con = new Conexion();
		PreparedStatement pr = null;
		ResultSet rs = null;
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setString(1, nombre);
			rs = pr.executeQuery();
			if (rs.next()) {
				usuario = new Usuario();
				usuario.setNombre(rs.getString("nombre_us"));
				usuario.setCedula(rs.getString("cedula_us"));
				usuario.setCorreo(rs.getString("correo_us"));
				usuario.setClave(rs.getString("clave_us"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pr != null) pr.close();
				con.getConexion().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return usuario;
	}
	
	public Boolean ingresarEmpleado(Integer nperfil, int nestado, String ncedula, String nnombre, String ncorreo) {
		String result="";
		Boolean respuesta=false;
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_per, id_est, nombre_us,"
		+ "cedula_us,correo_us,clave_us) "
		+ "VALUES(?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,nperfil);
			pr.setInt(2, nestado);
			pr.setString(3, nnombre);
			pr.setString(4, ncedula);
			pr.setString(5, ncorreo);
			pr.setString(6, this.getClave());
			if(pr.executeUpdate()==1){
				System.out.println("Insercion correcta");
				respuesta=true;
			}else{
				System.out.println("Error en insercion");
				respuesta=false;
			}
		}catch(Exception ex){
			result=ex.getMessage();
			System.out.print(result);
		}finally{
			try{
				pr.close();
			 	con.getConexion().close();
			}catch(Exception ex){
				System.out.print(ex.getMessage());
			}
		}
		return respuesta;
	}
	
	public Boolean verificarClave(String nclave) {
		String result="";
		Boolean respuesta=false;
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="SELECT * FROM tb_usuario WHERE clave_us=?";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setString(1, nclave);
			ResultSet rs=pr.executeQuery();
			if(rs.next()){
				System.out.println("Clave correcta");
				respuesta=true;
			}else{
				System.out.println("Clave incorrecta");
				respuesta=false;
			}
		}catch(Exception ex){
			result=ex.getMessage();
			System.out.print(result);
		}finally{
			try{
				pr.close();
			 	con.getConexion().close();
			}catch(Exception ex){
				System.out.print(ex.getMessage());
			}
		}
		return respuesta;
	}
	
	public Boolean coincidirClave(String nclave, String nrepetir) {
		Boolean respuesta=false;
		if(nclave.equals(nrepetir)){
			System.out.println("Coinciden");
			respuesta=true;
		}else{
			System.out.println("No coinciden");
			respuesta=false;
		}
		return respuesta;
	}
	
	public Boolean cambiarClave(String ncorreo, String nclave) {
		String result="";
		Boolean respuesta=false;
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="UPDATE tb_usuario SET clave_us=? WHERE correo_us=?";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setString(1, nclave);
			pr.setString(2, ncorreo);
			if(pr.executeUpdate()==1){
				System.out.println("Cambio correcto");
				respuesta=true;
			}else{
				System.out.println("Error en cambio");
				respuesta=false;
			}
		}catch(Exception ex){
			result=ex.getMessage();
			System.out.print(result);
		}finally{
			try{
				pr.close();
			 	con.getConexion().close();
			}catch(Exception ex){
				System.out.print(ex.getMessage());
			}
		}
		return respuesta;
	}

}
