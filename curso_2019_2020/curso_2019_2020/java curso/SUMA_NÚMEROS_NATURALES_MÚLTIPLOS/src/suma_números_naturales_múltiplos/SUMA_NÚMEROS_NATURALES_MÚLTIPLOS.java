/*
  SUMA_NÚMEROS_NATURALES_MÚLTIPLOS
 Haz un programa que sume los números múltiplos de 3 y 5 que hay del 1 al 100.
 */
package suma_números_naturales_múltiplos;


public class SUMA_NÚMEROS_NATURALES_MÚLTIPLOS {

    
    public static void main(String[] args) {
        int suma_3=0,suma_5=0;
        
        for(int i=0;i<100;i++){
            if(i%3==0){
                suma_3=suma_3+i;
                
            }
            if(i%5==0){
                suma_5=suma_5+i;
            }
        }
       
        System.out.println("El total de numero multiplos del 3: "+suma_3);
        System.out.println("El total de la suma de los multiplos del 5: "+suma_5);
    }
    
}
