/*
 DIAS_SEMANA

Realiza un programa que genere un número aleatorio entre 1 y 7 e 
imprima el día de la semana correspondiente a dicho número
(1 -> lunes, 2 -> martes... 7-> domingo).
 */
package dias_semana;

import java.util.Random;
public class Dias_Semana {

   
    public static void main(String[] args) {
       Random semana=new Random();
       int num;
       
       num=1+semana.nextInt(7);
       
       switch(num){
           case 1: 
               System.out.println("Lunes");
               break;
           case 2:
               System.out.println("Martes");
               break;
           case 3: 
               System.out.println("Miercoles");
               break;
           case 4:
               System.out.println("Jueves");
               break;
           case 5:
               System.out.println("Viernes");
               break;
           case 6: 
               System.out.println("Sabado");
               break;
           case 7:
               System.out.println("Domingo");
               break;
           default: 
               break;
               
                    
           
       }
    }
    
}
