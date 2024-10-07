/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prueba;

/**
 *
 * @author luis
 */
import java.util.Scanner;
public class Prueba {

    /**
     * @param args the command line arguments
     */
    
 
	public static void main(String[] args) {
		//declaro las variables del rango numérico que corresponde al alfabeto en Ascii
		//si quisieramos que generase letras mayúsculas tendríamos que usar el rango 65-90
		int num1 = 97;
		int num2 = 122;
		//a la variable de caracter le di un valor inicial de cero
		char c = 0;
		//establezco una secuencia de diez números aleatorios
		//podemos establecer la secuencia que queramos, siempre y cuando recordemos que el alfabeto en acssi tiene 26 letras, aí que ese es el máximo de la secuencia
		for (int i=1; i<=10; i++){
			int numAleatorio = (int)Math.floor(Math.random()*(num2 -num1)+num1);
			//para transformar los números en letras según ACSII
			System.out.println("el numero generado es: "+ numAleatorio);
			System.out.println("la letra generada es: " + (char)numAleatorio);
			c++;
			Scanner in = new Scanner(System.in);
		}
	}
}
