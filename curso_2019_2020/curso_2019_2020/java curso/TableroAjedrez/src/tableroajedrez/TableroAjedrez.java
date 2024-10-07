/*TABLERO_AJEDREZ
Realiza un programa que escriba por pantalla las coordenadas de un tablero de ajedrez.

A1 B1 C1....H1

A2 B2..........H2

..

A8 B8 .........H8

Nota: utiliza bucles for anidados e investiga el tipo char para la primera coordenada.

Variante: ¿puedes imprimir el tablero desde el punto de vista de las blancas? Fila A8 - H8 la primera... Fila A1 - H1 la última.
 */
package tableroajedrez;



public class TableroAjedrez {

  
    public static void main(String[] args) {
      int cNum; //coordenada numérica
      char cChar; //coordenada alfabética
      
      for(cNum=8;cNum>=1;cNum--){
          for (cChar='A';cChar<='H';cChar++){
              System.out.print(cChar +""+cNum+" ");
          }
          System.out.println("");
      }
      
    }
    
}
