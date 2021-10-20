package entity;

public class Disciplina {
	 private int codDisciplina;
	 private int codProfessor;
	 private String descDisciplina;
	 private int cargaHoraria;
	 private boolean ativa;
	 
	public Disciplina(int codProfessor, String descDisciplina, int cargaHoraria) {
		this.codProfessor = codProfessor;
		this.descDisciplina = descDisciplina;
		this.cargaHoraria = cargaHoraria;
		this.ativa = true;
	}
	
	public void setCodDisciplina(int codDisciplina) {
		this.codDisciplina = codDisciplina;
	}

	public void setAtiva(boolean ativa) {
		this.ativa = ativa;
	}


	public int getCodDisciplina() {
		return codDisciplina;
	}



	public int getCodProfessor() {
		return codProfessor;
	}



	public String getDescDisciplina() {
		return descDisciplina;
	}



	public int getCargaHoraria() {
		return cargaHoraria;
	}


	public boolean isAtiva() {
		return ativa;
	}
	
	

	@Override
	public String toString() {
		return "Disciplina [codDisciplina=" + codDisciplina + ", codProfessor=" + codProfessor + ", descDisciplina="
				+ descDisciplina + ", cargaHoraria=" + cargaHoraria + ", ativa=" + ativa + "]";
	}
	
	
	 
 
}
