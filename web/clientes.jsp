
<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>

<%
    ArrayList<Clientes> lista = Database.getClientes();
    if (request.getParameter("incluir") != null) {
        Clientes c = new Clientes();
        c.setNome(request.getParameter("nome"));
        c.setCpf(request.getParameter("cpf"));
        c.setRg((request.getParameter("rg")) + (request.getParameter("oe")));
        c.setTelefone(request.getParameter("telefone"));
        c.setEmail(request.getParameter("email"));
        c.setLogr((request.getParameter("opt")) + (request.getParameter("end")));
        c.setNumero(request.getParameter("num"));
        c.setComplemento(request.getParameter("complemento"));
        c.setBairro(request.getParameter("bairro"));
        c.setCidade(request.getParameter("cidade"));
        c.setUf(request.getParameter("uf"));
    }

%>
<%@ include file="WEB-INF/header.jspf" %>
<h1>Inclusão de Clientes</h1>
<fieldset>
    <legend>Dados do Cliente</legend>
    <form>
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
            <tr><td colspan="4"><input type="submit" name="incluir" value="Incluir" /></td></tr>
        </table>
    </form>
</fieldset>
<%@include file="WEB-INF/footer.jspf" %>
