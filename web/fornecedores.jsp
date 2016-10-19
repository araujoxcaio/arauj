<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Fornecedores"%>

<%@ include file="WEB-INF/header.jspf"%>
<%
    int i = 0;
    ArrayList<Fornecedores> forns = Database.getFornecedores();
    if (request.getParameter("c") != null) {
        int id = Integer.parseInt(request.getParameter("c"));
        forns.remove(i);
    }
%>

<h2>Fornecedores</h2>
<a href="fornForm.jsp" class="btn btn-primary">Incluir</a>
<table class=" table table-striped table-hover" id="table-fornecedores">
    <thead>
        <tr>
            <th>ID</th>
            <th>Razão Social</th>
            <th>CNPJ</th>
            <th>E-mail</th>
            <th>Telefone</th>
            <th>Endereço</th>
        </tr>
    </thead>
    <tbody>
        <% for (i = 0; i < forns.size(); i++) {%>
        <tr class="table-row-click" data-href="fornForm.jsp?c=<%= i%>">
            <td> <%= i%></td>
            <td> <%= forns.get(i).getRazao()%></td>
            <td> <%= forns.get(i).getCnpj()%></td>
            <td> <%= forns.get(i).getEmail()%></td>
            <td> <%= forns.get(i).getTelefone()%></td>
            <td> <%= forns.get(i).getEndereco()%></td>
        </tr>
        <%}%>
    </tbody>
</table>
<%@include file="WEB-INF/footer.jspf" %>
