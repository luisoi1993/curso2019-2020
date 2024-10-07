/*
QUINIELA.
Codifica un programa que genere aleatoriamente una quiniela de fútbol de 15 partidos (Los resultados de cada partido
pueden ser 1, X o 2.
 */
package quiniela;

import java.util.Random;
public class Quiniela {

   
    public static void main(String[] args) {
       int cont=0,num;
       Random loto=new Random();
       
       
       
        
       while(cont<15){
            num= 1+ loto.nextInt(3);
           if(num==2){
               System.out.println("El resultado es: X");
           }
           else{
               System.out.println("El resultado es : "+num);
           }
           cont++;
       }
    }
    
}
