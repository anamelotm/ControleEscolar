<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Aluno"%>
<%@page import="dao.AlunoDAO"%>

<%
	int codAluno = Integer.parseInt(request.getParameter("alterarAluno"));
	boolean ativo = Boolean.parseBoolean(request.getParameter("statusAluno"));
	

    AlunoDAO aDAO = new AlunoDAO();
    aDAO.alterarStatusAluno(codAluno, ativo);
    out.write("Status alterado com sucesso");
    
%>