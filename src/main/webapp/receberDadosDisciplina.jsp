<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Disciplina"%>
<%@page import="dao.DisciplinaDAO"%>


<%
	int codProfessor = Integer.parseInt(request.getParameter("codProfessor"));
    String descDisciplina = request.getParameter("descDisciplina");
    int cargaHoraria = Integer.parseInt(request.getParameter("cargaHoraria"));
	
    Disciplina disciplina = new Disciplina(codProfessor, descDisciplina, cargaHoraria);
    DisciplinaDAO dDAO = new DisciplinaDAO();
    
    if (dDAO.incluirDisciplina(disciplina)) {
        response.sendRedirect("cadastraDisciplina.jsp?pmensagem=Disciplina cadastrada com sucesso");
    } else {
        response.sendRedirect("cadastraDisciplina.jsp?pmensagem=Problemas ao cadastrar Disciplina");
    }
%>