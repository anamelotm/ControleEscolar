package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Aluno;
import entity.Professor;
import infra.ConexaoMysql;

public class ProfessorDAO {
	private ConexaoMysql conexao;
    private String query = " ";
    
    public ProfessorDAO() throws ClassNotFoundException, SQLException {
    	this.conexao = new ConexaoMysql();
    }
    
    public boolean incluirProfessor(Professor professor) throws SQLException {
    	query = "insert into professor values (null, ?, ?);";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setString(1, professor.getNomeProfessor());
    		stmt.setBoolean(2, professor.isAtivo());
    		
    		stmt.execute();
    		this.conexao.commit();
    		return true;
    	} catch(SQLException e) {
    		this.conexao.rollback();
    		throw e;
    	}
    }
    
    public void alterarProfessor(int codProfessor, String nome) throws SQLException {
    	query = "update professor set nomeProfessor = ? where codProfessor = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
    		stmt.setString(1, nome);
    		stmt.setInt(2, codProfessor);
    		
    		stmt.execute();
            this.conexao.commit();
    	} catch (SQLException e) {
	           throw e;
	    }
    }
    
    public Professor consultarProfessor(int codProfessor) throws SQLException {
    	query="select codProfessor, nomeProfessor, ativo from professor where codProfessor = ?;";
		 try {
			 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
	            stmt.setInt(1, codProfessor);
	            ResultSet resultSet = stmt.executeQuery();

	            Professor professor = null;

	            if(resultSet.next()){
	                professor = new Professor(resultSet.getString("nomeProfessor"));
	                professor.setAtivo(resultSet.getBoolean("ativo"));
	                professor.setCodProfessor(resultSet.getInt("codProfessor"));

	            }

	            return professor;
		 } catch(SQLException e) {
			 this.conexao.rollback();
	         throw e;
		 }
    }
    
    public List<Professor> consultarProfessores() throws SQLException{
    	query = "select * from professor;";
    	try {
    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
             ResultSet resultSet = stmt.executeQuery();

             List<Professor> listaProfessores = new ArrayList<>();

             while(resultSet.next()){
            	 Professor professor = new Professor(resultSet.getString("nomeProfessor"));
            	 professor.setCodProfessor(resultSet.getInt("codProfessor"));
            	 professor.setAtivo(resultSet.getBoolean("ativo"));
            	 listaProfessores.add(professor);
             }
            
             return listaProfessores;
    	} catch (SQLException e) {
            throw e;
        }
    }
    
    public void alterarStatusProfessor(int codProfessor, boolean ativo) throws SQLException {
    	query="update professor set ativo = ? where codProfessor = ?;";
		 try {
			 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
			 stmt.setInt(2, codProfessor);
			 stmt.setBoolean(1, ativo);
			 
			 stmt.execute();
			 this.conexao.commit();
		 }catch(SQLException e) {
			 throw e;
		 }
	 }
}
