
package Ejercicio1;

import javax.swing.JOptionPane;

public class Main {
    public static void main(String [] args){
        cuadrilatero c1;
        float lado1,lado2;
        
        lado1=Float.parseFloat(JOptionPane.showInputDialog("Digite el valor del lado 1 : "));
        lado2=Float.parseFloat(JOptionPane.showInputDialog("Digite el valor del lado 2 : "));
        
        if(lado1==lado2){ //Es cuadrado
            c1= new cuadrilatero(lado1);
            
        }
        else{
            c1=new cuadrilatero(lado1,lado2);
        }
        
        System.out.println("El perimetro es: "+c1.getPerimetro());
        System.out.println("El area es: "+c1.getArea());
        
    }
    
}
