/*Construir un programa que dada una marca, modelo y precio, imprima 
las propiedades del vehiculo mas barato. Para ello, se deberan leer por 
teclado las caracteristicas de cada vehiculo y crear una clase que 
represente a cada uno de ellos. */

package Coches;


public class Vehiculo {
    private String marca;
    private String modelo;
    private float precio;
    

    
    public Vehiculo(String marca,String modelo,float precio){
        this.marca=marca;
        this.modelo=modelo;
        this.precio=precio;
    }
    
    public float getPrecio(){
        return precio;
    }
    
    public String MostrarDatos(){
       return "Marca: "+marca+"\nmodelo: "+modelo+"\nprecio: "+precio;
    }
    
}
