/* EJERCICIO:
  Realiza un programa en Java que muestre un menú por pantalla como el siguiente:
  
  ******* ADVANCED GEOMETRY V.0.1 *********
  1. Calcular Longitud de la Circunferencia.
  2. Calcular Área del Círculo.
  3. Calcular Volumen del Cilindro.
  4. Calcular Área Rectángulo.
  5. Calcular Volumen de un Hexaedro.
  6. Calcular Área de un Polígono regular.
  0. Terminar
  
 */
package geometria1;

import java.util.Scanner;

public class Geometria1 {

   
    public static void main(String[] args) {
        Scanner entrada= new Scanner(System.in);
        int numero;
        float pi=3.14f ,radio,diametro,resultado,altura,base,arista,perimetro,apotema;
        
        System.out.println("******* ADVANCED GEOMETRY V.0.1 ******* "
                + "\n1. Calcular Longitud de la circunferencia."
                + "\n2. Calcular Area del circulo. "
                + "\n3. Calcular volumen del cilindro."
                + "\n4. Calcular Area rectangulo. "
                + "\n5.Calcular Volumen de un Hexaedro. "
                + "\n6. Calcular Area de un Poligono regular."
                + "\n0. Terminar");
       
        numero=entrada.nextInt();
        
        while(numero!=0){
            switch(numero){
                case 1: 
                    System.out.println("Digite el valor del diametro: ");
                    diametro=entrada.nextFloat();
                    resultado=pi*diametro;
                    System.out.println("La longitud de la circunferencia es: "+resultado);
                    break;
                case 2:
                    System.out.println("Digite el valor del radio: ");
                    radio=entrada.nextFloat();
                    resultado=radio*pi;
                    System.out.println("El area del circulo es: "+resultado);
                    break;
                
                case 3:
                    System.out.println("Digite el valor del radio: ");
                    radio=entrada.nextFloat();
                    System.out.println("Digiite el valor de la altura: ");
                    altura=entrada.nextFloat();
                    resultado=pi*(radio*radio)*altura;
                    System.out.println("El volumen del cilindro es "+resultado);
                    break;
                
                case 4:
                    System.out.println("Digite el valor de la altura: ");
                    altura=entrada.nextFloat();
                    System.out.println("Digite el valor de la base: ");
                    base=entrada.nextFloat();
                    resultado=base*altura;
                    System.out.println("El area del rectangulo: "+resultado);
                    break;
                
                case 5:
                    System.out.println("Digite el valor de la arista: ");
                    arista=entrada.nextFloat();
                    resultado=arista*arista*arista;
                    System.out.println("El volumen del hexaedro es: "+resultado);
                    break;
                
                case 6: 
                    System.out.println("Digite el valor del perimetro: ");
                    perimetro=entrada.nextFloat();
                    System.out.println("Digite el valor de la apotema: ");
                    apotema=entrada.nextFloat();
                    resultado=(perimetro*apotema)/2;
                    System.out.println("El area del poligono regular es: "+resultado);
                    break;
               
            }
            System.out.print("Digite un numero: ");
            numero=entrada.nextInt();
        }
    }
    
}
