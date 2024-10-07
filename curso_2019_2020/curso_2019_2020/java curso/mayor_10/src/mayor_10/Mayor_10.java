/*
 MAYOR 10.
Haz un programa que pida 10 números al usuario y calcule cuál es el  mayor valor que ha introducido el usuario.

 */
package mayor_10;

import java.util.Scanner;
public class Mayor_10 {

   
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int num,mayor=0,cont=0;
        
        System.out.println("Digite un numero: ");
        num=entrada.nextInt();
        
        while(cont<10){
            cont++;
            if(num>mayor){
                mayor=num;
            }
            System.out.println("Digite otro numero: ");
            num=entrada.nextInt();
        }
        
        System.out.println("El mayor numero introducido es: "+mayor);
    }
    
}
