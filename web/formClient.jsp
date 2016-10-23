<%-- 
    Document   : FornForm
    Created on : Oct 16, 2016, 5:31:04 PM
    Author     : Caio
--%>
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>

<%
    String acao = "";
    ArrayList<Clientes> clients = Database.getClientes();
    Clientes clie = null;
    int id = -1;
    if (request.getMethod() == "POST") {
        clie = (id == -1) ? new Clientes() : clients.get(id);
        clie.setNome(request.getParameter("Nome"));
        clie.setCpf(request.getParameter("Cpf"));
        clie.setRg((request.getParameter("Rg")));
        clie.setEmail(request.getParameter("E-mail"));
        clie.setTelefone(request.getParameter("Telefone"));
        clie.setEndereco (request.getParameter("Endereco"));
        /*clients.add(clie);
        response.sendRedirect(request.getRequestURI());*/
        if (id == -1) clients.add(clie);
        response.sendRedirect("clientes.jsp");
    }else if (request.getParameter("c") == null) {
        acao = "Clientes - Incluir";
        clie = new Clientes();
        clie.setNome("");
        clie.setCpf("");
        clie.setRg("");
        clie.setEmail("");
        clie.setTelefone("");
        clie.setEndereco("");
    }else {
        id = Integer.parseInt(request.getParameter("c"));
        clie = clients.get(id);
        acao = "Clientes - Editar " + clie.getCpf().toString();
    }

%>
<%@ include file="WEB-INF/header.jspf" %>
<h1> <%= acao%> </h1>
    <div class="form">
    <form action="" method="POST">
        <input type="hidden" value="<%= id%>">
        <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" class="form-control" name="Nome" placeholder="Josevaldo Companhia Limitada" value="<%= clie.getNome()%>" />
        </div>
        <div class="form-group">
            <label for="rg">CPF</label>
            <input type="text" class="form-control" name="Cpf" placeholder="49.764.1474/0001-48" required value="<%= clie.getCpf()%>"/>
        </div>
        <div class="form-group">
            <label for="rg">RG</label>
            <input type="text" class="form-control" name="Rg" placeholder="49.764.1474/0001-48" required value="<%= clie.getRg()%>"/>
        </div>
        <div class="form-group">
            <label for="E-mail">E-mail</label>
            <input type="email" class="form-control" name="E-mail" placeholder="josevaldo@cialtda.com" value="<%= clie.getEmail()%>" />
        </div>
        <div class="form-group">
            <label for="Telefone">Telefone</label>
            <input type="text" class="form-control" name="Telefone" placeholder="(13) 9 9747-4545" value="<%= clie.getTelefone()%>"/>
        </div>
        <div class="form-group">
            <label for="Endereço">Endereço</label>
            <input type="text" class="form-control" name="Endereco" placeholder="Rua Josevaldo Pereira, 123" value="<%= clie.getEndereco()%>"/>
        </div>
        <input class="btn btn-primary" type="submit" value="Salvar" />
        <%
            if (acao != "Clientes - Incluir") {%>
        <button class="btn btn-danger" id="deleteForn">
            Excluir
        </button>
        <%
            }
        %>
        <a href="clientes.jsp" class="btn btn-info">Voltar</a>
    </form>
</div>
        <!--<table>
            <tr><th colspan="4">Documentos Pessoais & Contatos</th></tr> 
            <tr><td>Nome:</td>
                <td colspan="3"><input type="text" name="nome"/></td></tr>
            <tr><td>CPF:</td>
                <td colspan="3"><input type="text" name="cpf"/></td></tr>
            <tr><td>RG:</td>
                <td><input type="text" name="rg"/></td>
                <td>Órgão Emissor:</td>
                <td><input type="text" name="oe"/></td></tr>
            <tr><td>Email:</td>
                <td colspan="3"><input type="text" name="email"/></td></tr>
            <tr><td>Telefone:</td>
                <td colspan="3"><input type="text" name="telefone"/></td></tr>
            <tr><th colspan="4">Endereço</th></tr>
            <tr><td><select name="opt">
                        <option value="Rua" selected>Rua</option>
                        <option value="Avenida">Avenida</option>
                        <option value="Travessa">Travessa</option>
                        <option value="Praça">Praça</option>                                
                    </select></td>
                <td colspan="3"><input type="text" name="end"/></td></tr>
            <tr><td>Número:</td>
                <td><input type="text" name="num"/></td>                        
                <td>Complemento:</td>
                <td><input type="text" name="compl"/></td></tr>
            <tr><td>Bairro:</td>
                <td colspan="3"><input type="text" name="bairro"/></td></tr>
            <tr><td>Cidade:</td><td><input type="text" name="cidade"/></td>
                <td>UF:</td>
                <td><input type="text" name="uf"/></td></tr>
            <tr><td colspan="4"><input type="submit" name="gravar" value="Gravar" /></td></tr>
        </table>-->
<%@include file="WEB-INF/footer.jspf" %>
