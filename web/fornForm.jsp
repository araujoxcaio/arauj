<%-- 
    Document   : FornForm
    Created on : Oct 16, 2016, 5:31:04 PM
    Author     : Caio
--%>

<%@page import="br.com.fatecpg.Pessoa.Fornecedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Database"%>

<%
    String acao = "";
    ArrayList<Fornecedores> forns = Database.getFornecedores();
    Fornecedores forn = null;
    int id = -1;
    if (request.getMethod() == "POST") {
        forn = (id == -1) ? new Fornecedores() : forns.get(id);
        forn.setRazao(request.getParameter("RazaoSocial"));
        forn.setCnpj(request.getParameter("CNPJ"));
        forn.setEmail(request.getParameter("E-mail"));
        forn.setTelefone(request.getParameter("Telefone"));
        forn.setEndereco(request.getParameter("Endereco"));
        //forns.get(forns.indexOf(forn));
        if (id == -1) forns.add(forn);
        response.sendRedirect("fornecedores.jsp");
    } else if (request.getParameter("c") == null) {
        acao = "Fornecedores - Incluir";
        forn = new Fornecedores();
        forn.setRazao("");
        forn.setCnpj("");
        forn.setEmail("");
        forn.setTelefone("");
        forn.setEndereco("");
    } else {
        id = Integer.parseInt(request.getParameter("c"));
        forn = forns.get(id);
        acao = "Fornecedores - Editar " + forn.getRazao().toString();
    }
%>
<%@ include file="WEB-INF/header.jspf"%>
<h2> <%= acao%> </h2>
<div class="form">
    <form action="" method="POST">
        <input type="hidden" value="<%= id%>">
        <div class="form-group">
            <label for="RazaoSocial">Razão Social</label>
            <input type="text" class="form-control" name="RazaoSocial" placeholder="Josevaldo Companhia Limitada" value="<%= forn.getRazao()%>" />
        </div>
        <div class="form-group">
            <label for="CNPJ">CNPJ</label>
            <input type="text" class="form-control" name="CNPJ" placeholder="49.764.1474/0001-48" required value="<%= forn.getCnpj()%>"/>
        </div>
        <div class="form-group">
            <label for="E-mail">E-mail</label>
            <input type="email" class="form-control" name="E-mail" placeholder="josevaldo@cialtda.com" value="<%= forn.getEmail()%>" />
        </div>
        <div class="form-group">
            <label for="Telefone">Telefone</label>
            <input type="text" class="form-control" name="Telefone" placeholder="(13) 9 9747-4545" value="<%= forn.getTelefone()%>"/>
        </div>
        <div class="form-group">
            <label for="Endereco">Endereço</label>
            <input type="text" class="form-control" name="Endereco" placeholder="Rua Josevaldo Pereira, 123" value="<%= forn.getEndereco()%>"/>
        </div>
        <input class="btn btn-primary" type="submit" value="Salvar" />
        <%
            if (acao != "Fornecedores - Incluir") {%>
        <button class="btn btn-danger" id="deleteForn" type="submit" name="Excluir" value="Excluir">
            Excluir
        </button>

        <%
            }
        %>
        <a href="fornecedores.jsp" class="btn btn-info">Voltar</a>
    </form>
</div>
<%@include file="WEB-INF/footer.jspf" %>
