/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.Pessoa;

/**
 *
 * @author arauj
 */
public class Fornecedores extends Pessoa {
    String razao;
    String cnpj;
    
    public String getRazao(){
    return razao;
    }
    public void setRazao(String razao){
    this.razao=razao;
    }
    
    public String getCnpj(){
    return cnpj;
    }
    public void setCnpj(String cnpj){
    this.cnpj=cnpj;
    }
}

