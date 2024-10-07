/*
 ¿Podrías realizar un procedimiento denominado cuenta_atras que realice una cuenta
hacia atrás desde el número que le pases? 
 */
package cuenta_atras;

import java.util.Scanner;
public class Cuenta_atras {

    
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int num;
        
        System.out.println("Digite un numero: ");
        num=entrada.nextInt();
        
        
        while(num>0){
            System.out.println(num);
            num--;
        }
        
    }
    
}
