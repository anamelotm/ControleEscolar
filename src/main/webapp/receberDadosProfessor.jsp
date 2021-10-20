<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Professor"%>
<%@page import="dao.ProfessorDAO"%>


<%
    String nomeProfessor = request.getParameter("nomeProfessor");
	
    Professor professor = new Professor(nomeProfessor);
    ProfessorDAO pDAO = new ProfessorDAO();
    
    if (pDAO.incluirProfessor(professor)) {
        response.sendRedirect("cadastraProfessor.jsp?pmensagem=Professor cadastrado com sucesso");
    } else {
        response.sendRedirect("cadastraProfessor.jsp?pmensagem=Problemas ao cadastrar Professor");
    }
%>