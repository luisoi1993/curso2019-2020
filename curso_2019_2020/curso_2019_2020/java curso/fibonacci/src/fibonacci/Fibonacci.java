/*
 FIBONACCI
La serie de Fibonacci está constituida por la secuencia de números enteros:
0,1,1,2,3,5,8,13...
Codifica un programa que escriba los primeros 15 números de la serie.
 */
package fibonacci;


public class Fibonacci {

   
    public static void main(String[] args) {
        int cont=0,sum=0, num_anterior=1,num_posterior=1;
        
        
         while(cont<15){
         System.out.println(sum);
         num_posterior=num_posterior+num_posterior;
         sum=num_posterior+num_anterior;
         num_anterior=sum;
         cont++;
        }
    }
    
}
