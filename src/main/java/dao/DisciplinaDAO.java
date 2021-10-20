package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Aluno;
import entity.Disciplina;
import entity.Professor;
import infra.ConexaoMysql;

public class DisciplinaDAO {
	
	private ConexaoMysql conexao;
    private String query = " ";
    
    public DisciplinaDAO() throws ClassNotFoundException, SQLException {
    	this.conexao = new ConexaoMysql();
    }
    
    public boolean incluirDisciplina(Disciplina disciplina) throws SQLException {
        query = "insert into disciplina(codDisciplina, codProfessor, descDisciplina, cargaHoraria, ativa) values(null,?,?,?,?);";
        try{
        	
            PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
            stmt.setInt(1, disciplina.getCodProfessor());
            stmt.setString(2, disciplina.getDescDisciplina());
            stmt.setInt(3, disciplina.getCargaHoraria());
            stmt.setBoolean(4, disciplina.isAtiva());

            stmt.execute();
            this.conexao.commit();
            return true;
        } catch (SQLException e) {
            this.conexao.rollback();
            throw e;
        }
    }
    
    public void alterarDisciplina(int codDisciplina, int codProfessor, String descDisciplina, int cargaHoraria) throws SQLException {
    	query = "update disciplina set codProfessor = ?, descDisciplina = ?, cargaHoraria = ? where codProfessor = ?;";
    	try {
    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
             stmt.setInt(1, codProfessor);
             stmt.setString(2, descDisciplina);
             stmt.setInt(3, cargaHoraria);
             stmt.setInt(4, codDisciplina);

             stmt.execute();
             this.conexao.commit();
    	} catch (SQLException e) {
            this.conexao.rollback();
            throw e;
        }
    }
    
    public Disciplina consultarDisciplina(int codDisciplina) throws SQLException {
    	query = "select * from disciplina where codDisciplina = ?;";
    	try {
    		PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
            stmt.setInt(1, codDisciplina);
            ResultSet resultSet = stmt.executeQuery();

            Disciplina disciplina = null;

            if(resultSet.next()){
                disciplina = new Disciplina(resultSet.getInt("codProfessor"), resultSet.getString("descDisciplina"), resultSet.getInt("cargaHoraria"));
                disciplina.setAtiva(resultSet.getBoolean("ativa"));
                disciplina.setCodDisciplina(resultSet.getInt("codDisciplina"));
              
            }

            return disciplina;
    	} catch (SQLException e) {
            this.conexao.rollback();
            throw e;
        }
    }
    
    public List<Disciplina> consultarDisciplinas() throws SQLException{
    	 query = "select * from disciplina;";
	    	try {
	    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
	             ResultSet resultSet = stmt.executeQuery();

	             List<Disciplina> listaDisciplina = new ArrayList<>();

	             while(resultSet.next()){
	            	Disciplina disciplina = new Disciplina(resultSet.getInt("codProfessor"), resultSet.getString("descDisciplina"), resultSet.getInt("cargaHoraria"));
	            	disciplina.setCodDisciplina(resultSet.getInt("codDisciplina"));
	            	disciplina.setAtiva(resultSet.getBoolean("ativa"));
	            	 listaDisciplina.add(disciplina);
	             }
	            
	             return listaDisciplina;
	    	} catch (SQLException e) {
	            throw e;
	        }
    }
    
    public void alterarStatusDisciplina(int codDisciplina, boolean ativo) throws SQLException {
    	query="update disciplina set ativa = ? where codDisciplina = ?;";
		 try {
			 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
			 stmt.setInt(2, codDisciplina);
			 stmt.setBoolean(1, ativo);
			 
			 stmt.execute();
			 this.conexao.commit();
		 }catch(SQLException e) {
			 throw e;
		 }
	 }
    
    public void calcularMedias() {
    	
    }

}
