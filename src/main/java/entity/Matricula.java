package entity;

import java.util.Date;

public class Matricula {
	
	private int codMatricula;
	private int codAluno;
	private int codDisciplina;
	private Date dataMatricula;
	
	public Matricula(int codAluno, int codDisciplina) {
		this.codAluno = codAluno;
		this.codDisciplina = codDisciplina;
		this.dataMatricula = new Date();
	}
	
	public void setCodMatricula(int codMatricula) {
		this.codMatricula = codMatricula;
	}
	
	public void setDataMatricula(Date dataMatricula) {
		this.dataMatricula = dataMatricula;
	}

	public int getCodMatricula() {
		return codMatricula;
	}

	public int getCodAluno() {
		return codAluno;
	}

	public int getCodDisciplina() {
		return codDisciplina;
	}

	public Date getDataMatricula() {
		return dataMatricula;
	}

	@Override
	public String toString() {
		return "Matricula [codMatricula=" + codMatricula + ", codAluno=" + codAluno + ", codDisciplina=" + codDisciplina
				+ ", dataMatricula=" + dataMatricula + "]";
	}
	
	

}
