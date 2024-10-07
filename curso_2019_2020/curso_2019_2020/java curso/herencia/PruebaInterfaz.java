/* INTERFACES
Vimos en programas anteriores que es posible declara un interfaz com�n para
un conjunto de clases mediante la herencia. En Java no existe la herencia 
m�ltiple, pero podemos hacer que una clase tenga un interfaz mediante la 
declaraci�n e implementaci�n de un 'interface'.
Un interface en Java es un conjunto de m�todos abstractos (que no
incluyen c�digo) agrupados bajo un nombre y que deben ser implementados por
las clases que quieran tener dicho interfaz.
Ejemplo:
interface BuenaVida
{
	void comer();
	void dormir();
	void divertirse();
}
Si una clase quiere tener este interfaz, utilizar� la cl�usula 'implements':
class Estudiante extends Persona implements BuenaVida
{
	// m�todos y atributos propios...
	// Aqu� se codifican los m�todos del interfaz que implementamos
	void comer(){...};
	void dormir(){...};
	void divertirse(){...};
}
class Profesor extends Persona implements BuenaVida {...};
Ahora podr�amos declarar referencias a clases que implementan BuenaVida:
Ej:
BuenaVida est = new Estudiante();
est.comer();
BuenaVida prof = new Profesor();
prof.dormir();

Existen m�ltiples aplicaciones de los interfaces. Imagina el siguiente CASO:
se est� desarrollando un nuevo protocolo de comunicaciones , llamado FastCom. 
Muchos fabricantes de software de comunicaciones est�n interesados en 
desarrollar y vender este producto. El producto va a ser utilizado por otros
fabricantes de software, como los de juegos en red y telefon�a por Internet. 
A estos usuarios les gustar�a que, independientemente del fabricante, el 
protocolo FastCom se utilizase de la misma forma: es decir, las clases y m�todos
se llamasen igual independientemente del fabricante. As�, si tengo problemas
con el producto FastCom del fabricante Microsoft y decido utilizar el del 
fabricante Segovia Advanced Systems, NO tengo que modificar el c�digo de mi
aplicaci�n, porque el API es el mismo. 
Los fabricantes de FastCom se re�nen y se ponen de acuerdo para definir qu� 
m�todos se pueden utilizar y definen un interface:
interface FastCom
{
  void conectar();
  void transmitir();
  void recibir();
  void desconectar();  // etc...
}
Las clases que se fabriquen implementar�n este interfaz y,en nuestro c�digo,
utilizaremos el interfaz para conectar, transmitir datos...

Los interfaces pueden incluir constantes, m�todos est�ticos (con su implementaci�n) y,
desde Java 8, m�todos denominados default, que tienen implementaci�n. 
Ver: https://www.geeksforgeeks.org/default-methods-java/


*/

interface Conduccion
{
	// los m�todos de un interfaz se consideran p�blicos
	void acelerar();
	void frenar();
	void girar();
	void arrancar();
	void parar();
}

class Coche implements Conduccion
{
	public void acelerar(){
		System.out.println("Acelerando el Coche"); 
	}
	public void frenar(){}
	public void girar(){}
	public void arrancar(){
		System.out.println("Arrancando el Coche"); 
	}
	public void parar(){}
	
	public void repostar(){}
	public void llenarMaletero(){}
}

class Camion implements Conduccion
{
	public void acelerar(){
		System.out.println("Acelerando el Camion"); 
	}
	public void frenar(){}
	public void girar(){}
	public void arrancar(){
		System.out.println("Arrancando el Camion"); 
	}
	public void parar(){}
	
	public void repostar(){}
	public void cargar(){
		System.out.println("Cargando el Camion"); 
	}
	public void descargar(){}
}

public class PruebaInterfaz
{
	public static void main(String[] args)
	{
		Coche miCoche = new Coche();
		Camion miCamion = new Camion();
		Conduccion con1 = miCoche;
		Conduccion con2 = new Camion();
		con1.arrancar();
		con1.acelerar();
		con2.arrancar();
		con2.parar();
		
		miCoche.parar();  // tambi�n podemos utilizar referencias a Coche y Camion
		miCamion.arrancar();
		// Pero...
		// La siguiente l�nea es un error: 
		// el m�todo descargar() no puede invocarse con una referencia a 
		// Conduccion, ya que el m�todo no pertenece al interfaz Conduccion
		// con2.descargar();
		if (con2 instanceof Conduccion) // verdadero
			System.out.println("con2 permite la Conduccion");
		if (con2 instanceof Camion) // verdadero
			System.out.println("con2 es un Camion");
			
		// Guardar en un array
		Conduccion[] cond = new Conduccion[5];
		cond[0] = con1;
		cond[1] = con2;
		int i = 0;
		System.out.println("Trabajando desde el ARRAY:"); 
		while(cond[i] != null) {
			cond[i].arrancar();
			cond[i].acelerar();
			if (cond[i] instanceof Camion) {
				Camion c = (Camion) cond[i];  // casting!!
				c.cargar();
			}
			i++;
		}
		
	}
}

/* EJERCICIOS:

1. A�ade c�digo a los m�todos de las clase Coche y Camion para que muestren que se 
   est�n ejecutando. 
   
2. A�ade un par de constantes al interfaz y util�zalas en las clases Cami�n y Coche.
     Constante:  
	    static final int  nombre = valor;
   
3. Las interfaces tienen que dise�arse con cuidado para que sean estables. 
   Mira lo que ocurre si a�ades a la interfaz un nuevo m�todo: 
      void pitar();
   Si las clases no lo implementan, ya no compilan.
   Investiga c�mo podemos hacer que pitar() sea un default method y c�mo lograr�amos que las
   clases Camion y Coche compilasen sin modificarlas.
	  
4. Crea una clase abstracta denominada Vehiculo de la que hereden Coche y Camion. 
   Pon en ella un atributo que sea el nivel de carburante, con m�todos set y get. 
   Pasa a ella el m�todo repostar.
   
5. Dise�a un nuevo interfaz denominado Lavable que contenga dos m�todos que se te ocurran.
   La clase Vehiculo debe implementar la interfaz Lavable.
   
   Utiliza m�todos de esta nueva interfaz con objetos de las clases Camion y Coche.

*/