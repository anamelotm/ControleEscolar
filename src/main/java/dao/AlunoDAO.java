package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Aluno;
import entity.Notas;
import infra.ConexaoMysql;

public class AlunoDAO {
	private ConexaoMysql conexao;
	private String query = "";
	
	public AlunoDAO() throws ClassNotFoundException, SQLException {
		this.conexao = new ConexaoMysql();
	}
	
	public boolean incluirAluno(Aluno aluno) throws SQLException {
        query = "insert into aluno values(null,?,?,?,?,?,?,?,?,?);";
        try{
        	
            PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);

            stmt.setString(1,aluno.getNomeAluno());
            stmt.setString(2, aluno.getCpfAluno());
            stmt.setDate(3, new java.sql.Date(aluno.getDataNascimento().getTime()));
            stmt.setDate(4, new java.sql.Date(aluno.getDataMatricula().getTime()));
            stmt.setString(5, aluno.getNomePai());
            stmt.setString(6, aluno.getNomeMae());
            stmt.setString(7, aluno.getResponsavel());
            stmt.setString(8, aluno.getFoneResponsavel());
            stmt.setBoolean(9, aluno.isMatriculado());

            stmt.execute();
            this.conexao.commit();
            return true;
        } catch (SQLException e) {
            this.conexao.rollback();
            throw e;
        }
    }
	
	 public void alterarAluno(int codAluno, String responsavel, String foneResponsavel) throws SQLException {
	        query = "update aluno set responsavel = ?, foneResponsavel = ? where codAluno = ?;";
	        try{
	            PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
	            stmt.setString(1, responsavel);
	            stmt.setString(2, foneResponsavel);
	            stmt.setInt(3, codAluno);

	            stmt.execute();
	            this.conexao.commit();

	        } catch (SQLException e) {
	           throw e;
	        }

	    }
	 
	 public Aluno consultarAluno(int codAluno) throws SQLException {
		 query="select codAluno, nomeAluno, cpfAluno, cpfAluno, dataNascimento, dataMatricula, nomePai, nomeMae, responsavel, foneResponsavel, matriculado from aluno where codAluno = ?;";
		 try {
			 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
	            stmt.setInt(1, codAluno);
	            ResultSet resultSet = stmt.executeQuery();

	            Aluno aluno = null;

	            if(resultSet.next()){
	                aluno = new Aluno(resultSet.getString("nomeAluno"), resultSet.getString("cpfAluno"), resultSet.getDate("dataNascimento"),
	                		resultSet.getString("nomePai"), resultSet.getString("nomeMae"), resultSet.getString("responsavel"), resultSet.getString("foneResponsavel"));
	                aluno.setCodAluno(resultSet.getInt("codAluno"));
	                aluno.setMatriculado(resultSet.getBoolean("matriculado"));
	                aluno.setDataMatricula(resultSet.getDate("dataMatricula"));
	            }

	            return aluno;
		 } catch(SQLException e) {
			 this.conexao.rollback();
	         throw e;
		 }
	 }
	 
	 public List<Aluno> consultarAlunos() throws SQLException{
		 query = "select * from aluno;";
	    	try {
	    		 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
	             ResultSet resultSet = stmt.executeQuery();

	             List<Aluno> listaAlunos = new ArrayList<>();

	             while(resultSet.next()){
	            	 Aluno aluno = new Aluno(resultSet.getString("nomeAluno"), resultSet.getString("cpfAluno"), resultSet.getDate("dataNascimento"),
		                		resultSet.getString("nomePai"), resultSet.getString("nomeMae"), resultSet.getString("responsavel"), resultSet.getString("foneResponsavel"));
		                aluno.setCodAluno(resultSet.getInt("codAluno"));
		                aluno.setMatriculado(resultSet.getBoolean("matriculado"));
		                aluno.setDataMatricula(resultSet.getDate("dataMatricula"));
	            	 listaAlunos.add(aluno);
	             }
	            
	             return listaAlunos;
	    	} catch (SQLException e) {
	            throw e;
	        }
	 }
	 
	 public void alterarStatusAluno(int codAluno,boolean matriculado) throws SQLException {
		 query="update aluno set matriculado = ? where codAluno = ?;";
		 try {
			 PreparedStatement stmt = this.conexao.getConnection().prepareStatement(query);
			 stmt.setInt(2, codAluno);
			 stmt.setBoolean(1, matriculado);
			 
			 stmt.execute();
			 this.conexao.commit();
		 }catch(SQLException e) {
			 throw e;
		 }
	 }
	
}
