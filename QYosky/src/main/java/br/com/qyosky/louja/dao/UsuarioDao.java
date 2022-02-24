package br.com.qyosky.louja.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.TemporalAccessor;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.tomcat.jni.Time;
import org.springframework.format.annotation.DateTimeFormat;

import br.com.qyosky.louja.model.Usuario;

public class UsuarioDao {
	private Connection conexao;

	public UsuarioDao() {
		conexao = ConnectionFactory.conectar();
	}

	public void inserir(Usuario u) {
		String sql = "INSERT INTO clientes (nome, email, numero, genero, data_nascimento, pedido, endereco) VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement smtp;
		try {
			 
			smtp = conexao.prepareStatement(sql);
			smtp.setString(1, u.getNome());
			smtp.setString(2, u.getEmail());
			smtp.setString(3, u.getNumero());
			smtp.setInt(4, u.getGenero());
			smtp.setDate(5, new Date(u.getDataNascimento().getTimeInMillis()));
			smtp.setString(6, u.getPedido());
			smtp.setString(7, u.getEndereco());

			smtp.execute();
			smtp.close();
			conexao.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public List<Calendar> dates() {
		String sql = "SELECT date_time FROM clientes";
		PreparedStatement smtp;
		List<Calendar> l = new ArrayList<Calendar>();
		try {
			smtp = conexao.prepareStatement(sql);
			ResultSet d = smtp.executeQuery();
			
			while(d.next()) {
				Date date = d.getDate("date_time");
				
				Calendar cld = Calendar.getInstance();
				
				cld.setTimeInMillis(date.getTime());
				l.add(cld);
			}
			return l;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	public List<Usuario> vTudo() {
		String sql = "SELECT * FROM clientes";
		PreparedStatement smtp;
		List<Usuario> u = new ArrayList<Usuario>();
		try {
			smtp = conexao.prepareStatement(sql);
			ResultSet r = smtp.executeQuery();

			while (r.next()) {
				Usuario us = new Usuario();
				us.setId(r.getLong("id"));
				us.setNome(r.getString("nome"));
				us.setEmail(r.getString("email"));
				us.setNumero(r.getString("numero"));
				us.setGenero(r.getInt("genero"));
				us.setPedido(r.getString("pedido"));
				us.setEndereco(r.getString("endereco"));

				Calendar cld = Calendar.getInstance();
				Date date = r.getDate("data_nascimento");

				cld.setTimeInMillis(date.getTime());
				us.setDataNascimento(cld);

				u.add(us);
			}
			r.close();
			smtp.close();
			conexao.close();
			return u;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	public int data() {
		String sql = "select date_time from clientes";
		PreparedStatement smtp;
		
		try {
			smtp = conexao.prepareStatement(sql);
			ResultSet r = smtp.executeQuery();

			int n = 0;
			while (r.next()) {
				
				Date date = r.getDate("date_time");
				Calendar cld = Calendar.getInstance();
				Calendar cldD = Calendar.getInstance();
				
				int dia = cld.get(Calendar.DAY_OF_MONTH);
				int mes = cld.get(Calendar.MONTH);
				int ano = cld.get(Calendar.YEAR);
				
				cldD.setTimeInMillis(date.getTime());

				int diaD = cldD.get(Calendar.DAY_OF_MONTH);
				int mesD = cldD.get(Calendar.MONTH);
				int anoD = cldD.get(Calendar.YEAR);
				
				if(dia == diaD && mesD == mes && anoD == ano) {
					n += 1;
				}
			}
			return n;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public List<Integer> hora() {
		String sql = "select hora from clientes";
		PreparedStatement smtp;
		
		List<Integer> list = new ArrayList<Integer>();
		
		try {
			smtp = conexao.prepareStatement(sql);
			ResultSet r = smtp.executeQuery();

			while (r.next()) {
				java.sql.Time hH = r.getTime("hora");
					
				SimpleDateFormat formatTime = new SimpleDateFormat("HH");
				int hora = Integer.parseInt(formatTime.format(hH));
				list.add(hora);

			}
			return list;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public List<Calendar> idade(){
		String sql = "select data_nascimento from clientes";
		PreparedStatement smtp;
		List<Calendar> c = new ArrayList<Calendar>();
		try {
			smtp = conexao.prepareStatement(sql);
			ResultSet r = smtp.executeQuery();
			while (r.next()) {
				
				Date date = r.getDate("data_nascimento");
				Calendar cldD = Calendar.getInstance();
				cldD.setTimeInMillis(date.getTime());
				
				c.add(cldD);
			}
			return c;
		} catch (Exception e) {
			System.out.println(e);
			throw new RuntimeException();
		}
	}
	
	public void excluir(Long id) {
		String sql = "delete from clientes where id = ?";
		PreparedStatement smtp;

		try {
			smtp = conexao.prepareStatement(sql);
			smtp.setLong(1, id);
			smtp.execute();
			smtp.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	public Usuario search(Long id) {
		String sql = "select * from clientes where id = ?";
		PreparedStatement stmt;
		Usuario us = null;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet r = stmt.executeQuery();

			while (r.next()) {
				us = new Usuario();
				us.setId(r.getLong("id"));
				us.setNome(r.getString("nome"));
				us.setEmail(r.getString("email"));
				us.setNumero(r.getString("numero"));
				us.setGenero(r.getInt("genero"));
				us.setPedido(r.getString("pedido"));
				us.setEndereco(r.getString("endereco"));

				Calendar cld = Calendar.getInstance();
				Date date = r.getDate("data_nascimento");

				cld.setTimeInMillis(date.getTime());
				us.setDataNascimento(cld);
			}

			r.close();
			stmt.close();
			conexao.close();
			return us;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	public void atualizar(Usuario u, Long idUsuario) {
		String sql = "update clientes set nome = ?, email = ?, numero = ?, genero = ?, data_nascimento = ?, pedido = ? where id = ?";
		PreparedStatement smtp;
		try {
			smtp = conexao.prepareStatement(sql);
			smtp.setString(1, u.getNome());
			smtp.setString(2, u.getEmail());
			smtp.setString(3, u.getNumero());
			smtp.setInt(4, u.getGenero());
			smtp.setDate(5, new Date(u.getDataNascimento().getTimeInMillis()));
			smtp.setString(6, u.getPedido());
			smtp.setLong(7, idUsuario);

			smtp.execute();
			smtp.close();
			conexao.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public int masculino() {
		String sql = "select * from clientes where genero = ?";
		PreparedStatement smtp;
		try {
			smtp = conexao.prepareStatement(sql);
			smtp.setInt(1, 2);
			ResultSet r = smtp.executeQuery();
			
			int contT = 0;
			while (r.next()) {
				contT += 1;
			}
			
			return contT;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public int all() {
		String sql = "select * from clientes";
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			ResultSet r = stmt.executeQuery();
			int n = 0;
			while (r.next()) {
				n += 1;
			}
			return n;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public int feminino() {
		String sql = "select * from clientes where genero = ?";
		PreparedStatement smtp;
		try {
			smtp = conexao.prepareStatement(sql);
			smtp.setInt(1, 1);
			ResultSet r = smtp.executeQuery();
			
			int contT = 0;
			while (r.next()) {
				contT += 1;
			}
			
			return contT;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public int nValue() {
		String sql = "select * from clientes where genero = ?";
		PreparedStatement smtp;
		try {
			smtp = conexao.prepareStatement(sql);
			smtp.setInt(1, 3);
			ResultSet r = smtp.executeQuery();
			
			int contT = 0;
			while (r.next()) {
				contT += 1;
			}
			
			return contT;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
}