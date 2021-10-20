<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Disciplina"%>
<%@page import="dao.DisciplinaDAO"%>

<%
	int codDisciplina = Integer.parseInt(request.getParameter("alterarDisciplina"));
	boolean ativo = Boolean.parseBoolean(request.getParameter("statusDisciplina"));
	
	DisciplinaDAO dDAO = new DisciplinaDAO();
	dDAO.alterarStatusDisciplina(codDisciplina, ativo);

    out.write("Status alterado com sucesso");
    
%>