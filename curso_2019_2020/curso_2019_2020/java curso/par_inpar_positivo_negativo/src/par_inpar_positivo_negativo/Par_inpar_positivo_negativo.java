/* Programa en el que declaras una variable de tipo int, le asignas un valor
y el programa te informa de si es un número par o impar y positivo o negativo.*/


package par_inpar_positivo_negativo;

import java.util.Scanner;

public class Par_inpar_positivo_negativo {

    
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int numero;
        
        System.out.println("Digite un numero.");
        numero=entrada.nextInt();
        
        if(numero==0){
            System.out.println("El numero es 0");
        }
        else{
            
            if(numero%2==0){
                System.out.println("El numero es par y ");
            }
            else{
                System.out.println("El numero es inpar y ");
            }
            if(numero>0){
                System.out.print("positivo");
            }
            else if(numero<0){
                System.out.print("negativo");
            }
        
            
        }
       
        
    }
    
}
