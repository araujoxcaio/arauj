package br.com.fatecpg.Pessoa;

public class Clientes extends Pessoa {
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


