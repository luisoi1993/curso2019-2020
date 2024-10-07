/* POLIMORFISMO (SEGUNDA PARTE): UN EJEMPLO de TALLER..

Vamos a efectuar modificaciones en el diseño de nuestras clases (esta operación
	se conoce con el término de "refactoring": mejoramos un diseño que,
	aunque funcione es difícil de leer o modificar).
	Vamos a hacer uso del POLIMORFISMO: crearemos un método en la clase
	Vehiculo que podrá llamarse sobre objetos de las diferentes clases que
	hereden de Vehiculo. Este método calculará el importe de las operacines
	realizadas. 
	
	Observa cómo se simplifica la clase Factura y cómo ésta ya no depende de las
	clases concretas que hereden de Vehiculo: ella solo utiliza el interfaz
	que la clase abstracta Vehiculo ofrece. Podemos crear nuevas clases:
	Furgoneta, Quad, etc. y la clase Factura no necesitará modificarse.
	
	El uso del polimorfismo (facilitado por la herencia ) hace 	posible que el 
	acoplamiento entre clases sea menor, permitiéndonos ampliar nuestra 
	aplicación más fácilmente y con un menor riesgo de introducir errores en un 
	código que ya funcionaba

*/

abstract class Tarifa
{
	// almacena, como CONSTANTES, las tarifas de cada servicio, según
	// el vehículo. Estos datos podrían estar en fichero o en una base de datos.
    
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
	// aquí podrían declararse otros constructores...

	// método abstracto: seimplementará  en las subclases
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
	// aquí irían otros métodos que fuesen comunes a los vehículos
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
		if (paralelo) //espefico de coche, no de vehículo
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
		if (paralelo) //espefico de camión, no de vehículo
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

/** Calculará e imprimirá la factura de cada cliente.

*/
class Factura
{
	// atributos
	private Vehiculo vehiculo;  // referencia a un vehiculo
	private static final String CIFEmpresa = "234123412-G";
	private static final String nombreEmpresa = "Talleres Marchuti S.L.";
	private static int numFactura = 1; // contador facturas: debería guardarse 
								       // en una base de datos o ficheros para
								       // llevar la secuencia de las facturas...
	private String factura;    // aquí guardaremos la factura
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
			System.out.println("ERROR: factura aún no generada");
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
		// añadir fecha...
		factura = factura.concat("Matricula: " + vehiculo.matricula + "\n");
		factura = factura.concat("Propietario: " + vehiculo.propietario + "\n");
		factura = factura.concat("DNI: " + vehiculo.dniPropietario + "\n");
		// aquí deberíamos imprimir los trabajos realizados... No lo hacemos.
        
		// calculamos importe
		float importe = 0;
		// ¡CLAVE!
		// invocamos el método dado por el interfaz de Vehiculo, pero se
		// llamará sobre el objeto concreto (qué objeto concreto es se 
		// averigua en tiempo de ejecución.
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

60.1 ¿Qué ocurre ahora si creamos una nueva clase: Furgoneta? 
Anota las clases y métodos que se verían afectados.
Crea la clase Furgoneta y añádele el método "paralelo" y un nuevo método para
la operación de grabado de rótulos.

*/