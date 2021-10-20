<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Notas"%>
<%@page import="dao.NotasDAO"%>


<%
	int codAluno = Integer.parseInt(request.getParameter("codAluno"));
    int codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
    float vlrNota = Float.parseFloat(request.getParameter("vlrNota"));
	
    Notas notas = new Notas(codAluno, codDisciplina, vlrNota);
    NotasDAO nDAO = new NotasDAO();
    
    if (nDAO.incluirNota(notas)) {
        response.sendRedirect("cadastraNotas.jsp?pmensagem=Nota incluida com sucesso");
    } else {
        response.sendRedirect("cadastraNotas.jsp?pmensagem=Problema ao incluir nota");
    }
%>