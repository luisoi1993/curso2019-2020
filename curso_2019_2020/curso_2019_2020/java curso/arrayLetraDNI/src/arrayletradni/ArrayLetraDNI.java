/* Realizar un programa que calcule la letra del NIF:

   El procedimiento empleado para el cálculo de la letra del NIF consiste en
   hallar el módulo (o resto) de dividir el DNI por 23.
   El número resultante (comprendido entre 0 y 22) tiene una letra asignada.
   La secuencia no es correlativa:

   T R W A G M Y F P D X B N J Z S Q V H L C K E
   
   1ª parte:
   El programa preguntará números de DNI al usuario y mostrará el DNI seguido de 
   la letra que le corresponda.
   El programa termina cuando el usuario introduzca un cero.
   
   2ª parte:
   El programa pide ahora DNIs completos e indica si el DNI es válido (si la letra corresponde
   a la secuencia numérica dada)
   
 */
package arrayletradni;

import java.util.Scanner;
public class ArrayLetraDNI {

   
    public static void main(String[] args) {
        Scanner entrada= new Scanner(System.in);
        int dni,resultado,cero=100000,temporal,temp=0,opcion=4;
        String letra="b",letra2="a";
        int lista[]= new int [6];
        
        
       
        
        while(opcion!=0){
             
            System.out.println("Elige una opcion: "
                + "1.Dni. Generar letra. "
                + "2.Comprobar si esta bien."
                + "0.Salir del programa ");
            opcion=entrada.nextInt();
        if(opcion==1){
            for(int i=0;i<6;i++){
                System.out.println("Digite los numeros del dni: ");
                temporal=entrada.nextInt();
                lista[i]=cero*temporal;
             cero=cero/10;
            
            }
            for(int i=0;i<6;i++){
                temp=temp+lista[i];
            }
            dni=temp;
            resultado=dni/23;
            while(resultado>23){
                resultado=resultado/23;
            }
        
        
            switch(resultado){
                case 0:
                    letra="T";
                    break;
                case 1:
                    letra="R";
                    break;
                case 2:
                    letra="W";
                    break;
                case 3:
                    letra="A";
                    break;
                case 4:
                    letra="G";
                    break;
                case 5:
                    letra="M";
                    break;
                case 6:
                    letra="Y";
                    break;
                case 7:
                    letra="F";
                    break;
                case 8:
                    letra="P";
                    break;
                case 9:
                    letra="D";
                    break;
                case 10:
                    letra="X";
                    break;
                case 11:
                    letra="B";
                    break;
                case 12:
                    letra="N";
                    break;
                case 13:
                    letra="J";
                    break;
                case 14:
                    letra="Z";
                    break;
                case 15:
                    letra="S";
                    break;
                case 16:
                    letra="Q";
                    break;
                case 17:
                    letra="V";
                    break;
                case 18:
                    letra="H";
                    break;
                case 19:
                    letra="L";
                    break;
                case 20:
                    letra="C";
                    break;
                case 21:
                    letra="K";
                    break;
                case 22:
                    letra="E";
                    break;
                default:
                System.out.println("Algo esta mal...");
            }
            System.out.println("El dni es: "+dni+letra);
        }
        else if(opcion==2){
            System.out.println("Digite todos los numeros del dni: ");
            dni=entrada.nextInt();
            System.out.println("Digite la letra del dni: ");
            letra2=entrada.nextLine();
            
             resultado=dni/23;
             while(resultado>23){
                resultado=resultado/23;
            }
        
        
            switch(resultado){
                case 0:
                    letra="T";
                    break;
                case 1:
                    letra="R";
                    break;
                case 2:
                    letra="W";
                    break;
                case 3:
                    letra="A";
                    break;
                case 4:
                    letra="G";
                    break;
                case 5:
                    letra="M";
                    break;
                case 6:
                    letra="Y";
                    break;
                case 7:
                    letra="F";
                    break;
                case 8:
                    letra="P";
                    break;
                case 9:
                    letra="D";
                    break;
                case 10:
                    letra="X";
                    break;
                case 11:
                    letra="B";
                    break;
                case 12:
                    letra="N";
                    break;
                case 13:
                    letra="J";
                    break;
                case 14:
                    letra="Z";
                    break;
                case 15:
                    letra="S";
                    break;
                case 16:
                    letra="Q";
                    break;
                case 17:
                    letra="V";
                    break;
                case 18:
                    letra="H";
                    break;
                case 19:
                    letra="L";
                    break;
                case 20:
                    letra="C";
                    break;
                case 21:
                    letra="K";
                    break;
                case 22:
                    letra="E";
                    break;
                default:
                System.out.println("Algo esta mal...");
            }
            if(letra==letra2){
              System.out.println("Si corresponde con la secuencia: ");
            }
            else{
                System.out.println("No corresponde con la secuencia: ");
            }
        }
        }
    }
    
}
