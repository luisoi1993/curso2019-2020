/* PROGRAMA 57: HERENCIA (Inheritance)
  Vamos a ver cómo se lleva a cabo la herencia en Java.
  Cuando una clase hereda de otra, utilizamos la palabra
  "extends". Ejemplo:
    class SubClase extends SuperClase {...}
  SubClase heredará los métodos y atributos de la clase 
  SuperClase. 

  Además, al heredar de una clase, los objetos de nuestra 
  clase serán también objetos de la clase que heredan, ya
  que la herencia es una relación del tipo "es un":
  un Coche que hereda de Vehiculo es también un Vehículo y
  también lo es un Camión si hereda de Vehículo.

  SOBRESCRIBIR MÉTODOS: (overriding methods)
  Las clases hijas o subclases (las que heredan) pueden variar
  su comportamiento respecto a la clase padre o superclase (de
  la que heredan). Para ello, pueden variar algunos de los 
  métodos de la clase padre. Decimos que "sobrescribimos" dichos
  métodos, es decir, declaramos un método con igual prototipo
  que el de la clase padre, pero con un código diferente. 

  MÉTODOS ABSTRACTOS:
  Van precedidos del modificador 'abstract' y no tienen código
  asociado. Cuando heredamos de una clase que tiene un método
  abstracto tenemos que sobrescribir y codificar dicho método.
  Si una clase tiene un método (o más) abstracto, dicha clase
  será abstracta y no podremos crear objetos de dicha clase.

  CLASES ABSTRACTAS:
  Una clase abstracta es aquella de la que no pueden crearse
  instancias u objetos de dicha clase. Para declarar una clase
  abstracta, utilizamos el modificador 'abstract':
     abstract class NoInstanciable {...}
  Si intentamos crear un objeto con el operador new:
  NoInstanciable n = new NoInstanciable(); -> Error de compilación
  Una clase con un método abstracto debe declararse como abstracta.

  VENTAJAS DE LA HERENCIA:
  A pesar de que la ventaja más aparente es el ahorrarnos escribir
  (y repetir) código en las clases que heredan, algo muy importante
  que se consigue con la herencia es que todas las clases que heredan
  comparten el mismo interfaz que la clase padre. Entendemos por
  interfaz el conjunto de métodos de una clase que pueden ser accedidos
  por otras clases, desde el "exterior".

  OPERADOR instanceof:
  es un operador de Java que nos permite conocer a qué tipo de objeto
  apunta una referencia. Devuelve true o false. Nos devolverá true si
  la referencia es del tipo sobre el que hicimos new o alguna de las 
  clases de las que hereda.
 
  JERARQUÍA DE CLASES: 
  Podemos heredar de una clase que ha heredado de otra: Animal->Pez->Sardina
  En Java, todos las clases "descienden" de la clase Object. Object proporciona
  uno métodos, como el método toString, que veremos más adelante. Por tanto,
  todo objeto en Java es un Object...*/

/** Mamifero:
  Esta será una clase de la que heredarán mamíferos más concretos.
  Contiene atributos comunes y un par de métodos: duerme() y produceSonido().
  Estos dos métodos conforman el interfaz de todo Mamifero.
  Como esta clase es abstracta, no podremos instanciar objetos Mamifero.
*/  

abstract class Mamifero  
{
	protected float peso;
	protected int edad;

	void duerme()
	{
            // La sentencia try-catch sirve para capturar excepciones: 
            // las excepciones son objetos que algunos métodos "lanzan" y
            // que contienen información sobre errores.
		try  
		{
		  System.out.println("Mamifero durmiendo...");		
		  Thread.sleep(1000); // método estático: duerme 1000 milisegundos
		} catch (Exception e){};
		return;
	}
	
	abstract void produceSonido(); 
     // método abstracto: las clases que hereden deben escribir el código si no
     // quieren ser abstractas también.
}

class Gato extends Mamifero
{
	void duerme()  // sobreescribimos el método duerme
	{
		try
		{
		  System.out.println("Gato durmiendo...");		
		  Thread.sleep(3000);
		} catch (Exception e){};
		return;
	}	
	void produceSonido()
	{
		System.out.println("Miau miau");
		return;
	}
}

class Perro extends Mamifero
{
     // esta clase no sobreescribe el método duerme: utilizará el de Mamifero
	void produceSonido()
	{
		System.out.println("Guau guau");
		return;
	}
}

 public class PruebaHerencia
 {

	 public static void main(String args[])
	 {
		 Gato g = new Gato();
		 System.out.println("Gato creado...");
		 g.produceSonido();
		 g.duerme();
		 g.peso = 4.2f;  // la f indica float; si no, se considera double
		 g.edad = 7;
		 Perro p = new Perro();
		 System.out.println("Perro creado...");
		 p.produceSonido();
		 p.duerme();
		 p.peso = 10.0f;
		 p.edad = 3;
		 
		 // No podemos crear objetos Mamifero porque es una clase abstracta
		 //  Mamifero m = new Mamifero(); -> Error de compilación
		 
		 // Sin embargo, podemos utilizar una referencia a Mamifero:
		 Mamifero m = new Gato();
		 m.duerme();  // invocamos método de un objeto Gato
		 
		 // podemos averiguar de qué tipo es el objeto referenciado por m:
		 if ( m instanceof Perro)
			 System.out.println("m es una instancia de Perro");
		 else if ( m instanceof Gato)
			 System.out.println("m es una instancia de Gato");
		 if ( m instanceof Mamifero)
			 System.out.println("Ademas m es tambien un Mamifero");
		 if ( m instanceof Object)
			 System.out.println("m tambien es un Object!!");
	 }
	 
 }
 
 /* EJERCICIOS:
   57.1 Crea una clase, Siames, que herede de Gato y que produzca un sonido
   ligeramente distinto.
   
   57.2 Crea un nuevo mamífero, la clase Vaca. Haz que duerma 2 seg.
   
   57.3 Haz que todas las clases incorporen un atributo, ritmoCardiaco, y dos
    métodos que permitan dar valor y leer el número de pulsaciones que tiene el
	animal. Modifica solo las clases que sean necesarias.
  */
	
	
