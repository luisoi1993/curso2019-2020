//Realiza un programa que sume los primeros diez números naturales impares.

package suma10_primeros_impares;


public class Suma10_primeros_impares {

   
    public static void main(String[] args) {
        int numero=1,suma=0;
        
        for(int i=0;i<10;i++){
            suma=suma+numero;
            numero=numero+2;
        }
        
        System.out.println("La suma de los primeros 10 numeros naturale impares "+suma);
    }
    
}
