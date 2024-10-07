/* Pedir 10 números. Mostrar la media de los números positivos, 
la media de los números negativos y la cantidad de ceros. */

package pkg10numeros_medianegativos_positivos_total0;

import java.util.Scanner;

public class Main {

   
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int numero,media_positivos=0,cont_positivos=0,media_negativos=0,cont_negativos=0;
        int cont0=0,resultado,resultado2;
        
        for(int i=0;i<10;i++){
            System.out.println("Digite un numero: ");
            numero=entrada.nextInt();
            
            if(numero>0){
                cont_positivos++;
                media_positivos=media_positivos+numero;
            }
            else if(numero<0){
                cont_negativos++;
                media_negativos=media_negativos+numero;
            }
            else{
                cont0++;
            }
        }
        resultado=media_positivos/cont_positivos;
        resultado2=media_negativos/cont_negativos;
        
        System.out.println("La media de positivos es"+resultado);
        System.out.println("La media de negativos es"+resultado2);
        System.out.println("El total de ceros es: "+cont0);
        
        
    }
    
}
