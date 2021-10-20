package entity;

public class Notas {
	
	private int codNota;
	private int codAluno;
	private int codDisciplina;
	private float vlrNota;
	
	public Notas(int codAluno, int codDisciplina, float vlrNota) {
		this.codAluno = codAluno;
		this.codDisciplina = codDisciplina;
		this.vlrNota = vlrNota;
	}
	
	
	public void setCodNota(int codNota) {
		this.codNota = codNota;
	}


	public int getCodNota() {
		return codNota;
	}

	public int getCodAluno() {
		return codAluno;
	}

	public int getCodDisciplina() {
		return codDisciplina;
	}

	public float getVlrNota() {
		return vlrNota;
	}

	@Override
	public String toString() {
		return "Notas [codNota=" + codNota + ", codAluno=" + codAluno + ", codDisciplina=" + codDisciplina
				+ ", vlrNota=" + vlrNota + "]";
	}
	
	
	
	
}
