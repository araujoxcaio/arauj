<%@page import="br.com.fatecpg.Pessoa.Database"%>
<%@page import="br.com.fatecpg.Pessoa.Clientes"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Clientes> clients = Database.getClientes();
    if (request.getParameter("detail") != null) {
        String param = request.getParameter("iDetail");
        int i = Integer.parseInt(param);
        clients.get(i);
%><%@ include file="WEB-INF/header.jspf" %>
<h2>Detalhes do Cliente</h2>
<table>
    <tr><th colspan="4">Cliente</th></tr> 
    <tr><td>ID do Cliente:</td>
        <td><%= i + 1%></td></tr>
    <tr><td>Nome:</td>
        <td><%= clients.get(i).getNome()%></td></tr>
    <tr><th colspan="4">Documentos Pessoais & Contatos</th></tr> 
    <tr><td>CPF:</td>
        <td colspan="3"><%= clients.get(i).getCpf()%></td></tr>
    <tr><td>RG:</td>
        <td><%= clients.get(i).getRg()%></td>
    <tr><td>Email:</td>
        <td colspan="3"><%= clients.get(i).getEmail()%></td></tr>
    <tr><td>Telefone:</td>
        <td colspan="3"><%= clients.get(i).getTelefone()%></td></tr>
    <tr><th colspan="4">Endereço</th></tr>
    <tr><td><%= clients.get(i).getLogr()%></td>
    <tr><td>Número:</td>
        <td><%= clients.get(i).getNumero()%></td>                        
        <td>Complemento:</td>
        <td><%= clients.get(i).getComplemento()%></td></tr>
    <tr><td>Bairro:</td>
        <td colspan="3"><%= clients.get(i).getBairro()%></td></tr>
    <tr><td>Cidade:</td><td><%= clients.get(i).getCidade()%></td>
        <td>UF:</td>
        <td><%= clients.get(i).getUf()%></tr>
    <tr><td colspan="2"><input type="submit" name="editar" value="Editar" /></td>
        <td colspan="2"><a href="clientes.jsp"><button name="Voltar">Voltar</button></a></td></tr>

</table>
</form>
</fieldset>



</div>
</div>
<%@include file="WEB-INF/footer.jspf" %>
</body>
<% }%>
</html>
