/* POLIMORFISMO (PRIMERA PARTE): UN EJEMPLO de TALLER..

Soluci�n inicial, poco orientada a objetos.

 Supongamos que realizamos una aplicaci�n para un taller de mec�nica r�pida
del autom�vil. Esta aplicaci�n anotar� los trabajos que se realizan en los
veh�culos de los clientes e imprimir� una factura. Las clases y los m�todos
que se proporcionan son una simplificaci�n de lo que podr�a ser una aplicaci�n
profesional, pero nos servir� para ver algunas caracter�sticas de la 
programaci�n orientada a objetos.

Vamos a realizar una primera soluci�n: en ella, aunque utilizamos objetos,
la forma de trabajar no es demasiado "orientada a objetos", m�s bien es 
orientada a procedimientos. Ve�mosla.
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

}

/** Calcular� e imprimir� la factura de cada cliente.
Esta clase no est� bien dise�ada: es dif�cil de extender y si se producen
cambios en la aplicaci�n, se ve bastante afectada...
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
		// Ver el ejercicio 1.
        
		// calculamos importe
		float importe = 0;
		if (vehiculo instanceof Coche)
		{
			// convertimos a Coche el veh�culo
			importe = calculaFacturaCoche( (Coche) vehiculo ); // casting!!
		}
		else if (vehiculo instanceof Camion)
		{
			// convertimos a Camion el veh�culo
			importe = calculaFacturaCamion( (Camion) vehiculo ); // casting!!
		}
		else if (vehiculo instanceof Moto)			
		{
			// convertimos a Moto el veh�culo
			importe = calculaFacturaMoto( (Moto) vehiculo ); // casting!!
		}
		else // error...
		{
			System.out.println("Error, el vehiculo pasado no es v�lido para" +
				" facturar");
			System.exit(1); // termina la ejecuci�n
		}
		factura = factura.concat("Importe trabajos: " + importe + "Euros\n\n");
		return;
	}
	
	private float calculaFacturaCoche(Coche c)
	{
		float total = 0;
		if (c.lavado)
			total = total + Tarifa.lavadoCoche;
		if (c.revisionITV)
			total = total + Tarifa.revisionITVCoche;
		if (c.revisionPeriodica)
			total = total + Tarifa.revisionPeriodicaCoche;
		if (c.paralelo) //espefico de coche, no de veh�culo
			total = total +  Tarifa.paraleloCoche;
		return total;
	}
	
	private float calculaFacturaCamion(Camion c)
	{
		float total  = 0;
		if (c.lavado)
			total = total + Tarifa.lavadoCamion;
		if (c.revisionITV)
			total = total + Tarifa.revisionITVCamion;
		if (c.revisionPeriodica)
			total = total + Tarifa.revisionPeriodicaCamion;
		if (c.paralelo) //espefico de cami�n, no de veh�culo
			total = total +  Tarifa.paraleloCamion;
		return total;
	}
	private float calculaFacturaMoto(Moto c)
	{
		float total = 0;
		if (c.lavado)
			total = total + Tarifa.lavadoMoto;
		if (c.revisionITV)
			total = total + Tarifa.revisionITVMoto;
		if (c.revisionPeriodica)
			total = total + Tarifa.revisionPeriodicaMoto;
		return total;
	}
	
}

public class Taller
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
60.0 Modifica el programa para que se a�ada un 16% de IVA a la factura.
El importe del IVA debe figurar por separado, y despu�s el total.

60.1 Modifica el programa para que se puedan imprimir en la factura los 
trabajos realizados y su importe individual.

60.2. �Qu� partes del programa cambiar�n si se a�ade un nuevo servicio 
espec�fico de la clase Moto? Anota todas las clases y m�todos que se ver�n
afectados.

60.3 �Qu� ocurre si creamos una nueva clase: Furgoneta? Anota las clases y 
m�todos que se ver�an afectados.
Crea la clase Furgoneta y a��dele el m�todo "paralelo" y un nuevo m�todo para
la operaci�n de grabado de r�tulos.

60.4 Investiga la clase Date en el API de Java para poder a�adir la fecha 
de emisi�n de la factura.
*/