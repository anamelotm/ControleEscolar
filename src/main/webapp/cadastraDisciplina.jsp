<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="entity.Professor" %>
<%@page import="dao.ProfessorDAO" %>

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
            <form id="matchtech" action="receberDadosDisciplina.jsp" method="POST">
                <h3>Cadastro de Disciplina</h3>
                <p></p>
                
                <%
                	ProfessorDAO pDAO = new ProfessorDAO();
                	List<Professor> listaProfessores = pDAO.consultarProfessores();
                %>
                
                <label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    %>
                </label>
                
                <fieldset> 
                	<div>
                    <label>Professor</label>
                    <select name="codProfessor">
                    <%
                    	for(Professor p : listaProfessores){ %>
                    		<option value= "<% out.write(""+p.getCodProfessor());%>">
                    							<% out.write(p.getNomeProfessor()); %>
                    			</option>
                    <%} %>
                    </select>
                    </div>
                    
                    <label>Descrição</label>
                    <div class="descDisciplina">
                        <input id="descDisciplina" name="descDisciplina" type="text" maxlength="50" required size=50 >
                    </div>
                    
                    <label>Carga Horária</label>
                    <div class="cargaHoraria">
                        <input id="cargaHoraria" name="cargaHoraria" type="text" maxlength="5" required size=5 >
                    </div>
                    
                    
                </fieldset>
                <br>
                
               
                
                <div>
                    <div class="button">
                        <input type="submit" value="Cadastrar" class="btn btn-success "/>
                    </div>
                    <div class="button">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>