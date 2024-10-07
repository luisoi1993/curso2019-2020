/* POLIMORFISMO (SEGUNDA PARTE): UN EJEMPLO de TALLER..

Vamos a efectuar modificaciones en el dise�o de nuestras clases (esta operaci�n
	se conoce con el t�rmino de "refactoring": mejoramos un dise�o que,
	aunque funcione es dif�cil de leer o modificar).
	Vamos a hacer uso del POLIMORFISMO: crearemos un m�todo en la clase
	Vehiculo que podr� llamarse sobre objetos de las diferentes clases que
	hereden de Vehiculo. Este m�todo calcular� el importe de las operacines
	realizadas. 
	
	Observa c�mo se simplifica la clase Factura y c�mo �sta ya no depende de las
	clases concretas que hereden de Vehiculo: ella solo utiliza el interfaz
	que la clase abstracta Vehiculo ofrece. Podemos crear nuevas clases:
	Furgoneta, Quad, etc. y la clase Factura no necesitar� modificarse.
	
	El uso del polimorfismo (facilitado por la herencia ) hace 	posible que el 
	acoplamiento entre clases sea menor, permiti�ndonos ampliar nuestra 
	aplicaci�n m�s f�cilmente y con un menor riesgo de introducir errores en un 
	c�digo que ya funcionaba

*/

abstract class Tarifa
{
	// almacena, como CONSTANTES, las tarifas de cada servicio, seg�n
	// el veh�culo. Estos datos podr�an estar en fichero o en una base de datos.
    
	// COCHES
	public static final float lavadoCoche = 3.5f;
	public static final float revisionITVCoche = 25f;
	public static final float revisionPeriodicaCoche = 35f;
	public static final float paraleloCoche = 25f;

	// CAMIONES
	public static final float lavadoCamion = 20f;
	public static final float revisionITVCamion = 35f;
	public static final float revisionPeriodicaCamion = 60.5f;
	public static final float paraleloCamion = 45f;
	
	// MOTOCICLETAS
	public static final float lavadoMoto = 3f;
	public static final float revisionITVMoto = 20f;
	public static final float revisionPeriodicaMoto = 25f;
}

abstract class Vehiculo
{
	// atributos
	public String matricula;
	public String modelo;
	public String propietario;
	public String dniPropietario;
	
	public boolean lavado;
	public boolean revisionITV;
	public boolean revisionPeriodica;
	public int kilometros;
	
	// constructores
	Vehiculo(String matricula, String propietario, String dniPropietario, 
			 String modelo)
	{
		this.matricula = matricula;
		this.modelo = modelo;
		this.propietario = propietario;
		this.dniPropietario = dniPropietario;
	}
	Vehiculo(String matricula)
	{
		this.matricula = matricula;
		modelo = ""; propietario = ""; dniPropietario ="";
	}
	// aqu� podr�an declararse otros constructores...

	// m�todo abstracto: seimplementar�  en las subclases
	abstract public float importeOperaciones();  
									  
	void revisionITV()
	{
		revisionITV = true;
	}
	void revisionPeriodica(int kilometros)
	{
		revisionPeriodica = true;
		this.kilometros = kilometros;
	}
		
	void lavado()
	{
		lavado = true;
	}
	//void sustitucionNeumaticos(int referenciaNeumaticos, int numNeumaticos);
	// aqu� ir�an otros m�todos que fuesen comunes a los veh�culos
}
class Coche extends Vehiculo
{
	Coche(String matricula, String propietario, String dniPropietario, 
			 String modelo)
	{
		super(matricula, propietario, dniPropietario, modelo);
	}
	Coche(String matricula)
	{
		super(matricula);
	}
	boolean paralelo;
	void paralelo()
	{
		paralelo = true;
	}
	public float importeOperaciones()
	{
		float total = 0;
		if (lavado)
			total = total + Tarifa.lavadoCoche;
		if (revisionITV)
			total = total + Tarifa.revisionITVCoche;
		if (revisionPeriodica)
			total = total + Tarifa.revisionPeriodicaCoche;
		if (paralelo) //espefico de coche, no de veh�culo
			total = total +  Tarifa.paraleloCoche;
		return total;
	}

}

class Camion extends Vehiculo
{
	Camion(String matricula, String propietario, String dniPropietario, 
			 String modelo)
	{
		super(matricula, propietario, dniPropietario, modelo);
	}
	Camion(String matricula)
	{
		super(matricula);
	}
	boolean paralelo;
	void paralelo()
	{
		paralelo = true;
	}
	
	public float importeOperaciones()
	{
		float total  = 0;
		if (lavado)
			total = total + Tarifa.lavadoCamion;
		if (revisionITV)
			total = total + Tarifa.revisionITVCamion;
		if (revisionPeriodica)
			total = total + Tarifa.revisionPeriodicaCamion;
		if (paralelo) //espefico de cami�n, no de veh�culo
			total = total +  Tarifa.paraleloCamion;
		return total;
	}
}

class Moto extends Vehiculo
{
	Moto(String matricula, String propietario, String dniPropietario, 
			 String modelo)
	{
		super(matricula, propietario, dniPropietario, modelo);
	}
	Moto(String matricula)
	{
		super(matricula);
	}
	
	public float importeOperaciones()
	{
		float total = 0;
		if (lavado)
			total = total + Tarifa.lavadoMoto;
		if (revisionITV)
			total = total + Tarifa.revisionITVMoto;
		if (revisionPeriodica)
			total = total + Tarifa.revisionPeriodicaMoto;
		return total;
	}
	

}

/** Calcular� e imprimir� la factura de cada cliente.

*/
class Factura
{
	// atributos
	private Vehiculo vehiculo;  // referencia a un vehiculo
	private static final String CIFEmpresa = "234123412-G";
	private static final String nombreEmpresa = "Talleres Marchuti S.L.";
	private static int numFactura = 1; // contador facturas: deber�a guardarse 
								       // en una base de datos o ficheros para
								       // llevar la secuencia de las facturas...
	private String factura;    // aqu� guardaremos la factura
	// constructor
	Factura(Vehiculo vehiculo)
	{
		this.vehiculo = vehiculo;
	}
	void imprimeFactura()
	{
		if (factura != null)
			System.out.println(factura);
		else
			System.out.println("ERROR: factura a�n no generada");
	}
	String getFactura()
	{
		return factura; // devuelve la cadena que almacena la factura
	}
	void generaFactura()
	{
		factura = "\nEmpresa: " + nombreEmpresa + "\n" + 
		"CIF: " + CIFEmpresa + "\n";
		factura = factura.concat("Numero de factura: " + numFactura + "\n");
		numFactura++; // incrementamos la secuencia de facturas
		// a�adir fecha...
		factura = factura.concat("Matricula: " + vehiculo.matricula + "\n");
		factura = factura.concat("Propietario: " + vehiculo.propietario + "\n");
		factura = factura.concat("DNI: " + vehiculo.dniPropietario + "\n");
		// aqu� deber�amos imprimir los trabajos realizados... No lo hacemos.
        
		// calculamos importe
		float importe = 0;
		// �CLAVE!
		// invocamos el m�todo dado por el interfaz de Vehiculo, pero se
		// llamar� sobre el objeto concreto (qu� objeto concreto es se 
		// averigua en tiempo de ejecuci�n.
		// "Program to interfaces, not to implementations"
		importe = vehiculo.importeOperaciones();

		factura = factura.concat("Importe trabajos: " + importe + "Euros\n\n");
		return;
	}
	
}

public class TallerConPolimorfismo
{
	public static void main(String[] args)
	{
		Coche c1 = new Coche("M-5599-VK", "Belen Castro", "343242134", 
			"Opel Hito 0.9");
		c1.lavado();
		c1.paralelo();
		Factura f1 = new Factura(c1);
		f1.generaFactura();
		f1.imprimeFactura();
		
		Moto m2 = new Moto("3234 ABC", "Luis Perez", "21342342", "Honda Deep");
		m2.lavado();
		m2.revisionITV();
		Factura f2 = new Factura(m2);
		f2.generaFactura();
		f2.imprimeFactura();
	}
}

/* EJERCICIOS:

60.1 �Qu� ocurre ahora si creamos una nueva clase: Furgoneta? 
Anota las clases y m�todos que se ver�an afectados.
Crea la clase Furgoneta y a��dele el m�todo "paralelo" y un nuevo m�todo para
la operaci�n de grabado de r�tulos.

*/