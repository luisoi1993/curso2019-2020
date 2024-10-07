/*Modifica el programa anterior para que escriba la secuencia:
1
22
333
4444
(si el número generado aleatoriamente fuese 4) */
package ejercicioanidados_01;


public class Ejercicioanidados_01 {

    
   public static void main(String[] args) {
      //vamos a generar un numero aleatorio entre 1 y 9(en varios pasos)
      double inicial=Math.random(); //numero entre 0 y 1 (no incluido el 1) 0<=num<1
      inicial=(inicial*9)+1; //numero con decimales(parte entera va desde 1 hasta 9)
      int num=(int)inicial;// casting:conversuón explicita a entero
      
      for(int i =1;i<=num;i++){
          for(int j=1;j<=i;j++){ //esta es la clave: j ira de 1 hasta lo que valga i que va cambiando..)
              
            System.out.print(i);
          }
          System.out.println();
      }    
      
    }
    
}