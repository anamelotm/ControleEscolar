<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <form id="matchtech" action="receberDadosAluno.jsp" method="POST">
                <h3>Cadastro de Alunos</h3>
                <p></p>
                
                <label class="mensagem" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));  
                    %>
                </label>
                
                <fieldset> 
                    <label>Nome</label>
                    <div class="nomeAluno">
                        <input id="nomeAluno" name="nomeAluno" type="text" maxlength="50" required size=50 >
                    </div>
                </fieldset>
                <br>
                
                <fieldset> 
                    <label>CPF</label>
                    <div class="cpfAluno">
                        <input id="cpfAluno" name="cpfAluno" type="text" maxlength="20" required size=20 >
                    </div>
                </fieldset>
                <br>
                
                <fieldset> 
                    <label>Data de Nascimento</label>
                    <div class="dataNascimento">
                        <input id="dataNascimento" name="dataNascimento" type="text" maxlength="30" required size=30 placeholder="DD/MM/YYYY">
                    </div>
                </fieldset>
                <br>
                
                <fieldset> 
                    <label>Nome do Pai</label>
                    <div class="nomePai">
                        <input id="nomePai" name="nomePai" type="text" maxlength="50" required size=50>
                    </div>
                </fieldset>
                <br>
                
                <fieldset> 
                    <label>Nome da Mãe</label>
                    <div class="nomeMae">
                        <input id="nomeMae" name="nomeMae" type="text" maxlength="50" required size=50>
                    </div>
                </fieldset>
                <br>
                
                <fieldset> 
                    <label>Nome do Responsável</label>
                    <div class="responsavel">
                        <input id="responsavel" name="responsavel" type="text" maxlength="50" required size=50>
                    </div>
                </fieldset>
                <br>
                
                <fieldset> 
                    <label>Telefone do Responsável</label>
                    <div class="foneResponsavel">
                        <input id="foneResponsavel" name="foneResponsavel" type="text" maxlength="20" required size=20 placeholder="(XX)XXXXX-XXXX">
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