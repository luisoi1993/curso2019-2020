//Programa que genere los primeros 10 números de la serie de Fibonacci.
 
package fibonacci_10numeros;


public class Fibonacci_10numeros {

    public static void main(String[] args) {
     int num1=0,num2=1,suma=1;
     
     System.out.println(num1);
     
     for(int i=1;i<10;i++){
         System.out.println(suma);
         suma=num1+num2;
         num1=num2;
         num2=suma;
     }
    }
    
}
