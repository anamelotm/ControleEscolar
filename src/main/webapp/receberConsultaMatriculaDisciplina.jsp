<%@page import="java.util.List"%>
<%@page import="entity.Matricula"%>
<%@page import="dao.MatriculaDAO"%>
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
            int codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
            MatriculaDAO mDAO = new MatriculaDAO();
            List<Matricula> listaMatricula = mDAO.consultarMatriculasPorDisciplina(codDisciplina);
        %>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
           		<th> Cod Matricula </th>
           		<th> Aluno </th>
                <th> Descrição Disciplina </th>
                <th> Data da Matrícula </th>
               
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Matricula m: listaMatricula) { %>
                <tr>
                	<td><% out.write(String.valueOf(m.getCodMatricula())); %> </td>
                	<%	
                		int codAluno = m.getCodAluno();
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
                		
                		String descDisciplina = null;
                		for(Disciplina d : listaDisciplina){
                			if(d.getCodDisciplina() == codDisciplina){
                				descDisciplina = d.getDescDisciplina();
                				break;
                			}
                		}
                	%>
                	<td><% out.write(String.valueOf(descDisciplina)); %> </td>
                    <td><% out.write(String.valueOf(m.getDataMatricula())); %> </td>
                    <td> <a href="excluirMatricula.jsp?excluirMatricula=<%=m.getCodMatricula()%>"> <i class="far fa-trash-alt";style="color:red"></i></a></td>
                   
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>