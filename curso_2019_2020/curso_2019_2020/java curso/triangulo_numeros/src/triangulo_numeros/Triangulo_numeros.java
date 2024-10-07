/*
 Codifica un programa que genere un "triángulo" como el de la figura.
1
12
123
1234
12345
123456
1234567
12345678
123456789
 */
package triangulo_numeros;


public class Triangulo_numeros {

    public static void main(String[] args) {
      //vamos a generar un numero aleatorio entre 1 y 9(en varios pasos)
      double inicial=Math.random(); //numero entre 0 y 1 (no incluido el 1) 0<=num<1
      inicial=(inicial*9)+1; //numero con decimales(parte entera va desde 1 hasta 9)
      int num=(int)inicial;// casting:conversuón explicita a entero
      
      for(int i =1;i<=num;i++){
          for(int j=1;j<=i;j++){ //esta es la clave: j ira de 1 hasta lo que valga i que va cambiando..)
            System.out.print(j);
          }
          System.out.println();
      }    
      
    }
    
}
