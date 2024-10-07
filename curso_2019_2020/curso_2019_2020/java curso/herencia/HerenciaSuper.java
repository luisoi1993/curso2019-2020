/* 
   Ejemplos tomados del tutorial de Java de Oracle:
   https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html
*/
import java.util.Scanner;

class Bicycle {
        
    // the Bicycle class has three fields
    public int cadence;
    public int gear;
    public int speed;
        
    // the Bicycle class has one constructor
    public Bicycle(int startCadence, int startSpeed, int startGear) {
        gear = startGear;
        cadence = startCadence;
        speed = startSpeed;
    }
        
    // the Bicycle class has four methods
    public void setCadence(int newValue) {
        cadence = newValue;
    }
        
    public void setGear(int newValue) {
        gear = newValue;
    }
        
    public void applyBrake(int decrement) {
        speed -= decrement;
    }
        
    public void speedUp(int increment) {
        speed += increment;
    }
        
}

class MountainBike extends Bicycle {
        
    // the MountainBike subclass adds one field
    public int seatHeight;

    // the MountainBike subclass has one constructor
    public MountainBike(int startHeight,
                        int startCadence,
                        int startSpeed,
                        int startGear) {
        super(startCadence, startSpeed, startGear);
        seatHeight = startHeight;
    }   
        
    // the MountainBike subclass adds one method
    public void setHeight(int newValue) {
        seatHeight = newValue;
    }   
}
public class HerenciaSuper {
	
	
	
	
	
    public static void main(String [] args) {
        
		// Crear objetos 
		
	}
	
	

}
/*  EJERCICIOS:

  1. Prueba el método toString() en ambas clases.
  
  2. Sobrescribe el método toString en la clase Bicycle y pruébalo.
  
  3. Sobrescribe el método toString en la clase MountainBike y utiliza en él el toString de la clase padre.
  
  4. Crea constructores que no reciban parámetros en la superclase y en la subclase.
     Haz que estos constructores impriman un mensaje.
	 Crea objetos de ambas clases utilizando estos constructores y saca conclusiones de los mensajes mostrados.
  
  5. Almacenar objetos (4, de ambos tipos) en un array y recorrerlo imprimiendo los datos de cada objeto.
  
  
  */
  
	
  
	
  



*/
