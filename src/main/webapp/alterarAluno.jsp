<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.AlunoDAO" %>
<%@ page import="entity.Aluno" %>
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
        		<h3>Aluno</h3>
				<label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    int codAluno = Integer.parseInt(request.getParameter("alterarAluno"));
                    AlunoDAO aDAO = new AlunoDAO();
                    Aluno aluno = aDAO.consultarAluno(codAluno);
                    String matriculado = "";
                    if(aluno.isMatriculado()){
                    	matriculado = "Ativa";
                    } else {
                    	matriculado = "Inativa";
                    }
                    
                    %>
                </label>
                	<p>Aluno: 
                	<%out.write(aluno.getNomeAluno()); %>
                	<br>
                	Matrícula: 
                	<%out.write(matriculado); %>
                	</p>
                	
                	
                	
            <form class="matchtech" action="receberAlteraAluno.jsp" method="POST">
                <h4>Alterar Responsável</h4>
                <fieldset> 
                    <label>Responsável</label>
                    <div class="nomeResponsavel">
                        <input id="nomeResponsavel" name="nomeResponsavel" type="text" maxlength="50" required size=50 >
                    </div>
                </fieldset>
                <br>
                <fieldset> 
                    <label>Fone Responsável</label>
                    <div class="foneResponsavel">
                        <input id="foneResponsavel" name="foneResponsavel" type="text" maxlength="30" required size=30 >
                    </div>
                </fieldset>
                <br>
               <input type="text" value="<%=codAluno%>" name="alterarAluno" hidden>
                
                <div>
                    <div class="button">
                        <input type="submit" value="Cadastrar" class="btn btn-success "/>
                    </div>
                    <div class="button">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
            
                        
            <form class="matchtech" action="receberAlteraStatusAluno.jsp" method="POST">
                <h4>Alterar Status</h4>
                <p></p>
                
                <label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    codAluno = Integer.parseInt(request.getParameter("alterarAluno"));            
                    %>
                </label>
                
                <div class="status">
						<label>Status Aluno</label>
						
						<select name="statusAluno">
							<option value="true">Ativa</option>
							<option value="false">Inativa</option>
						</select>
					</div>
                
               <input type="text" value="<%=codAluno%>" name="alterarAluno" hidden>
                
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