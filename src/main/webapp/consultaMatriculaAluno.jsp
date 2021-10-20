<%@page import="java.util.List"%>

<%@page import="entity.Aluno"%>
<%@page import="dao.AlunoDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE ESCOLAR - CAPGEMINI</title>
        <link rel="stylesheet" href="Styles/padraotelagrid.css">
        <!-- bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <!-- Fontawesome' -->
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body style=margin:10px>
        <%
          
            AlunoDAO aDAO = new AlunoDAO();
            List<Aluno> listaAluno = aDAO.consultarAlunos();

        %>
        <form id="matchtech" action="receberConsultaMatriculaAluno.jsp" method="POST">
        
           <div class="selectConsulta">
           			<label>Aluno</label>
                    <select name="codAluno">
                    <%
                    	for(Aluno a : listaAluno){ %>
                    	<option value= "<% out.write(""+ a.getCodAluno());%>">
                    							<% out.write(a.getNomeAluno()); %>
                    	</option>
                    <%} %>
                    </select>
           </div> 
           <br>
           <div class="button">
                        <input type="submit" value="Consultar" class="btn btn-success "/>
            </div>
        </form>
           
           	
    </body>
</html>