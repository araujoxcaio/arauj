package br.com.fatecpg.Pessoa;

import java.util.ArrayList;

/**
 *
 * @author arauj
 */
public class Database {
    private static ArrayList<Clientes> 
    clientes = new ArrayList<>();            
    
    public static ArrayList<Clientes> getClientes(){
        return clientes;
    }
    private static ArrayList<Fornecedores> 
    fornecedores = new ArrayList<>();            
    
    public static ArrayList<Fornecedores> getFornecedores(){
        return fornecedores;
    }
}

