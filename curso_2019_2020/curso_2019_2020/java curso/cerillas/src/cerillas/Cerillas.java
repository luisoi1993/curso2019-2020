
package cerillas;

import java.util.Scanner;
public class Cerillas {

   
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int filas,columnas,resultado,resultado2,resultado3;
        
        System.out.println("Digite el numero de columnas: ");
        columnas=entrada.nextInt();
        System.out.println("Digite el numero de filas; ");
        filas=entrada.nextInt();
        resultado=columnas*(columnas+1);
        resultado2=filas*(filas+1);
        resultado3=resultado+resultado2;
        
        System.out.println("El numero total de cerillas es: "+resultado3);
        
        
    }
    
}
