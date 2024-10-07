/*
 
GEOMETRÍA
Realiza un programa que contenga procedimientos para calcula:
- la longitud de la circunferencia.
- el área de un cuadrado, de un triángulo y de un polígono regular.
- el volumen de un prisma exagonal y de un cono.
Intenta reutilizar todos aquellos procedimientos que puedas.
Realiza un procedimiento de prueba donde llames al menos dos veces a cada procedimiento.
 */
package geometria;

import java.util.Scanner;

public class Geometria {

    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int numero,radio,lado,base,altura,apotema,perimetro,area_base;
        float pi=3.14f,resultado=0;
                
                ;
        System.out.println("Elige una opcion:  \n"
                + "1: longitud de la circunferencia \n"
                + "2: area de cuadrado  \n"
                + "3: area del triangulo \n"
                + "4: area de un poligono regular  \n"
                + "5: volumen de un prisma exagonal \n"
                + "6: Volumen de un cono");
        numero=entrada.nextInt();
        
        switch(numero){
            case 1: 
                 System.out.println("Digite el valor del radio");
                 radio=entrada.nextInt();
                 resultado=pi*radio;
                 System.out.println("El valor de longitud de la circunferencia es: "+resultado);
                break;
                
            case 2:
                System.out.println("Digite el valor del lado: ");
                lado=entrada.nextInt();
                resultado=lado*lado;
                System.out.println("El area del cuadrado es: "+resultado);
                break;
           
            case 3: 
                System.out.println("Digite el valor de la base: ");
                base=entrada.nextInt();
                System.out.println("Digite el valor de la altura: ");
                altura=entrada.nextInt();
                resultado=(base*altura)/2;
                System.out.println("El resultado es:"+resultado);
                break;
                
            case 4: 
                System.out.println("Digite el valor del perimetro: ");
                perimetro=entrada.nextInt();
                System.out.println("Digite el valor de la apotema: ");
                apotema=entrada.nextInt(),
                resultado=(perimetro*apotema)/2;
                System.out.println("El resultado es : "+resultado);
                break;
                
            case 5:
                System.out.println("Digite el valor del area de la base: ");
                area_base=entrada.nextInt();
                System.out.println("Digite el valor de la altura: ");
                altura=entrada.nextInt();
                resultado=area_base*altura;
                System.out.println("El valor del volumen es: "+resultado);
                break;
                
            case 6:
                System.out.println("Digite el valor del area de la base: ");
                area_base=entrada.nextInt();
                System.out.println("Digite el valor de la altura: ");
                altura=entrada.nextInt();
                resultado=(area_base/3)*altura;
                System.out.println("El resultado es: "+resultado);
                break;
                
            default: break;
                
                       
                
        }
        
    }
    
}
