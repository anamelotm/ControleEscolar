package entity;

public class Professor {
	
	private int codProfessor;
	private String nomeProfessor;
	private boolean ativo;
	
	public Professor(String nomeProfessor) {
		this.nomeProfessor = nomeProfessor;
		this.ativo = true;
	}
	
	public void setCodProfessor(int codProfessor) {
		this.codProfessor = codProfessor;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public int getCodProfessor() {
		return codProfessor;
	}

	public String getNomeProfessor() {
		return nomeProfessor;
	}
	

	@Override
	public String toString() {
		return "Professor [codProfessor=" + codProfessor + ", nomeProfessor=" + nomeProfessor + ", ativo=" + ativo
				+ "]";
	}
	
	
	
	

}
