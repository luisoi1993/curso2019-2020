/*
LOTO 
Escribe un programa que genere 6 números aleatorios entre 1 y 49.
 */
package loto;

import java.util.Random;


public class Loto {

    
    public static void main(String[] args) {
        Random Loto = new Random();
        int n = 1 + Loto.nextInt(49);
        int z = 1 + Loto.nextInt(49);
        int h = 1 + Loto.nextInt(49);
        int i = 1 + Loto.nextInt(49);
        int j = 1 + Loto.nextInt(49);
        int k = 1 + Loto.nextInt(49);
 
 
        System.out.println("Los 6 numeros aleatorios generados son los siguientes: ");
        System.out.println(n);
        System.out.println(z);
        System.out.println(h);
        System.out.println(i);
        System.out.println(j);
        System.out.println(k);
    }
    
}
