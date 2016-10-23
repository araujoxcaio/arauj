
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>

<%@ include file="WEB-INF/header.jspf" %>
<%
    int i = 0;
    ArrayList<Clientes> clients = Database.getClientes();
    if (request.getParameter("c") != null) {
        int id = Integer.parseInt(request.getParameter("c"));
        clients.remove(i);
    }
%>
<h2>Clientes</h2>
<a href="formClient.jsp" class="btn btn-primary">Incluir</a>
<table class=" table table-striped table-hover" id="table-clientes">
    <thead>
    <th>ID</th>
    <th>Nome</th>
    <th>CPF</th>
    <th>RG</th>
    <th>E-mail</th>
    <th>Telefone</th>
    <th>Endereço</th>
</thead>
   <tbody>
        <% for (i = 0; i < clients.size(); i++) {%>
        <tr class="table-row-click" data-href="formClient.jsp?c=<%= i%>">
            <td> <%= i%></td>
            <td> <%= clients.get(i).getNome()%></td>
            <td> <%= clients.get(i).getCpf()%></td>
            <td> <%= clients.get(i).getRg()%></td>
            <td> <%= clients.get(i).getEmail()%></td>
            <td> <%= clients.get(i).getTelefone()%></td>
            <td> <%= clients.get(i).getEndereco()%></td>
        </tr>
        <%}%>
    </tbody>
</table>
<%@include file="WEB-INF/footer.jspf" %>
