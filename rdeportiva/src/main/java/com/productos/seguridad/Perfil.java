package com.productos.seguridad;

import java.sql.*;

import com.productos.data.Conexion;

public class Perfil {

	private int id;
	private String descripcion;
	
	public Perfil() {
		
	}
	
	public Perfil(String descripcion) {
		super();
		this.descripcion = descripcion;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String consultarPerfil(int id) {
		String sql = "SELECT * FROM tb_perfil WHERE id_per = " + id;
		Conexion con = new Conexion();
		ResultSet rs = null;
		StringBuilder perfil = new StringBuilder();
		try {
			rs = con.Consulta(sql);
			if (rs.next()) {
				perfil.append("<option value='").append(rs.getInt(1)).append("'>")
						.append(rs.getString(2)).append("</option>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return perfil.toString();
	}
	
	public String mostrarPerfil() {
		String sql = "SELECT * FROM tb_perfil";
		Conexion con = new Conexion();
		ResultSet rs = null;
		StringBuilder perfil = new StringBuilder();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				perfil.append("<option value='").append(rs.getInt(1)).append("'>")
						.append(rs.getString(2)).append("</option>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return perfil.toString();
	}
	
}
