/*
 * De cada empleado mantendremos la siguiente información:

    Nombre y apellidos
    DNI con letra.
    Número de empleado: asignado por la aplicación en el momento del alta. Será único.
    Salario actual
    Departamento: Informática, Ventas, Administración.
    Fecha de nacimiento.
    Fecha de alta en la aplicación.
    Dirección: susceptible de dividirse en varios campos.
    Teléfono.
 */
package gestionempleados;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
/**
 *
 * @author chema
 */


public class Empleado {
    String nombre;
    String apellidos;
    String DNI;
    int numEmpleado;
    double salario;
    Departamento departamento;  
    LocalDate fechaNacimiento;
    LocalDate fechaAlta;
    String direccion;
    String telefono;
    
    static int nEmpleados = 1;  // para asignar automáticamente número de empl.
                                // valor siempre creciente
    
    
    public Empleado() {  // ctor. por defecto
        this.numEmpleado = nEmpleados;
        nEmpleados++;
        
    }
    public Empleado(String DNI, String nombre, String apellidos) {
       this(); // llama al constructor por defecto. Debe estar en primera línea.
       this.DNI= DNI;
       this.nombre = nombre;
       this.apellidos = apellidos;    
    }

    // setters and getters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getNumEmpleado() {
        return numEmpleado;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public Departamento getDepartamento() {
        return departamento;
    }

    public void setDepartamento(Departamento departamento) {
        this.departamento = departamento;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public LocalDate getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(LocalDate fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    private String getFechaFormateada(LocalDate date) {
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return date.format(formato);
    }
    // anotación: da información al compilador (evita errores al sobrescribir)
    @Override   
    public String toString() {
        String resul = 
            "=====================================\n" +
            "Numero de empleado: " + numEmpleado + "\n" +
            "Nombre:  " + nombre + "\n" +
            "Apellidos:" + apellidos + "\n" +
            "DNI: " + DNI + "\n" +
            "Salario: " + salario + "\n" +
            "Departamento: " + departamento + "\n" +
            "Fecha de nacimiento: " + getFechaFormateada(fechaNacimiento) + "\n" +
            "Fecha de alta: " +  getFechaFormateada(fechaAlta) + "\n" +
            "Direccion: " +  direccion + "\n" +
            "Telefono: " + telefono + "\n" +
            "-------------------------------------";
        return resul;
    }
    
}
