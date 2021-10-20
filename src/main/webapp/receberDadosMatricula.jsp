<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Matricula"%>
<%@page import="dao.MatriculaDAO"%>


<%
	int codAluno = Integer.parseInt(request.getParameter("codAluno"));
    int codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
	
    Matricula matricula = new Matricula(codAluno, codDisciplina);
    MatriculaDAO mDAO = new MatriculaDAO();
    
    if (mDAO.gerarMatricula(matricula)) {
        response.sendRedirect("cadastraMatricula.jsp?pmensagem=Aluno matriculado");
    } else {
        response.sendRedirect("cadastraDisciplina.jsp?pmensagem=Problema ao matricular");
    }
%>