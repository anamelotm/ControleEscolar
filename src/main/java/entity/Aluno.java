package entity;

import java.util.Date;

public class Aluno {
	
	private int codAluno;
	private String nomeAluno;
	private String cpfAluno;
	private Date dataNascimento;
	private Date dataMatricula;
	private String nomePai;
	private String nomeMae;
	private String responsavel;
	private String foneResponsavel;
	private boolean matriculado;
	
	public Aluno(String nomeAluno, String cpfAluno, Date dataNascimento,
			String nomePai, String nomeMae, String responsavel, String foneResponsavel) {
		super();
		this.nomeAluno = nomeAluno;
		this.cpfAluno = cpfAluno;
		this.dataNascimento = dataNascimento;
		this.dataMatricula = new Date();
		this.nomePai = nomePai;
		this.nomeMae = nomeMae;
		this.responsavel = responsavel;
		this.foneResponsavel = foneResponsavel;
		this.matriculado = true;
	}
	
	public void setCodAluno(int codAluno) {
		this.codAluno = codAluno;
	}

	public boolean isMatriculado() {
		return matriculado;
	}

	public void setMatriculado(boolean matriculado) {
		this.matriculado = matriculado;
	}
	
	public void setDataMatricula(Date dataMatricula) {
		this.dataMatricula = dataMatricula;
	}

	public int getCodAluno() {
		return codAluno;
	}

	public String getNomeAluno() {
		return nomeAluno;
	}

	public String getCpfAluno() {
		return cpfAluno;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public Date getDataMatricula() {
		return dataMatricula;
	}

	public String getNomePai() {
		return nomePai;
	}

	public String getNomeMae() {
		return nomeMae;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public String getFoneResponsavel() {
		return foneResponsavel;
	}

	@Override
	public String toString() {
		return "Aluno [codAluno=" + codAluno + ", nomeAluno=" + nomeAluno + ", cpfAluno=" + cpfAluno
				+ ", dataNascimento=" + dataNascimento + ", dataMatricula=" + dataMatricula + ", nomePai=" + nomePai
				+ ", nomeMae=" + nomeMae + ", responsavel=" + responsavel + ", foneResponsavel=" + foneResponsavel
				+ ", matriculado=" + matriculado + "]";
	}
	
	
	

}
