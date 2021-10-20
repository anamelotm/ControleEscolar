<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.ProfessorDAO" %>
<%@ page import="entity.Professor" %>
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
        		<h3>Professor</h3>
				<label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    int codProfessor = Integer.parseInt(request.getParameter("alterarProfessor"));
                    ProfessorDAO pDAO = new ProfessorDAO();
                    Professor professor = pDAO.consultarProfessor(codProfessor);
                    String ativo = "";
                    if(professor.isAtivo()){
                    	ativo = "Ativo";
                    } else {
                    	ativo = "Inativo";
                    }
                    
                    %>
                </label>
                	<p>Professor: 
                	<%out.write(professor.getNomeProfessor()); %>
                	<br>
                	Ativo: 
                	<%out.write(ativo); %>
                	</p>
                	
                	
                	
            <form class="matchtech" action="receberAlteraProfessor.jsp" method="POST">
                <h4>Alterar Nome</h4>
                <fieldset> 
                    <label>Nome</label>
                    <div class="nomeProfessor">
                        <input id="nomeProfessor" name="nomeProfessor" type="text" maxlength="50" required size=50 >
                    </div>
                </fieldset>
                <br>
                
               <input type="text" value="<%=codProfessor%>" name="alterarProfessor" hidden>
                
                <div>
                    <div class="button">
                        <input type="submit" value="Cadastrar" class="btn btn-success "/>
                    </div>
                    <div class="button">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
            
                        
            <form class="matchtech" action="receberAlteraStatusProfessor.jsp" method="POST">
                <h4>Alterar Status</h4>
                <p></p>
                
                <label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    codProfessor = Integer.parseInt(request.getParameter("alterarProfessor"));                 
                    %>
                </label>
                
                <div class="status">
						<label>Status Professor</label>
						
						<select name="statusProfessor">
							<option value="true" selected>Ativo</option>
							<option value="false">Inativo</option>
						</select>
					</div>
                
               <input type="text" value="<%=codProfessor%>" name="alterarProfessor" hidden>
                
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