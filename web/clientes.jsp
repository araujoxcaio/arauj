
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>

<%@ include file="WEB-INF/header.jspf" %>
<%
    ArrayList<Clientes> clients = Database.getClientes();
%>
<h2>Clientes</h2>
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
    <td> <%= clients.indexOf(c) + 1%> </td>
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
<%@include file="WEB-INF/footer.jspf" %>
