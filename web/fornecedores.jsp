<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Fornecedores"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css"> 
        <title>Fornecedores</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    </head>
    <body>
        <%@ include file="WEB-INF/header.jspf" %>
        <% 
        int i =0;
        ArrayList<Fornecedores> forns = Database.getFornecedores();
        if (request.getParameter("c") != null){
            int id  = Integer.parseInt(request.getParameter("c"));
            forns.remove(i);
        }
        %>
        <div class="content ">
        <div class="top ">    </div>
            <div class="container ">
                <br />
                <br />
                <center><<h2>Fornecedores</h2></center>
                <br />
                <table class=" table table-striped">
                    <thead>
                            <th>Nº</th>
                            <th>Razão Social</th>
                            <th>CNPJ</th>
                            <th>E-mail</th>
                            <th>Telefone</th>
                            <th>Endereço</th>
                            <th>Ações</th>
                    </thead>
                    <% for( i =0; i < forns.size(); i++){ %>
                    <tr>
                        <td> <%= i %></td>
                        <td> <%= forns.get(i).getRazao() %></td>
                        <td> <%= forns.get(i).getCnpj()%></td>
                        <td> <%= forns.get(i).getEmail() %></td>
                        <td> <%= forns.get(i).getTelefone() %></td>
                        <td> <%= forns.get(i).getLogr() %></td>
                        <td> 
                            <a href="FornDatails.jsp?c=<%= i %>">Detalhes</a> | 
                            <a href="fornForm.jsp?c=<%= i %>">Editar</a> | 
                            <a href="fornecedores.jsp?c=<%= i %>">Deletar</a>
                        </td>
                        
                    </tr>
                     <%} %>
                </table>
            </div>
        </div>
        <%@include file="WEB-INF/footer.jspf" %>
    </body>
</html>
