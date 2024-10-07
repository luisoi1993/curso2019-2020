/*Leer 5 numeros, guardarlos en un arreglo y mostrarlos
en el orden inverso al introducido. */
package aarray_mostrarloinverso;

import java.util.Scanner;
public class Aarray_mostrarloInverso {

    
    public static void main(String[] args) {
        Scanner entrada= new Scanner(System.in);
        float numeros[]= new float[5];
        
        System.out.println("Guardando los datos del array: ");
        for(int i=0;i<5;i++){
            System.out.println("Digite un numero: ");
            numeros[i]=entrada.nextFloat();
        }
        
        System.out.println("\nImprimir los elementos del arreglo");
        for(int contador=numeros.length-1;contador>=0;contador--){
            System.out.println(contador+"\t"+numeros[contador]);
        }
    }
    
}
