/*comprobar si un numero es palindromo
 */
package palindromo;

import java.util.Scanner;
public class Palindromo {

    
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int num,cifra1,cifra2,cifra3,cifra4,cifra5;
        
        System.out.println("Digite un numero de cinco cifras: ");
        num=entrada.nextInt();
        
        cifra1=num/10000;
        cifra2=(num%10000)/1000;
        cifra3=(num%1000)/100;   
        cifra4=(num%100)/10;
        cifra5=(num%10);
        
        if(cifra1==cifra5 && cifra2==cifra4){
            System.out.println("El numero es palindromo: ");
        }
        else{
            System.out.println("El numero no es palindromo: ");
        }
    
    }
    
}
