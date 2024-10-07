/* Realiza un programa que sume los 20 primeros números naturales
(1, 2, ...20)  y muestre el resultado por pantalla. */

package suma_20_primerosnumeros;


public class Suma_20_primerosnumeros {

    
    public static void main(String[] args) {
        int num=1,resultado=0;
        
        for(int i=0;i<20;i++){
            resultado=resultado+num;
            num++;
        }
        
        System.out.println("La suma de los primeros 20 numeros es "+resultado);
    }
    
}
