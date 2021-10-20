<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="entity.Aluno" %>
<%@page import="dao.AlunoDAO" %>
<%@page import="entity.Disciplina" %>
<%@page import="dao.DisciplinaDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE ESCOLAR - CAPGEMINI</title>
        <link   rel ="stylesheet" href="Styles/padraotelacadastro.css">
        <script src ="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    
    <body> 
        <div class="container">
            <form id="matchtech" action="receberDadosNota.jsp" method="POST">
                <h3>Notas</h3>
                <p></p>
                
                <%
                	AlunoDAO aDAO = new AlunoDAO();
                	List<Aluno> listaAlunos = aDAO.consultarAlunos();
                	DisciplinaDAO dDAO = new DisciplinaDAO();
               		List<Disciplina> listaDisciplinas = dDAO.consultarDisciplinas();
                %>
                
                <label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    %>
                </label>
                
                <fieldset> 
                   <div>
                    <label>Aluno</label>
                    <select name="codAluno">
                    <%
                    	for(Aluno a : listaAlunos){ %>
                    		<option value= "<% out.write(""+ a.getCodAluno());%>">
                    							<% out.write(a.getNomeAluno()); %>
                    			</option>
                    <%} %>
                    </select>
                    </div>
                </fieldset>

                
                <fieldset> 
					<div>
                    <label>Disciplina</label>
                    <select name="codDisciplina">
                    <%
                    	for(Disciplina d : listaDisciplinas){ %>
                    		<option value= "<% out.write(""+ d.getCodDisciplina());%>">
                    							<% out.write(d.getDescDisciplina()); %>
                    			</option>
                    <%} %>
                    </select>
                    </div>
                </fieldset>
                
                <label>Valor Nota</label>
                    <div class="vlrNota">
                        <input id="vlrNota" name="vlrNota" type="text" maxlength="10" required size=10 >
                    </div>

                
                <div>
                    <div class="button">
                        <input type="submit" value="Incluir" class="btn btn-success "/>
                    </div>
                    <div class="button">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>