/*
 */
package examen2_ejercicio1;

import java.util.Scanner;
public class Examen2_ejercicio1 {

    
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int num;
        int leidos=0,suma=0,pares=0,min,max;
        double media;
        System.out.print("introduce num: ");
        num=entrada.nextInt();
        min=num;
        max=num;
        
        while(num !=0){
            //procesamos el numero
            leidos++;
            suma=suma+num;
            if(num%2==0){
                pares++;
            }
            if(num>max){
                max=num;
            }
            if(num<min){
                min=num;
            }
           
            
            System.out.println("Digite otro numero: ");
            num=entrada.nextInt();
        }
        if(leidos>0){
            media=(double)suma/leidos;
       
            int rango =max-min+1;
            System.out.println("El valor de leidos es:"+leidos);
            System.out.println("El valor de medio es: "+media);
            System.out.println("El valor de los pares es: "+pares);
            System.out.println("Valor medio: "+max+"Valor minimo: "+min);
            System.out.println("El valor del rango es "+rango);
        }
        else{
            System.out.println("No se han leido valores... ");
        }
    }
    
}
