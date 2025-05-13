package com.productos.seguridad;

import java.sql.*;

import com.productos.data.Conexion;

public class EstadoCivil {
	private int id;
	private String descripcion;
	
	public EstadoCivil() {
		
	}
	
	public EstadoCivil(String descripcion) {
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
	
	public String mostrarEstadoCivil() {
		String sql = "SELECT * FROM tb_estadocivil";
		Conexion con = new Conexion();
		ResultSet rs = null;
		StringBuilder estadoCivil = new StringBuilder();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				estadoCivil.append("<option value='").append(rs.getInt(1)).append("'>")
						.append(rs.getString(2)).append("</option>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return estadoCivil.toString();
	}
	
}
