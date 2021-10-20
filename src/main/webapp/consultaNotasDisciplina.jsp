<%@page import="java.util.List"%>

<%@page import="entity.Disciplina"%>
<%@page import="dao.DisciplinaDAO"%>

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
          
            DisciplinaDAO dDAO = new DisciplinaDAO();
        	List<Disciplina> listaDisciplina = dDAO.consultarDisciplinas();
         

        %>
        <form id="matchtech" action="receberConsultaNotasDisciplina.jsp" method="POST">
        
           <div class="selectConsulta">
           			<label>Disciplina</label>
                    <select name="codDisciplina">
                    <%
                    	for(Disciplina d : listaDisciplina){ %>
                    	<option value= "<% out.write(""+ d.getCodDisciplina());%>">
                    							<% out.write(d.getDescDisciplina()); %>
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