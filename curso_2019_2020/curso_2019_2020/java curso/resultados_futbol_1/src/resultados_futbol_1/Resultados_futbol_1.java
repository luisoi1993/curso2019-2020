/*
 RESULTADOS_FÚTBOL_1
  Un partido de fútbol puede arrojar diferentes resultados: 0-0, 2-1, 1-4, 5-0...
Queremos realizar un programa que, suponiendo que el número máximo de goles que pueda
lograr cada equipos sea 3, muestre todos los posibles resultados.
Ejemplo:
0-0
0-1
...
2-3
3-3

 */
package resultados_futbol_1;


public class Resultados_futbol_1 {

    public static void main(String[] args) {
        
        
        for(int i=0;i<3;i++){
            System.out.println(i+"- 0");
            System.out.println(i+"- 1");
            System.out.println(i+"- 2");
            System.out.println(i+"- 3");
        }
    }
    
}
