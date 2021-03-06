<%-- 
    Document   : FornForm
    Created on : Oct 16, 2016, 5:31:04 PM
    Author     : Caio
--%>
<%@page import="br.com.fatecpg.Pessoa.Fornecedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%
    // T�tulo da Inclus�o
    String acao = "Fornecedores - Incluir";
    // Array do database na vari�vel "forns"
    ArrayList<Fornecedores> forns = Database.getFornecedores();
    // Declara��o de vari�vel vazia
    Fornecedores forn = null;
    // Declarando vari�vel id  com um valor -1
    int id = -1;
    // Condi��o se a resquest do form � igual POST ele faz, ele pega o par�metro da ID.
    if (request.getMethod() == "POST") {
        id = Integer.parseInt(request.getParameter("id"));
        forn = (id == -1) ? new Fornecedores() : forns.get(id);
    // Condi��o de exclus�o    
            if (request.getParameter("submit").equals("Excluir")) {
                forns.remove(id);
    // Condi��o de edi��o e inclus�o da a��o.
            }else {
                forn.setRazao(request.getParameter("RazaoSocial"));
                forn.setCnpj(request.getParameter("CNPJ"));
                forn.setEmail(request.getParameter("E-mail"));
                forn.setTelefone(request.getParameter("Telefone"));
                forn.setEndereco(request.getParameter("Endereco"));
                    if (id == -1) {
                        forns.add(forn);
                    }
            }
    // Resposta enviada para p�gina "fornecedores.jsp"  
        response.sendRedirect("fornecedores.jsp");
    // Condi��o de inclus�o da a��o.
    } else if (request.getParameter("c") == null) {
        forn = new Fornecedores();
        forn.setRazao("");
        forn.setCnpj("");
        forn.setEmail("");
        forn.setTelefone("");
        forn.setEndereco("");
    // P�gina de edi��o.
    } else {
        id = Integer.parseInt(request.getParameter("c"));
        forn = forns.get(id);
        acao = "Fornecedores - Editar " + forn.getRazao().toString();
    }
%>
<%@ include file="WEB-INF/header.jspf"%>
    <h2> <%= acao%> </h2>
    <div class="form">
        <form method="POST">
            <input type="hidden" name="id" value="<%= id%>">
            <div class="form-group">
                <label for="RazaoSocial">Raz�o Social</label>
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
                <label for="Endereco">Endere�o</label>
                <input type="text" class="form-control" name="Endereco" placeholder="Rua Josevaldo Pereira, 123" value="<%= forn.getEndereco()%>"/>
            </div>
            <input class="btn btn-primary" type="submit" name="submit" value="Salvar" />
            <%
                if (acao != "Fornecedores - Incluir") {%>
            <button class="btn btn-danger" id="deleteForn" type="submit" name="submit" value="Excluir">
                Excluir
            </button>
            <%
                }
            %>
            <a href="fornecedores.jsp" class="btn btn-info">Voltar</a>
        </form>
    </div>
<%@include file="WEB-INF/footer.jspf" %>
