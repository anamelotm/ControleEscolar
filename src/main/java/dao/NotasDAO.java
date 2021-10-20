package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Matricula;
import entity.Notas;
import infra.ConexaoMysql;

public class NotasDAO {
	private ConexaoMysql conexao;
    private String query = " ";
    
    public NotasDAO() throws ClassNotFoundException, SQLException {
    	this.conexao = new ConexaoMysql();
    }
    
    public boolean incluirNota(Notas notas) throws SQLException {
    	query = "insert into notas values(null, ?, ?, ?);";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setInt(1, notas.getCodAluno());
    		stmt.setInt(2, notas.getCodDisciplina());
    		stmt.setFloat(3, notas.getVlrNota());
    		
    		stmt.execute();
    		this.conexao.commit();
    		return true;
    	} catch(SQLException e) {
    		this.conexao.rollback();
    		throw e;
    	}
    }
    
    public void alterarNota(int codNota, float vlrNota) throws SQLException {
    	query = "update notas set vlrNota = ? where codNota = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setInt(2, codNota);
    		stmt.setFloat(1, vlrNota);
    		
    		stmt.execute();
    		this.conexao.commit();
    	} catch(SQLException e) {
    		this.conexao.rollback();
    		throw e;
    	}
    }
    
    public void excluirNota(int codNota) throws SQLException {
    	query = "delete from notas where codNota = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setInt(1, codNota);
    		
    		stmt.execute();
    		this.conexao.commit();
    	} catch(SQLException e) {
    		this.conexao.rollback();
    		throw e;
    	}
    }
    
    public List<Notas> consultarNotaPorAluno(int codAluno) throws SQLException{
    	query = "select * from notas where codAluno = ?;";
    	try {
    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		 stmt.setInt(1, codAluno);
             ResultSet resultSet = stmt.executeQuery();

             List<Notas> listaNotas = new ArrayList<>();

             while(resultSet.next()){
            	 Notas notas = new Notas(resultSet.getInt("codAluno"), resultSet.getInt("codDisciplina"), resultSet.getFloat("vlrNota"));
            	 notas.setCodNota(resultSet.getInt("codNota"));
            	 listaNotas.add(notas);
             }
            
             return listaNotas;
    	} catch (SQLException e) {
            throw e;
        }
    }
    
    public List<Notas> consultarNotaPorDisciplina(int codDisciplina) throws SQLException{
    	query = "select * from notas where codDisciplina = ?;";
    	try {
    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		 stmt.setInt(1, codDisciplina);
             ResultSet resultSet = stmt.executeQuery();

             List<Notas> listaNotas = new ArrayList<>();

             while(resultSet.next()){
            	 Notas notas = new Notas(resultSet.getInt("codAluno"), resultSet.getInt("codDisciplina"), resultSet.getFloat("vlrNota"));
            	 notas.setCodNota(resultSet.getInt("codNota"));
            	 listaNotas.add(notas);
             }
            
             return listaNotas;
    	} catch (SQLException e) {
            throw e;
        }
    }
    
    public double calcularMediaDisciplina(int codDisciplina) throws SQLException {
    	query = "select AVG(vlrNota) from notas n where codDisciplina = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setInt(1, codDisciplina);
    		ResultSet resultSet = stmt.executeQuery();
    		
    		double media = 0;
    		
    		if(resultSet.next()){
    			media = resultSet.getDouble(1);
            }
    		
    		return media;
    	}catch(SQLException e) {
			 this.conexao.rollback();
	         throw e;
    	}
    }
    
    public double calcularMediaAluno(int codAluno) throws SQLException {
    	query = "select AVG(vlrNota) from notas n where codAluno = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setInt(1, codAluno);
    		ResultSet resultSet = stmt.executeQuery();
    		
    		double media = 0;
    		
    		if(resultSet.next()){
    			media = resultSet.getDouble(1);
            }
    		
    		return media;
    	}catch(SQLException e) {
			 this.conexao.rollback();
	         throw e;
    	}
    }
}
