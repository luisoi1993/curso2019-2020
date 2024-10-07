/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package empleado;

import java.time.LocalDate;
/*No se usar enum a la hora de pedir al usuario que guarde uno
enum Departamento{
    INFORMATICA,
    VENTAS,
    ADMINISTRACION
}
*/
public class Empleado {

    static void add(Empleado emp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    static int size() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    static Object get(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
 
    String nombre;
    String apellidos;
    String dni;
    int numEmpleado;
    double salario;
    String departamento;
    String fechaNacimiento;
    LocalDate fechaAlta;
    String direccion;
    String telefono;
 

 
	public Empleado(String nombre,String apellidos,String dni,int numEmpleado,double salario,String departamento,String fechaNacimiento,
        LocalDate fechaAlta,String direccion,String telefono ) {
		this.nombre = nombre;
                this.apellidos= apellidos;
		this.dni = dni;
                this.numEmpleado=numEmpleado;
                this.salario=salario;
                this.departamento=departamento;
                this.fechaNacimiento=fechaNacimiento;
                this.fechaAlta=fechaAlta;
                this.direccion=direccion;
                this.telefono=telefono;
	}
 
	public String getnombre() {
		return nombre;
	}
	public void setnombre(String nombre) {
		this.nombre = nombre;
	}
        public String getapellidos(){
            return apellidos;
        }
        public void setapellidos(String apellidos){
            this.apellidos= apellidos;
        }
	public String getdni() {
		return dni;
	}
	public void setdni(String dni) {
		this.dni = dni;
	}
        public int getnumEmpleado() {
		return numEmpleado;
	}
	public void setnumEmpleado(int numEmpleado) {
		this.numEmpleado = numEmpleado;
	}
         public double getsalario() {
		return salario;
	}
	public void setsalario(double salario) {
		this.salario = salario;
	}
         public String getdepartamento() {
		return departamento;
	}
	public void setdepartamento(String departamento) {
		this.departamento=departamento;
	}
         public String getfechaNacimiento() {
		return fechaNacimiento;
	}
	public void setfechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento=fechaNacimiento;
	}
         public LocalDate getfechaAlta() {
		return fechaAlta;
	}
	public void setfechaAlta(LocalDate fechaAlta) {
		this.fechaAlta=fechaAlta;
	}
         public String getdireccion() {
		return direccion;
	}
	public void setdireccion(String direccion) {
		this.direccion=direccion;
	}
         public String gettelefono() {
		return telefono;
	}
	public void settelefono(String telefono) {
		this.telefono=telefono;
	}
 
 
 
	
 
 
 
}