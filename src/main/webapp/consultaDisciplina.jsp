<%@page import="java.util.List"%>
<%@page import="entity.Disciplina"%>
<%@page import="dao.DisciplinaDAO"%>
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
            DisciplinaDAO dDAO = new DisciplinaDAO();
            List<Disciplina> listaDisciplina = dDAO.consultarDisciplinas();
            ProfessorDAO pDAO = new ProfessorDAO();
            List<Professor> listaProfessor = pDAO.consultarProfessores();
        %>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
           		<th> Cod Disciplina </th>
                <th> Descrição Disciplina </th>
                <th> Professor </th>
                <th> Carga Horária </th>
                <th> Ativa </th>
               
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Disciplina d: listaDisciplina) { %>
                <tr>
                	<td><% out.write(String.valueOf(d.getCodDisciplina())); %> </td>
                	<td><% out.write(String.valueOf(d.getDescDisciplina())); %> </td>
                	<%
                		int codProfessor = d.getCodProfessor();
                		String nomeProfessor = null;
                		for(Professor p : listaProfessor){
                			if(p.getCodProfessor() == codProfessor){
                				nomeProfessor = p.getNomeProfessor();
                				break;
                			}
                		}
                	%>
                	<td><% out.write(String.valueOf(nomeProfessor)); %> </td>
                	<td><% out.write(String.valueOf(d.getCargaHoraria())); %> </td>
                    <% String ativa = ""; 
                    	if(d.isAtiva()){
                    		ativa = "Ativa";
                    	} else{
                    		ativa = "Inativa";
                    	}
                    	%>
                    
                    <td><% out.write(ativa); %> </td>
                    <td> <a href="alterarDisciplina.jsp?alterarDisciplina=<%=d.getCodDisciplina()%>" target="janela_prog"><i class="far fa-edit"     ;style="color:blue"></i></a></td>
                   
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>