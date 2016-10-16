<%-- 
    Document   : FornForm
    Created on : Oct 16, 2016, 5:31:04 PM
    Author     : Caio
--%>

<%@page import="br.com.fatecpg.Pessoa.Fornecedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% 
    String acao = "";
        ArrayList<Fornecedores> forns = Database.getFornecedores();
        Fornecedores forn = null;
    if(request.getMethod() == "POST"){
        forn = new Fornecedores();
        forn.setRazao(request.getParameter("RazaoSocial"));
        forn.setCnpj(request.getParameter("CNPJ"));
        forn.setEmail(request.getParameter("E-mail"));
        forn.setTelefone(request.getParameter("Telefone"));
        forn.setLogr(request.getParameter("Endereco"));
        forns.get(forns.indexOf(forn));
        forns.add(forn);
        response.sendRedirect("fornecedores.jsp");
    } else {   
        if(request.getParameter("c") == null){
            acao = "Incluir Fornecedor";
            forn = new Fornecedores();
            forn.setRazao("");
            forn.setCnpj("");
            forn.setEmail("");
            forn.setTelefone("");
            forn.setLogr("");
         } else {
            int id = Integer.parseInt(request.getParameter("c"));
            forn = forns.get(id);
            acao = "Editar " + forn.getRazao().toString();
        }
    }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= acao %></title>
    </head>
    <body>    
        <%@include file="WEB-INF/header.jspf" %>
        <div class="content ">
            <div class="top ">
            </div>
            <div class="container ">
                <br>
                <br>
                <center><h2> <%= acao %> </h2></center>
                <br>
                <div class="form">
                  <form action="" method="POST">
                    <div class="form-group">
                      <label for="Razão Social">Razão Social</label>
                      <input type="text" class="form-control" name="RazaoSocial" placeholder="Josevaldo Companhia Limitada" value="<%= forn.getRazao() %>" />
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
                      <input type="text" class="form-control" name="Telefone" placeholder="(13) 9 9747-4545" value="<%= forn.getTelefone() %>"/>
                    </div>
                    <div class="form-group">
                      <label for="Endereço">Endereço</label>
                      <input type="text" class="form-control" name="Endereco" placeholder="Rua Josevaldo Pereira, 123" value="<%= forn.getLogr()%>"/>
                    </div>
                    <input type="submit" value="Gravar" />
                  </form>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/footer.jspf" %>
    </body>
</html>
