<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>

<%
    ArrayList<Clientes> clients = Database.getClientes();
    if (request.getParameter("gravar") != null) {
        Clientes c = new Clientes();
        c.setNome(request.getParameter("nome"));
        c.setCpf(request.getParameter("cpf"));
        c.setRg((request.getParameter("rg")) + "-" + (request.getParameter("oe")));
        c.setTelefone(request.getParameter("telefone"));
        c.setEmail(request.getParameter("email"));
        c.setLogr((request.getParameter("opt")) + " " + (request.getParameter("end")));
        c.setNumero(request.getParameter("num"));
        c.setComplemento(request.getParameter("compl"));
        c.setBairro(request.getParameter("bairro"));
        c.setCidade(request.getParameter("cidade"));
        c.setUf(request.getParameter("uf"));
        clients.add(c);
        response.sendRedirect(request.getRequestURI());
    }

%>
<%@ include file="WEB-INF/header.jspf" %>
<h1>Inclusão de Clientes</h1>
<form method="POST">
    <div class="form">
    <form action="" method="POST">
        <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" class="form-control" name="nome" placeholder="Josevaldo Companhia Limitada" value="<%= forn.getRazao()%>" />
        </div>
        <div class="form-group">
            <label for="rg">RG</label>
            <input type="text" class="form-control" name="rg" placeholder="49.764.1474/0001-48" required value="<%= forn.getCnpj()%>"/>
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
            <label for="Endereço">Endereço</label>
            <input type="text" class="form-control" name="Endereco" placeholder="Rua Josevaldo Pereira, 123" value="<%= forn.getLogr()%>"/>
        </div>
        <input type="submit" value="Gravar" />
    </form>
</div>
        <table>
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
        </table>
    </form>
<%@include file="WEB-INF/footer.jspf" %>
