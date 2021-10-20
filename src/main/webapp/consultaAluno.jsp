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
    <body>
        <%
            AlunoDAO aDAO = new AlunoDAO();
            List<Aluno> listaAlunos = aDAO.consultarAlunos();
        %>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
           		<th> Cod Aluno </th>
                <th> Aluno </th>
                <th> CPF Aluno </th>
                <th> Data de Nascimento </th>
                <th> Data de Matricula </th>
                <th> Nome do Pai </th>
                <th> Nome da Mãe </th>
                <th> Responsável </th>
                <th> Fone Responsável </th>
                <th> Matrícula </th>
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Aluno a: listaAlunos) { %>
                <tr>
                	<td><% out.write(String.valueOf(a.getCodAluno())); %> </td>
                	<td><% out.write(String.valueOf(a.getNomeAluno())); %> </td>
                	<td><% out.write(String.valueOf(a.getCpfAluno())); %> </td>
                    <td><% out.write(String.valueOf(a.getDataNascimento())); %> </td>
                    <td><% out.write(String.valueOf(a.getDataMatricula())); %> </td>
                    <td><% out.write(String.valueOf(a.getNomePai())); %> </td>
                    <td><% out.write(String.valueOf(a.getNomeMae())); %> </td>
                    <td><% out.write(String.valueOf(a.getResponsavel())); %> </td>
                    <td><% out.write(String.valueOf(a.getFoneResponsavel())); %> </td>
                    <% String matriculado = ""; 
                    	if(a.isMatriculado()){
                    		matriculado = "Ativa";
                    	} else{
                    		matriculado = "Inativa";
                    	}
                    	%>
                    
                    <td><% out.write(matriculado); %> </td>
                    <td> <a href="alterarAluno.jsp?alterarAluno=<%=a.getCodAluno()%>" target="janela_prog"><i class="far fa-edit"     ;style="color:blue"></i></a></td>
                   
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>