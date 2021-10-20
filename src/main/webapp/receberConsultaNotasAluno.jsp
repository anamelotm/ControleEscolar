<%@page import="java.util.List"%>
<%@page import="entity.Notas"%>
<%@page import="dao.NotasDAO"%>
<%@page import="entity.Aluno"%>
<%@page import="dao.AlunoDAO"%>
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
    <body>
        <%
            DisciplinaDAO dDAO = new DisciplinaDAO();
            List<Disciplina> listaDisciplina = dDAO.consultarDisciplinas();
            AlunoDAO aDAO = new AlunoDAO();
            List<Aluno> listaAluno = aDAO.consultarAlunos();
            int codAluno = Integer.parseInt(request.getParameter("codAluno"));
            NotasDAO nDAO = new NotasDAO();
            List<Notas> listaNotas = nDAO.consultarNotaPorAluno(codAluno);
        %>
        <table id="consulta" >
            <!-- cabecalho da tabela -->
            <thead>
           		<th> Cod Nota </th>
           		<th> Aluno </th>
                <th> Descrição Disciplina </th>
                <th> Valor Nota </th>
               
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Notas n: listaNotas) { %>
                <tr>
                	<td><% out.write(String.valueOf(n.getCodNota())); %> </td>
                	<%
                		String nomeAluno = null;
                		for(Aluno a : listaAluno){
                			if(a.getCodAluno() == codAluno){
                				nomeAluno = a.getNomeAluno();
                				break;
                			}
                		}
                	%>
                	<td><% out.write(String.valueOf(nomeAluno)); %> </td>
                	<%
                		int codDisciplina = n.getCodDisciplina();
                		String descDisciplina = null;
                		for(Disciplina d : listaDisciplina){
                			if(d.getCodDisciplina() == codDisciplina){
                				descDisciplina = d.getDescDisciplina();
                				break;
                			}
                		}
                	%>
                	<td><% out.write(String.valueOf(descDisciplina)); %> </td>
                    <td><% out.write(String.valueOf(n.getVlrNota())); %> </td>
                    
                    <td> <a href="excluirNota.jsp?excluirNota=<%=n.getCodNota()%>"> <i class="far fa-trash-alt";style="color:red"></i></a></td>
                   
                </tr>
                <%}%>
            </tbody>
            <tfoot style="text-align: end;">
            	<td colspan="2" ><strong>Média</strong></td>
            	<td colspan="2" ><strong><%out.write(String.valueOf(nDAO.calcularMediaAluno(codAluno))); %></strong></td>
            </tfoot>
        </table>
    </body>
</html>