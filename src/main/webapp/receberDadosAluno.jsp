<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Aluno"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>

<%
    String nomeAluno = request.getParameter("nomeAluno");
	String cpf = request.getParameter("cpfAluno");
	String dataString = request.getParameter("dataNascimento");
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	java.sql.Date dataNascimento = new java.sql.Date(sdf.parse(dataString).getTime());
	String nomePai = request.getParameter("nomePai");
	String nomeMae = request.getParameter("nomeMae");
	String nomeResponsavel = request.getParameter("responsavel");
	String foneResponsavel = request.getParameter("foneResponsavel");
	
    Aluno aluno = new Aluno(nomeAluno, cpf, dataNascimento, nomePai, nomeMae, nomeResponsavel, foneResponsavel);
    AlunoDAO aDAO = new AlunoDAO();
    
    if (aDAO.incluirAluno(aluno)) {
        response.sendRedirect("cadastraAluno.jsp?pmensagem=Aluno cadastrado com sucesso");
    } else {
        response.sendRedirect("cadastraAluno.jsp?pmensagem=Problemas ao cadastrar Aluno");
    }
%>