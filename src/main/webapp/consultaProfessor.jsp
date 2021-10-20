<%@page import="java.util.List"%>
<%@page import="entity.Professor"%>
<%@page import="dao.ProfessorDAO"%>
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
    <body>
        <%
            ProfessorDAO pDAO = new ProfessorDAO();
            List<Professor> listaProfessores = pDAO.consultarProfessores();
        %>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
           		<th> Cod Professor </th>
                <th> Nome Professor </th>
                <th> Ativo </th>
                
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Professor p: listaProfessores) { %>
                <tr>
                	<td><% out.write(String.valueOf(p.getCodProfessor())); %> </td>
                	<td><% out.write(String.valueOf(p.getNomeProfessor())); %> </td>
                	
                    <% String ativo = ""; 
                    	if(p.isAtivo()){
                    		ativo = "Ativo";
                    	} else{
                    		ativo = "Inativo";
                    	}
                    	%>
                    
                    <td><% out.write(ativo); %> </td>
                    <td> <a href="alterarProfessor.jsp?alterarProfessor=<%=p.getCodProfessor()%>" target="janela_prog"><i class="far fa-edit"     ;style="color:blue"></i></a></td>
                   
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>