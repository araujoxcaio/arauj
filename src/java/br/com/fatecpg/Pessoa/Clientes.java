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
public class Clientes extends Endereco {
    private String cpf;
    private String rg;
    
    public String getCpf(){
    return cpf;
    }
    public void setCpf(String cpf){
    this.cpf=cpf;
    }
    
    public String getRg(){
    return rg;
    }
    public void setRg(String rg){
    this.rg=rg;
    }
}


