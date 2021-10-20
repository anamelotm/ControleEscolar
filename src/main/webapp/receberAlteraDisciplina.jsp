<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Disciplina"%>
<%@page import="dao.DisciplinaDAO"%>

<%
	int codDisciplina = Integer.parseInt(request.getParameter("alterarDisciplina"));
	String descDisciplina = request.getParameter("descricao");
	int cargaHoraria = Integer.parseInt(request.getParameter("cargaHoraria"));
	int codProfessor = Integer.parseInt(request.getParameter("codProfessor"));
	

    DisciplinaDAO dDAO = new DisciplinaDAO();
    dDAO.alterarDisciplina(codDisciplina, codProfessor, descDisciplina, cargaHoraria);
    out.write("Disciplina alterada com sucesso");
    
%>