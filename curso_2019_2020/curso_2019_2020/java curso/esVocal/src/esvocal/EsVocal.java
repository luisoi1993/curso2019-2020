/*Codificar un metodo es vocal que recibe un tipo chare informa
de si el caracter es una vocal o no. */
package esvocal;

import java.util.Scanner;

public class EsVocal {

    
    public static void main(String[] args) {
        int contador=0;
        String cadena = "sdfsadfasf";
        char[] l =cadena.toCharArray();
    for (int x=0;x<cadena.length();x++){
       if (esVocal(cadena.charAt(x))){
           contador++;
       }
      
    }
    
    }
    public static boolean esVocal(char vocal) {
        boolean esVocal=false;
        
        
        if(vocal=='a'||vocal=='e'||vocal=='i'||vocal=='o'||vocal=='u'||
                vocal=='A'||vocal=='E'||vocal=='I'||vocal=='O'||vocal=='U'){
            esVocal=true;
        }
       
        return esVocal;
	}
}
