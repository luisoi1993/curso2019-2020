/*
IMPUESTORENTA
El impuesto sobre la renta de las personas físicas es un impuesto que grava
las rentas obtenidas por una persona a lo largo del año. Es un impuesto que contempla
muchas variables, pero vamos a realizar una aproximación simplificada, trabajando con 
los tramos que define el impuesto y con los tipos que se aplican en cada tramo como
hemos comentado en clase.
Debes codificar un programa que pida al usuario la base imponible y calcule cuánto dinero
debe abonar a Hacienda el contribuyente. 
También debes calcular el tipo medio aplicado a dicho contribuyente.

Los tramos que debes considerar son:

Tramos del IRPF para 2019
Base imponible 	       Tipo aplicado
0 € 	    12.450 € 	19 %
12.450 € 	20.200 € 	24 %
20.200 € 	35.200 € 	30 %
35.200 € 	60.000 € 	37 %
Más de 60.000 € 	    45 %

Puedes también añadir elementos gráficos: mostrar los escalones y dónde se ubica
la base disponible del usuario.
Investiga el uso de la instrucción SETXY  en Logo.

 */
package impuesto_renta;

import java.util.Scanner;

public class Impuesto_Renta {

    public static void main(String[] args) {
        Scanner entrada= new Scanner(System.in);
        float resultado,resultado2,resultado3,resultado5,num,resultado4,total,num2;
        float tipomedio;
        
        System.out.println("Digite las rentas obtenidas: ");
        num=entrada.nextFloat();
        
        //de 0 a 12450
        if(num<=12450){
           resultado=num*0.19f; 
           System.out.println("El total a pagar es: "+resultado);
           System.out.println("El tipo medio es: 0.19 ");
            
        }
        //de 12450 a 20.200
        else if(num<=20200){
            resultado=12450*0.19f;
            num2= num-12450;
            resultado2=num2*0.24f;
            resultado=resultado+resultado2;
            tipomedio=(resultado/num)*100;
            System.out.println("El total a pagar es: "+resultado);
            System.out.println("El tipo medio es: "+tipomedio);
        
        }
        //de 20200 a 35200
        else if(num<=35200){
            resultado=12450*0.19f;
            num2=num-12450;
            resultado2=7750*0.24f;
            num2=num2-7750;
            resultado3=num2*0.30f;
            resultado=resultado+resultado2+resultado3;
            tipomedio=(resultado/num)*100;
            System.out.println("El total a pagar es: "+resultado);
            System.out.println("El tipo medio es: "+tipomedio);
        }
        // de 35200 a 60000
        else if(num<=60000){
            resultado=12450*0.19f;
            num2=num-12450;
            resultado2=7750*0.24f;
            num2=num2-7750;
            resultado3=15000*0.30f;
            num2=num2-15000;
            resultado4=num2*0.37f;
            resultado=resultado+resultado2+resultado3+resultado4;
            tipomedio=(resultado/num)*100;
            System.out.println("El total a pagar es: "+resultado);
            System.out.println("El tipo medio es: "+tipomedio);
        }
        else{
            resultado=12450*0.19f;
            num2=num-12450;
            resultado2=7750*0.24f;
            num2=num2-7750;
            resultado3=15000*0.30f;
            num2=num2-15000;
            resultado4=24800*0.37f;
            num2=num2-24800;
            resultado5=num2*0.45f;
            resultado=resultado+resultado2+resultado3+resultado4+resultado5;
            tipomedio=(resultado/num)*100;
            System.out.println("El resultado es: "+resultado);
            System.out.println("El tipo medio es: "+tipomedio);
            
        }
        
       
        
    }
    
    
}
