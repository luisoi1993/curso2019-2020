/*Realizar un programa que pida 5 nombres, 5 apellidos, 5 salarios(numero 
real) y que imprima a continuacion,todos los datos en columnas . Alienando 
las cadenas de texto a la izquierda maximo dos decimales */
package arrays_ordencolumnas;

import java.util.Scanner;

public class Arrays_ordenColumnas {

    
    public static void main(String[] args) {
      Scanner entrada = new Scanner(System.in);
      String[] nombres= new String[5];
      String[] apellidos= new String[5];
      Float[] salarios= new Float[5];
      
      for(int i=0;i<5;i++){
          System.out.println((i+1)+"Digite un nombre: ");
          nombres[i]=entrada.nextLine();
      }
      
      for(int i=0;i<5;i++){
          System.out.println((i+1)+"Digite un apellido: ");
          apellidos[i]=entrada.nextLine();
          
      }
      
      for(int i=0;i<5;i++){
          System.out.println((i+1)+"Digite un salario: ");
          salarios[i]=entrada.nextFloat();
          
      }
    }
    
}
