<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Professor"%>
<%@page import="dao.ProfessorDAO"%>

<%
	int codProfessor = Integer.parseInt(request.getParameter("alterarProfessor"));
	boolean ativo = Boolean.parseBoolean(request.getParameter("statusProfessor"));
	

    ProfessorDAO pDAO = new ProfessorDAO();
    pDAO.alterarStatusProfessor(codProfessor,ativo);
    out.write("Status alterado com sucesso");
    
%>