/* INTERFACES
Vimos en programas anteriores que es posible declara un interfaz común para
un conjunto de clases mediante la herencia. En Java no existe la herencia 
múltiple, pero podemos hacer que una clase tenga un interfaz mediante la 
declaración e implementación de un 'interface'.
Un interface en Java es un conjunto de métodos abstractos (que no
incluyen código) agrupados bajo un nombre y que deben ser implementados por
las clases que quieran tener dicho interfaz.
Ejemplo:
interface BuenaVida
{
	void comer();
	void dormir();
	void divertirse();
}
Si una clase quiere tener este interfaz, utilizará la cláusula 'implements':
class Estudiante extends Persona implements BuenaVida
{
	// métodos y atributos propios...
	// Aquí se codifican los métodos del interfaz que implementamos
	void comer(){...};
	void dormir(){...};
	void divertirse(){...};
}
class Profesor extends Persona implements BuenaVida {...};
Ahora podríamos declarar referencias a clases que implementan BuenaVida:
Ej:
BuenaVida est = new Estudiante();
est.comer();
BuenaVida prof = new Profesor();
prof.dormir();

Existen múltiples aplicaciones de los interfaces. Imagina el siguiente CASO:
se está desarrollando un nuevo protocolo de comunicaciones , llamado FastCom. 
Muchos fabricantes de software de comunicaciones están interesados en 
desarrollar y vender este producto. El producto va a ser utilizado por otros
fabricantes de software, como los de juegos en red y telefonía por Internet. 
A estos usuarios les gustaría que, independientemente del fabricante, el 
protocolo FastCom se utilizase de la misma forma: es decir, las clases y métodos
se llamasen igual independientemente del fabricante. Así, si tengo problemas
con el producto FastCom del fabricante Microsoft y decido utilizar el del 
fabricante Segovia Advanced Systems, NO tengo que modificar el código de mi
aplicación, porque el API es el mismo. 
Los fabricantes de FastCom se reúnen y se ponen de acuerdo para definir qué 
métodos se pueden utilizar y definen un interface:
interface FastCom
{
  void conectar();
  void transmitir();
  void recibir();
  void desconectar();  // etc...
}
Las clases que se fabriquen implementarán este interfaz y,en nuestro código,
utilizaremos el interfaz para conectar, transmitir datos...

Los interfaces pueden incluir constantes, métodos estáticos (con su implementación) y,
desde Java 8, métodos denominados default, que tienen implementación. 
Ver: https://www.geeksforgeeks.org/default-methods-java/


*/

interface Conduccion
{
	// los métodos de un interfaz se consideran públicos
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
		
		miCoche.parar();  // también podemos utilizar referencias a Coche y Camion
		miCamion.arrancar();
		// Pero...
		// La siguiente línea es un error: 
		// el método descargar() no puede invocarse con una referencia a 
		// Conduccion, ya que el método no pertenece al interfaz Conduccion
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

1. Añade código a los métodos de las clase Coche y Camion para que muestren que se 
   están ejecutando. 
   
2. Añade un par de constantes al interfaz y utilízalas en las clases Camión y Coche.
     Constante:  
	    static final int  nombre = valor;
   
3. Las interfaces tienen que diseñarse con cuidado para que sean estables. 
   Mira lo que ocurre si añades a la interfaz un nuevo método: 
      void pitar();
   Si las clases no lo implementan, ya no compilan.
   Investiga cómo podemos hacer que pitar() sea un default method y cómo lograríamos que las
   clases Camion y Coche compilasen sin modificarlas.
	  
4. Crea una clase abstracta denominada Vehiculo de la que hereden Coche y Camion. 
   Pon en ella un atributo que sea el nivel de carburante, con métodos set y get. 
   Pasa a ella el método repostar.
   
5. Diseña un nuevo interfaz denominado Lavable que contenga dos métodos que se te ocurran.
   La clase Vehiculo debe implementar la interfaz Lavable.
   
   Utiliza métodos de esta nueva interfaz con objetos de las clases Camion y Coche.

*/