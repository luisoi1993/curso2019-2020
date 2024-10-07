/*
 Ejercicio 1:
      Codifica el método 
	     public static void ordenaArraySeleccion(char[] caracteres){}
	  que ordena caracteres de mayor a menor. Realiza pruebas.
	  
   Ejercicio 2:
      Codifica el método 
	     public static void ordenaArrayBurbuja(char[] caracteres){}
	  que ordena caracteres de mayor a menor. Realiza pruebas.
	  
   Ejercicio 3:
      Codifica el método:
	     public static boolean repetidos(int[] numeros) {}
	  que, sobre un array ordenado, nos dice si hay elementos repetidos o no.
	  
   Ejercicio 4:
      Codifica el método:
	     public static int busquedaBinariaNum(int[]numeros, int n) {}
	  que devuelve el índice o posición del número n si lo encuentra en el array ( -1 si no está). 
	  El array numeros está ordenado y tienes que implementar una búsqueda binaria: irás a la mitad
	  del array en la primera comparación y, si no está el número buscado, te moverás hacia la parte 
	  del array donde pueda estar el número buscado según éste sea mayor o menor que el elemento
	  que acabamos de comparar.
 */
package ordenaarrays;


public class OrdenaArrays {
    public static void ordenaArraySeleccion(char[] caracteres) {
		char min;
		int pos;
		boolean cambio = false;
		for(int i=0; i < caracteres.length - 1; i++) {
			min = caracteres[i];   //valor mínimo en esta iteración
			pos = i;      // anotamos su posición en el array
			for(int j=i+1; j < caracteres.length; j++) {
				if( min > caracteres[j]) {
					min = caracteres[j];
					pos = j;
					cambio = true;
				}
			}
			if (cambio) {
				caracteres[pos] = caracteres[i];
				caracteres[i] = min;
				cambio = false;
			} 
			
		}
	}
    
    public static void ordenaArrayBurbuja(char[] caracteres) {
        char aux;
	boolean ordenado = false;  // para averiguar si el array está ya ordenado y parar
	for(int i=0; i < caracteres.length - 1 && ordenado==false; i++) {
		ordenado = true;
		for(int j=0; j < caracteres.length - 1 -i; j++) {
			if( caracteres[j] > caracteres[j+1]) {
				aux = caracteres[j];
				caracteres[j] = caracteres[j+1];
				caracteres[j+1] = aux;
				ordenado = false; // se ha realizado un cambio en esta iteración
			}
		}
			
	}
    }
    
    public static boolean repetidos(int[] numeros){
        boolean repetidos=false;
        
        for(int i=0;i<numeros.length-1;i++){
            for(int j=1;i<numeros.length;i++){
                if(numeros[i]==numeros[j]){
                    repetidos=true;
                }
            }
        }
        return repetidos;
    }
    
    public static int busquedaBinariaNum(int []numeros,int n){
        int posicion=-1;
        
        if(numeros[n]==n){
            posicion=n;
        }
        else{
            if(numeros[n]<n){
              for(int i=numeros[n];i<numeros.length;i++){
                if(numeros[i]==n){
                    posicion=numeros[i];
                }  
              }
            }
            else{
                for(int i=numeros[n];i>0;i--){
                   if(numeros[i]==n){
                       posicion=numeros[i];
                   } 
                }
            }
        }
        return posicion;
    }
    
    
    
    public static void main(String[] args) {
        int[] numeros=[10,7];
       
    
}
