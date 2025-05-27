package com.productos.seguridad;

import java.sql.*;
import java.util.*;

import com.productos.data.Conexion;

public class Usuario {
	private int id;
	private Integer perfil;
	private int estadoCivil;
	private String cedula;
	private String nombre;
	private String correo;
	private String clave;
	private boolean activo;
	
	public Usuario() {
	
	}
	
	public Usuario(Integer perfil, int estadoCivil, String cedula, String nombre, String correo, String clave, boolean activo) {
		super();
		this.perfil = perfil;
		this.estadoCivil = estadoCivil;
		this.cedula = cedula;
		this.nombre = nombre;
		this.correo = correo;
		this.clave = clave;
		this.activo = activo;
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
	
	public int getId() {
	    return id;
	}

	public void setId(int id) {
	    this.id = id;
	}

	public boolean isActivo() {
	    // Asumiendo que en tu base de datos activo es un booleano (1/0 o true/false)
	    // Si es un entero, puedes usar: return estado == 1;
	    return this.activo;
	}

	public void setActivo(boolean activo) {
	    this.activo = activo;
	}
	
	// Método para verificar credenciales y devolver usuario completo
	public Usuario verificarUsuario(String ncorreo, String nclave) {
	    Usuario usuario = null;
	    String sql = "SELECT * FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";
	    
	    try (Connection conn = Conexion.getCon();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, ncorreo);
	        pstmt.setString(2, nclave);
	        
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if(rs.next()) {
	                usuario = new Usuario();
	                usuario.setId(rs.getInt("id_us"));
	                usuario.setPerfil(rs.getInt("id_per"));
	                usuario.setNombre(rs.getString("nombre_us"));
	                usuario.setCorreo(rs.getString("correo_us"));
	                usuario.setActivo(rs.getBoolean("activo_us"));
	            }
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return usuario;
	}
	
	public String ingresarCliente()
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_per, id_est, nombre_us,"
		+ "cedula_us,correo_us,clave_us,activo_us) "
		+ "VALUES(?,?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,2);
			pr.setInt(2, this.getEstado());
			pr.setString(3, this.getNombre());
			pr.setString(4, this.getCedula());
			pr.setString(5, this.getCorreo());
			pr.setString(6, this.getClave());
			pr.setBoolean(7, this.isActivo());
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
	
	public Boolean ingresarEmpleado(Integer nperfil, int nestado, String ncedula, String nnombre, String ncorreo, boolean activo) {
		String result="";
		Boolean respuesta=false;
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us, activo_us) "
				+ "VALUES(?,?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,nperfil);
			pr.setInt(2, nestado);
			pr.setString(3, nnombre);
			pr.setString(4, ncedula);
			pr.setString(5, ncorreo);
			pr.setString(6, this.getClave());
			pr.setBoolean(7, activo);
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
	
	// Método para obtener todos los usuarios (para el administrador)
	public static List<Usuario> obtenerTodosUsuarios() {
	    List<Usuario> usuarios = new ArrayList<>();
	    String sql = "SELECT * FROM tb_usuario";
	    
	    try (Connection conn = Conexion.getCon();
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(sql)) {
	        
	        while(rs.next()) {
	            Usuario usuario = new Usuario();
	            usuario.setId(rs.getInt("id_us"));
	            usuario.setPerfil(rs.getInt("id_per"));
	            usuario.setEstado(rs.getInt("id_est"));
	            usuario.setCedula(rs.getString("cedula_us"));
	            usuario.setNombre(rs.getString("nombre_us"));
	            usuario.setCorreo(rs.getString("correo_us"));
	            usuario.setActivo(rs.getBoolean("activo_us")); // Asume que el campo se llama "activo"
	            usuarios.add(usuario);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return usuarios;
	}

	// Método para cambiar estado activo/inactivo
	public static boolean cambiarEstadoUsuario(int idUsuario, boolean activo) {
	    String sql = "UPDATE tb_usuario SET activo_us = ? WHERE id_us = ?";
	    
	    try (Connection conn = Conexion.getCon();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setBoolean(1, activo);
	        pstmt.setInt(2, idUsuario);
	        
	        return pstmt.executeUpdate() > 0;
	    } catch(Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	// Método para actualizar la información de un usuario
	public static boolean actualizarUsuario(Usuario usuario) {
	    String sql = "UPDATE tb_usuario SET id_per = ?, id_est = ?, nombre_us = ?, " +
	                 "cedula_us = ?, correo_us = ? WHERE id_us = ?";
	    
	    try (Connection conn = Conexion.getCon();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setInt(1, usuario.getPerfil());
	        pstmt.setInt(2, usuario.getEstado());
	        pstmt.setString(3, usuario.getNombre());
	        pstmt.setString(4, usuario.getCedula());
	        pstmt.setString(5, usuario.getCorreo());
	        pstmt.setInt(6, usuario.getId());
	        
	        return pstmt.executeUpdate() > 0;
	    } catch(Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public Usuario buscarUsuarioPorCorreo(String correo) {
	    Usuario usuario = null;
	    String sql = "SELECT * FROM tb_usuario WHERE correo_us = ?";
	    
	    try (Connection conn = Conexion.getCon();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, correo);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if(rs.next()) {
	                usuario = new Usuario();
	                usuario.setId(rs.getInt("id_us"));
	                usuario.setPerfil(rs.getInt("id_per"));
	                usuario.setEstado(rs.getInt("id_est"));
	                usuario.setCedula(rs.getString("cedula_us"));
	                usuario.setNombre(rs.getString("nombre_us"));
	                usuario.setCorreo(rs.getString("correo_us"));
	                usuario.setActivo(rs.getBoolean("activo_us"));
	            }
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return usuario;
	}
}
