/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package empleado;
public class Empleado {
 
	private String nombre_apellidos;
        private String dni;
        private int numEmpleado;
        private float salario;
        private String departamento;
	private String fechaNacimiento;
        private String fechaAlta;
        private String direccion;
        private int telefono;
 
	public Empleado (){};
 
	public Empleado(String nombre_apellidos,String dni,int numEmpleado,float salario,String departamento,String fechaNacimiento,
        String fechaNacimento,String fechaAlta,String direccion,int telefono ) {
		this.nombre_apellidos = nombre_apellidos;
		this.dni = dni;
                this.numEmpleado=numEmpleado;
                this.salario=salario;
                this.departamento=departamento;
                this.fechaNacimiento=fechaNacimiento;
                this.fechaAlta=fechaAlta;
                this.direccion=direccion;
                this.telefono=telefono;
	}
 
	
	public String getnombre_apellidos() {
		return nombre_apellidos;
	}
	public void setNombre(String nombre_apellidos) {
		this.nombre_apellidos = nombre_apellidos;
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
         public float getsalario() {
		return salario;
	}
	public void setsalario(float salario) {
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
         public String getfechaAlta() {
		return fechaAlta;
	}
	public void setfechaAlta(String fechaAlta) {
		this.fechaAlta=fechaAlta;
	}
         public String getdireccion() {
		return direccion;
	}
	public void setdireccion(String direccion) {
		this.direccion=direccion;
	}
         public int gettelefono() {
		return telefono;
	}
	public void settelefono(int telefono) {
		this.telefono=telefono;
	}
 
 
 
}