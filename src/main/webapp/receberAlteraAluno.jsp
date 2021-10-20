<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Aluno"%>
<%@page import="dao.AlunoDAO"%>

<%
	int codAluno = Integer.parseInt(request.getParameter("alterarAluno"));
	String nomeResponsavel = request.getParameter("nomeResponsavel");
	String foneResponsavel = request.getParameter("foneResponsavel");
	

    AlunoDAO aDAO = new AlunoDAO();
    aDAO.alterarAluno(codAluno, nomeResponsavel, foneResponsavel);
    out.write("Aluno alterado com sucesso");
    
%>