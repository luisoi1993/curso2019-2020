/*Leer por teclado dos tablas de 10 números enteros y mezclarlas en una tercera
de la forma: el 1º de A, el 1º de B, el 2º de A, el 2º de B, etc.
 */
package array2tablasenunanueva;

import java.util.Scanner;
public class Array2tablasEnunaNueva {

  
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int a[], b[], c[];
        
        a= new int[10];
        b=new int[10];
        c=new int[20];
        
        System.out.println("Digite el primer arreglo: ");
        for(int i=0;i<10;i++){
            System.out.println((i+1)+". Digite un numero: ");
            a[i]=entrada.nextInt();
        }
        
        System.out.println("Digite el segundo arreglo: ");
        for(int i=0;i<10;i++){
            System.out.println((i+1)+". Digite un numero: ");
            b[i]=entrada.nextInt();
        }
        int j=0;
        for(int i=0;i<10;i++){
            c[j]= a[i];
            j++;
            c[j]=b[i];
            j++;
        }
        
        System.out.println("\nEl tercer arreglo es: ");
        for(int i=0;i<20;i++){
            System.out.println(c[i]+" ");
        }
        System.out.println();
    }
    
}
