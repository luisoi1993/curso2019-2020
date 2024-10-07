// Pedir 10 números, y mostrar al final si se ha introducido alguno negativo

package pkg10numeros_algunonegativo;

import java.util.Scanner;

public class Main {

  
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int numero;
        boolean negativo=false;
        
        for(int i=0;i<10;i++){
            System.out.println("Digite un numero: ");
            numero=entrada.nextInt();
            
            if(numero<0){
                negativo=true;
            }
        }
        if(negativo==true){
            System.out.println("Si hay uno o mas numeros negativos.");
        }
        else{
            System.out.println("No hay numeros negativos.");
        }
    }
    
}
