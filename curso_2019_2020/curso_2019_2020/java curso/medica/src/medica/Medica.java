/*He tenido algunos problemas y no he podido optimazarlo del todo, al final he implementado 
unas cuantas lineas de codigo y ha empezado a tener errores en algunas cosas que ya tenia solucionadas.
 */
package medica;


import java.util.Random;
import java.util.Scanner;
public class Medica {

   
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int eleccion=1,numCliente=0,sum=0,contLlamada=0,contLlamadaActiva=0;
        int contUltimos=0,numClienteTotal=0,contFinHoras=0;
        String contenedor[]=new String[100];
        int llegadaHora[]=new int[100];
        int llegadaMin[]= new int[100];
        int llegadaHoraActiva[]= new int[100];
        int llegadaMinActiva[]= new int[100];
        String ultimos[]=new String[5];
        String temporal[]=new String[sum];
        String pacientesTotales[]=new String[100];
        int finHora[]= new int[100];
        int finMin[]= new int[100];
        
        while(eleccion!=9){
            System.out.println(
                "Elige una opcion: "
                + "\n1.Generar codigo."
                + "\n2.Llamar siguiente cliente. "
                + "\n3.Elegir paciente. "
                + "\n4.Mostrar lista de espera. "
                + "\n5.Mostrar pantalla de llamada."
                + "\n6.Marcar paciente como ya atendido. "
                + "\n7.Mostrar histórico diario. "
                + "\n8.Estadísticas "
                + "\n9.Salir aplicacion");
            eleccion=entrada.nextInt();
            switch(eleccion){
                case 1:
                    Random aleatorio = new Random();
                    String letra = "ABCDEFGHIJKLMNOPQRSTVWXYZ";
                    String cadena = "";    
                    int numero = (int)(Math.random()*9+1);
                    int numero2 = (int)(Math.random()*9+1);
                    int forma,forma2;
                    boolean iguales =false;
                    
                    forma=(int)(aleatorio.nextDouble() * letra.length()-1+0);
                    forma2=(int)(aleatorio.nextDouble() * letra.length()-1+0);
                    cadena=cadena+letra.charAt(forma)+numero+letra.charAt(forma2)+numero2;
                    System.out.println(cadena);
                    
                    for(int i=0;i<numCliente;i++){
                      if(contenedor[i].equals(cadena)){
                          iguales=true;
                      }
                    }
                      if(iguales==false){
                          contenedor[sum]=cadena;
                          pacientesTotales[numClienteTotal]=cadena;
                          numClienteTotal++;
                          sum++;
                      }
                      else{
                          System.out.println("Los codigos son iguales,vuelva a generarlo. ");
                      }
                      
                      System.out.println("Digite la hora de llegada: ");
                      llegadaHora[contLlamada]=entrada.nextInt();
                      System.out.println("Digite otra vez la hora de llegada: ");
                      llegadaHoraActiva[contLlamadaActiva]=entrada.nextInt();
                      System.out.println("Digite los minutos de llegada: ");
                      llegadaMin[contLlamada]=entrada.nextInt();
                      System.out.println("Digite otra vez los minutos de llegada: ");
                      llegadaMinActiva[contLlamadaActiva]=entrada.nextInt();
                      contLlamada++;
                      
           
                      
                    break;
                
                case 2:
                    System.out.println("Es el turno del paciente con codigo: "+contenedor[0]);
                    if(contUltimos<4){
                        ultimos[contUltimos]=contenedor[0];
                        contUltimos++;
                    }
                    else{
                        contUltimos=0;
                    }
                    contenedor[0]=null;
                     sum--;
                    for(int i=1;i<sum;i++){
                        int temp=0;
                        temporal[temp]=contenedor[i];
                        temp++;
                        
                        
                    }
                     for(int i=0;i<sum;i++){
                        contenedor[i]=temporal[i];
                    }
                    numCliente++;
                    
                    break;
                
                case 3:
                    int numPaciente,conta=1;
                    
                    
                    for(int i=0;i<sum;i++){
                        System.out.println(conta+"."+contenedor[i]);
                        conta++;
                    }
                    System.out.println("Seleccione un paciente: ");
                    numPaciente=entrada.nextInt()-1;
                    System.out.println("Turno de : "+contenedor[numPaciente]);
                     if(contUltimos<4){
                        contUltimos++;
                        ultimos[contUltimos]=contenedor[numPaciente];
                    }
                    else{
                        contUltimos=0;
                    }
                    contenedor[numPaciente]=null;
                    sum--;
                   
                    
                    for(int i=0;i<sum+1;i++){
                        int temp=0;
                        
                        if(i!=numPaciente){
                            temporal[temp]=contenedor[i];
                            temp++;
                        }
                        else{
                            i++;
                        }
                        
                    }
                    
                    for(int i=0;i<sum;i++){
                        contenedor[i]=temporal[i];
                    }
                    
                    break;
                    
                case 4:
                    int contar=1;
                    
                    for(int i=0;i<sum;i++){
                        System.out.println(contar+"."+contenedor[i]);
                        contar++;
                    }
                break;
                
                case 5:
                    for(int i=0;i<5;i++){
                        System.out.println(ultimos[i]);
                    }
                    break;
                    
                case 6:
                    System.out.println("Digite la hora de finalizacion: ");
                    finHora[contFinHoras]=entrada.nextInt();
                    System.out.println("Digite los minutos de finalizacion: ");
                    finMin[contFinHoras]=entrada.nextInt();
                    contFinHoras++;
                    break;
                    
                case 7:
                    for(int i=0;i<100;i++){
                        System.out.println((i+1)+"paciente: "+pacientesTotales[i]
                                +"\nllegada: "+llegadaHora[i]+":"+llegadaMin[i]+" "
                                +"\nFin: "+finHora[i]+":"+finMin[i]);
                    }
                    break;
                    
                case 8:
                    int totalHorasLlegada=0,totalMinLlegada=0;
                    int totalHorasFin=0,totalMinFin=0;
                    int sumaHorasL,sumaHorasF,totalL,totalF,totales,resultado;
                    
                    for(int i=0;i<numClienteTotal;i++){
                        totalHorasLlegada=totalHorasLlegada+llegadaHora[i];
                        totalMinLlegada=totalMinLlegada+llegadaMin[i];
                        totalHorasFin=totalHorasFin+finHora[i];
                        totalMinFin=totalMinFin+finMin[i];
                        
                    }
                    sumaHorasL=totalHorasLlegada*60;
                    sumaHorasF=totalHorasFin*60;
                    totalL=sumaHorasL+totalMinLlegada;
                    totalF=sumaHorasF+totalMinFin;
                    totales=totalF-totalL;
                    resultado=totales/numClienteTotal;
                    System.out.println("Numero total de pacientes: "+ numClienteTotal
                    +"\nTiempo medio de espera: "+resultado);
                    break;
                    
                case 9:
                    System.out.println("Adios...");
                    break;
                    
                default:System.out.println("Digite otro numero: ");
            }
        }
    }
    
}
