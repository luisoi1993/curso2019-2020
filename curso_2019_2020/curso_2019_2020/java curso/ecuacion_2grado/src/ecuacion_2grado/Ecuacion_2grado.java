/* Realiza un programa que resuelva ecuaciones de segundo grado. Inicializa los 
valores de a, b y c. Si el número sobre el que hay que calcular
la raíz es negativo,informa al usuario de que la ecuación no tiene solución real.
 */

package ecuacion_2grado;

import java.util.Scanner;
import java.lang.Math;

public class Ecuacion_2grado {

    public static void main(String[] args) {
        double a,b,c,resultado,resultado2;
        Scanner entrada = new Scanner(System.in);
        
        System.out.println("Digite el valor de a: ");
        a=entrada.nextInt();
        System.out.println("Digite el valor de b: ");
        b=entrada.nextInt();
        System.out.println("Digite el valor de c: ");
        c=entrada.nextInt();
        
        double numero=(b*b)-(4*a*c);
        if(numero>0){
            resultado=(-b+Math.sqrt(numero))/2*a;
            resultado2=(-b-Math.sqrt(numero))/2*a;
            System.out.println("La ecuacion tiene dos soluciones: ");
            System.out.println("Resultado: "+resultado);
            System.out.println("Resultado2: "+resultado2);
            
        }
        else if(numero== 0){
            resultado=(-b)/2*a;
            System.out.println("La ecuacion tiene una solucion: ");
            System.out.println("El resultado es: "+resultado);
        }
        else{
            System.out.println("No tiene solucion.");
        }
       
    }
    
}
