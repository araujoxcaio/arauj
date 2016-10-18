
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>
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
            ArrayList<Clientes> clients = Database.getClientes();
        %>
        <div class="content ">
            <div class="top "></div>
            <div class="container ">
                <br />
                <br />
                <center><h2>Clientes</h2></center>
                <br />
                <table class=" table table-striped">
                    <thead>
                    <th>ID</th>
                    <th>NOME</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>E-mail</th>
                    <th>CMD</th>
                    </thead>
                    <% for (Clientes c : clients) {%>
                    <tr>
                        <td> <%= clients.indexOf(c)+1 %> </td>
                        <td> <%= c.getNome()%> </td>
                        <td> <%= c.getCpf()%> </td>
                        <td> <%= c.getRg()%> </td>
                        <td> <%= c.getEmail()%> </td>
                        <td>
                            <form action="detalhes.jsp">
                                <input type="hidden" name="iDetail" value="<%= clients.indexOf(c)%>" />
                                <input type="submit" name="detail" value="Detalhes" />
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
        <%@include file="WEB-INF/footer.jspf" %>
    </body>
</html>
