<%-- 
    Document   : FornForm
    Created on : Oct 16, 2016, 5:31:04 PM
    Author     : Caio
--%>
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>
<%
    // T�tulo da Inclus�o
    String acao = "Clientes - Incluir";
    // Array do database na vari�vel "clients"
    ArrayList<Clientes> clients = Database.getClientes();
    // Declara��o de vari�vel vazia
    Clientes clie = null;
    // Declarando vari�vel id  com um valor -1
    int id = -1;
    // Condi��o se a resquest do form � igual POST ele faz, ele pega o par�metro da ID.
    if (request.getMethod() == "POST") {
        id = Integer.parseInt(request.getParameter("id"));
        clie = (id == -1) ? new Clientes() : clients.get(id);
    // Condi��o de exclus�o    
            if (request.getParameter("submit").equals("Excluir")) {
                clients.remove(id);
    // Condi��o de edi��o e inclus�o da a��o. 
            }else {
                clie.setNome(request.getParameter("Nome"));
                clie.setCpf(request.getParameter("Cpf"));
                clie.setRg((request.getParameter("Rg")));
                clie.setEmail(request.getParameter("E-mail"));
                clie.setTelefone(request.getParameter("Telefone"));
                clie.setEndereco (request.getParameter("Endereco"));
                    if (id == -1) {
                    clients.add(clie);
                    }
            }
    // Resposta enviada para p�gina "clientes.jsp" .        
    response.sendRedirect("clientes.jsp");
    // Condi��o de inclus�o da a��o. 
    }else if (request.getParameter("c") == null) {
        clie = new Clientes();
        clie.setNome("");
        clie.setCpf("");
        clie.setRg("");
        clie.setEmail("");
        clie.setTelefone("");
        clie.setEndereco("");
    // P�gina de edi��o.     
    }else {
        id = Integer.parseInt(request.getParameter("c"));
        clie = clients.get(id);
        acao = "Clientes - Editar, Nome: " + clie.getNome().toString()+".";
    }
%>
<%@ include file="WEB-INF/header.jspf" %>
    <h1> <%= acao%> </h1>
        <div class="form">
        <form action="" method="POST">
            <input type="hidden" name="id" value="<%= id%>">
            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" class="form-control" name="Nome" placeholder="Robson Cleinson Andarilho C�vas" value="<%= clie.getNome()%>" />
            </div>
            <div class="form-group">
                <label for="rg">CPF</label>
                <input type="text" class="form-control" name="Cpf" placeholder="456914418-01" required value="<%= clie.getCpf()%>"/>
            </div>
            <div class="form-group">
                <label for="rg">RG</label>
                <input type="text" class="form-control" name="Rg" placeholder="49883168X" required value="<%= clie.getRg()%>"/>
            </div>
            <div class="form-group">
                <label for="E-mail">E-mail</label>
                <input type="email" class="form-control" name="E-mail" placeholder="robsoncleison@bol.com" value="<%= clie.getEmail()%>" />
            </div>
            <div class="form-group">
                <label for="Telefone">Telefone</label>
                <input type="text" class="form-control" name="Telefone" placeholder="(13) 9 9747-4545" value="<%= clie.getTelefone()%>"/>
            </div>
            <div class="form-group">
                <label for="Endere�o">Endere�o</label>
                <input type="text" class="form-control" name="Endereco" placeholder="Rua das Laranjas, 2005" value="<%= clie.getEndereco()%>"/>
            </div>
            <input class="btn btn-primary" type="submit" name="submit" value="Salvar" />
            <%
                if (acao != "Clientes - Incluir") {%>
            <button class="btn btn-danger" id="deleteForn" type="submit" name="submit" value="Excluir">
                Excluir
            </button>
            <%
                }
            %>
            <a href="clientes.jsp" class="btn btn-info">Voltar</a>
        </form>
    </div>
<%@include file="WEB-INF/footer.jspf" %>
