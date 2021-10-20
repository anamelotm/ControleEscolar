package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Disciplina;
import entity.Matricula;
import entity.Professor;
import infra.ConexaoMysql;

public class MatriculaDAO {
	private ConexaoMysql conexao;
    private String query = " ";
    
    public MatriculaDAO() throws ClassNotFoundException, SQLException {
    	this.conexao = new ConexaoMysql();
    }
    
    public boolean gerarMatricula(Matricula matricula) throws SQLException {
    	query = "insert into matricula values(null, ?, ?, ?);";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setInt(1, matricula.getCodAluno());
    		stmt.setInt(2, matricula.getCodDisciplina());
    		stmt.setDate(3, new java.sql.Date(matricula.getDataMatricula().getTime()));
    		
    		stmt.execute();
    		this.conexao.commit();
    		return true;
    	} catch(SQLException e) {
    		this.conexao.rollback();
    		throw e;
    	}
    }
    
    public void excluirMatricula(int codMatricula) throws SQLException {
    	query = "delete from matricula where codMatricula = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setInt(1, codMatricula);
    		
    		stmt.execute();
    		this.conexao.commit();
    	} catch(SQLException e) {
    		this.conexao.rollback();
    		throw e;
    	}
    }
    
    public Matricula consultarMatricula(int codMatricula) throws SQLException {
    	query = "select * from matricula where codMatricula = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
            stmt.setInt(1, codMatricula);
            ResultSet resultSet = stmt.executeQuery();

            Matricula matricula = null;

            if(resultSet.next()){
                matricula = new Matricula(resultSet.getInt("codAluno"), resultSet.getInt("codDisciplina"));
                matricula.setDataMatricula(resultSet.getDate("dataMatricula"));
            }

            return matricula;
    	} catch(SQLException e) {
			 this.conexao.rollback();
	         throw e;
    	}
    }
    
    public List<Matricula> consultarMatriculasPorAluno(int codAluno) throws SQLException {
    	query = "select * from matricula where codAluno = ?;";
    	try {
    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		 stmt.setInt(1, codAluno);
             ResultSet resultSet = stmt.executeQuery();

             List<Matricula> listaMatricula = new ArrayList<>();

             while(resultSet.next()){
            	 Matricula matricula = new Matricula(resultSet.getInt("codAluno"), resultSet.getInt("codDisciplina"));
            	 matricula.setCodMatricula(resultSet.getInt("codMatricula"));
            	 matricula.setDataMatricula(resultSet.getDate("dataMatricula"));
            	 listaMatricula.add(matricula);
             }
            
             return listaMatricula;
    	} catch (SQLException e) {
            throw e;
        }
    }
    
    public List<Matricula> consultarMatriculasPorDisciplina(int codDisciplina) throws SQLException {
    	query = "select * from matricula where codDisciplina = ?;";
    	try {
    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		 stmt.setInt(1, codDisciplina);
             ResultSet resultSet = stmt.executeQuery();

             List<Matricula> listaMatricula = new ArrayList<>();

             while(resultSet.next()){
            	 Matricula matricula = new Matricula(resultSet.getInt("codAluno"), resultSet.getInt("codDisciplina"));
            	 matricula.setCodMatricula(resultSet.getInt("codMatricula"));
            	 matricula.setDataMatricula(resultSet.getDate("dataMatricula"));
            	 listaMatricula.add(matricula);
             }
            
             return listaMatricula;
    	} catch (SQLException e) {
            throw e;
        }
    }
}