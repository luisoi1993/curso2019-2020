
package Coches;

import java.util.Scanner;

public class Main {
    public static int indiceCocheMBarato(Vehiculo coches[]){
        float precio;
        int indice=0;
        
        precio=coches[0].getPrecio();
        for(int i=1;i<coches.length;i++){
            if(coches[i].getPrecio()<precio){
                precio = coches[i].getPrecio();
                indice=i;
            }
        }
        
        return indice;
    }
    public static void main(String [] args){
        Scanner entrada=new Scanner(System.in);
        String marca, modelo;
        float precio;
        int numeroVehiculos,indiceBarato;
        
        System.out.println("Digite el numero de vehiculos: ");
        numeroVehiculos=entrada.nextInt();
        
        Vehiculo coches[]=new Vehiculo[numeroVehiculos];
        
        for(int i=0;i<numeroVehiculos;i++){
            System.out.println("\nDigite las caracteristicas del coche "+(i+1)+":");
            System.out.print("Digite la marca del coche: ");
            marca=entrada.nextLine();
            System.out.print("Introduzca modelo: ");
            modelo=entrada.nextLine();
            System.out.print("Introduzca el precio: ");
            precio=entrada.nextFloat();
            
            coches[i]=new Vehiculo(marca,modelo,precio);
        }     
        
        indiceBarato=indiceCocheMBarato(coches);
        System.out.println("\n El coche mas barato es: ");
        System.out.println(coches[indiceBarato])
    }
    
    
}
