/* PROGRAMA 57: HERENCIA (Inheritance)
  Vamos a ver c�mo se lleva a cabo la herencia en Java.
  Cuando una clase hereda de otra, utilizamos la palabra
  "extends". Ejemplo:
    class SubClase extends SuperClase {...}
  SubClase heredar� los m�todos y atributos de la clase 
  SuperClase. 

  Adem�s, al heredar de una clase, los objetos de nuestra 
  clase ser�n tambi�n objetos de la clase que heredan, ya
  que la herencia es una relaci�n del tipo "es un":
  un Coche que hereda de Vehiculo es tambi�n un Veh�culo y
  tambi�n lo es un Cami�n si hereda de Veh�culo.

  SOBRESCRIBIR M�TODOS: (overriding methods)
  Las clases hijas o subclases (las que heredan) pueden variar
  su comportamiento respecto a la clase padre o superclase (de
  la que heredan). Para ello, pueden variar algunos de los 
  m�todos de la clase padre. Decimos que "sobrescribimos" dichos
  m�todos, es decir, declaramos un m�todo con igual prototipo
  que el de la clase padre, pero con un c�digo diferente. 

  M�TODOS ABSTRACTOS:
  Van precedidos del modificador 'abstract' y no tienen c�digo
  asociado. Cuando heredamos de una clase que tiene un m�todo
  abstracto tenemos que sobrescribir y codificar dicho m�todo.
  Si una clase tiene un m�todo (o m�s) abstracto, dicha clase
  ser� abstracta y no podremos crear objetos de dicha clase.

  CLASES ABSTRACTAS:
  Una clase abstracta es aquella de la que no pueden crearse
  instancias u objetos de dicha clase. Para declarar una clase
  abstracta, utilizamos el modificador 'abstract':
     abstract class NoInstanciable {...}
  Si intentamos crear un objeto con el operador new:
  NoInstanciable n = new NoInstanciable(); -> Error de compilaci�n
  Una clase con un m�todo abstracto debe declararse como abstracta.

  VENTAJAS DE LA HERENCIA:
  A pesar de que la ventaja m�s aparente es el ahorrarnos escribir
  (y repetir) c�digo en las clases que heredan, algo muy importante
  que se consigue con la herencia es que todas las clases que heredan
  comparten el mismo interfaz que la clase padre. Entendemos por
  interfaz el conjunto de m�todos de una clase que pueden ser accedidos
  por otras clases, desde el "exterior".

  OPERADOR instanceof:
  es un operador de Java que nos permite conocer a qu� tipo de objeto
  apunta una referencia. Devuelve true o false. Nos devolver� true si
  la referencia es del tipo sobre el que hicimos new o alguna de las 
  clases de las que hereda.
 
  JERARQU�A DE CLASES: 
  Podemos heredar de una clase que ha heredado de otra: Animal->Pez->Sardina
  En Java, todos las clases "descienden" de la clase Object. Object proporciona
  uno m�todos, como el m�todo toString, que veremos m�s adelante. Por tanto,
  todo objeto en Java es un Object...*/

/** Mamifero:
  Esta ser� una clase de la que heredar�n mam�feros m�s concretos.
  Contiene atributos comunes y un par de m�todos: duerme() y produceSonido().
  Estos dos m�todos conforman el interfaz de todo Mamifero.
  Como esta clase es abstracta, no podremos instanciar objetos Mamifero.
*/  

abstract class Mamifero  
{
	protected float peso;
	protected int edad;

	void duerme()
	{
            // La sentencia try-catch sirve para capturar excepciones: 
            // las excepciones son objetos que algunos m�todos "lanzan" y
            // que contienen informaci�n sobre errores.
		try  
		{
		  System.out.println("Mamifero durmiendo...");		
		  Thread.sleep(1000); // m�todo est�tico: duerme 1000 milisegundos
		} catch (Exception e){};
		return;
	}
	
	abstract void produceSonido(); 
     // m�todo abstracto: las clases que hereden deben escribir el c�digo si no
     // quieren ser abstractas tambi�n.
}

class Gato extends Mamifero
{
	void duerme()  // sobreescribimos el m�todo duerme
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
     // esta clase no sobreescribe el m�todo duerme: utilizar� el de Mamifero
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
		 //  Mamifero m = new Mamifero(); -> Error de compilaci�n
		 
		 // Sin embargo, podemos utilizar una referencia a Mamifero:
		 Mamifero m = new Gato();
		 m.duerme();  // invocamos m�todo de un objeto Gato
		 
		 // podemos averiguar de qu� tipo es el objeto referenciado por m:
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
   
   57.2 Crea un nuevo mam�fero, la clase Vaca. Haz que duerma 2 seg.
   
   57.3 Haz que todas las clases incorporen un atributo, ritmoCardiaco, y dos
    m�todos que permitan dar valor y leer el n�mero de pulsaciones que tiene el
	animal. Modifica solo las clases que sean necesarias.
  */
	
	
