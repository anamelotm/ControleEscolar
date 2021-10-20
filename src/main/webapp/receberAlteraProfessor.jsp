<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Professor"%>
<%@page import="dao.ProfessorDAO"%>

<%
	int codProfessor = Integer.parseInt(request.getParameter("alterarProfessor"));
	String nome = request.getParameter("nomeProfessor");
	

    ProfessorDAO pDAO = new ProfessorDAO();
    pDAO.alterarProfessor(codProfessor, nome);
    out.write("Professor alterado com sucesso");
    
%>