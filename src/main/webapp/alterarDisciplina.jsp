<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.DisciplinaDAO" %>
<%@ page import="entity.Disciplina" %>
<%@ page import="dao.ProfessorDAO" %>
<%@ page import="entity.Professor" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE ESCOLAR - CAPGEMINI</title>
        <link   rel ="stylesheet" href="Styles/padraotelacadastro2.css">
        <script src ="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    
    <body> 
        <div class="container">
        		<h3>Disciplina</h3>
				<label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    int codDisciplina = Integer.parseInt(request.getParameter("alterarDisciplina"));
                    DisciplinaDAO dDAO = new DisciplinaDAO();
                    Disciplina disciplina = dDAO.consultarDisciplina(codDisciplina);
                    String ativa = "";
                    if(disciplina.isAtiva()){
                    	ativa = "Ativa";
                    } else {
                    	ativa = "Inativa";
                    }
                    
                    ProfessorDAO pDAO = new ProfessorDAO();
                    List<Professor> listaProfessores = pDAO.consultarProfessores();
                    %>
                </label>
                	<p>Disciplina: 
                	<%out.write(disciplina.getDescDisciplina()); %>
                	<br>
                	Ativa: 
                	<%out.write(ativa); %>
                	</p>
                	
                	
                	
            <form class="matchtech" action="receberAlteraDisciplina.jsp" method="POST">
                <h4>Alterar Disciplina</h4>
                <fieldset> 
                    <label>Descricação</label>
                    <div class="descricao">
                        <input id="descricao" name="descricao" type="text" maxlength="50" required size=50 >
                    </div>
                </fieldset>
                <br>
                <fieldset> 
                    <label>Carga Horária</label>
                    <div class="cargaHoraria">
                        <input id="cargaHoraria" name="cargaHoraria" type="text" maxlength="5" required size=5 >
                    </div>
                </fieldset>
                <br>
                
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
                    
               <input type="text" value="<%=codDisciplina%>" name="alterarDisciplina" hidden>
                
                <div>
                    <div class="button">
                        <input type="submit" value="Cadastrar" class="btn btn-success "/>
                    </div>
                    <div class="button">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
            
                        
            <form class="matchtech" action="receberAlteraStatusDisciplina.jsp" method="POST">
                <h4>Alterar Status</h4>
                <p></p>
                
                <label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    codDisciplina = Integer.parseInt(request.getParameter("alterarDisciplina"));            
                    %>
                </label>
                
                <div class="status">
						<label>Status Disciplina</label>
						
						<select name="statusDisciplina">
							<option value="true" selected>Ativa</option>
							<option value="false">Inativa</option>
						</select>
					</div>
                
               <input type="text" value="<%=codDisciplina%>" name="alterarDisciplina" hidden>
                
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