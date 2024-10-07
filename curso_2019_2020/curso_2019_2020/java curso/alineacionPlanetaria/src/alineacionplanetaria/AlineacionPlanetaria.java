/*
 
 */
package alineacionplanetaria;

import java.util.Scanner;
public class AlineacionPlanetaria {

    
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int numPlanetas,resto=0,multiplicacion=1;
        int []numDias;
        int[]primos=new int[]{2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67};
        int[]contadores1=new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        int[]contadores2=new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        int[]contadores3=new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        int[]contadores4=new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        int[]contadores5=new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        int[]mult=new int[] {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        System.out.println("Digite el numero de planetas: ");
        numPlanetas=entrada.nextInt();
        numDias=new int[numPlanetas];
        for(int i=0;i<numPlanetas;i++){
        System.out.println("Digite el numero de dias del planeta. "+(i+1));
        numDias[i]=entrada.nextInt();
        }
        
        for(int i=0;i<numPlanetas;i++){
            for(int j=0;j==primos.length;j++){
                while(resto!=1){
                    resto=numDias[i]/primos[j];
                    switch(numPlanetas){
                        case 0: 
                            contadores1[j]++;
                            break;
                        case 1:
                            contadores2[j]++;
                            break;
                        case 2:
                            contadores3[j]++;
                            break;
                        case 3:
                            contadores4[j]++;
                            break;
                        case 4:
                            contadores5[j]++;
                            break;
                    }
                  
                    
                } 
            }
        }
        
       for(int i=0;i<contadores1.length;i++){ 
            if(contadores1[i]>contadores2[i]){
                contadores2[i]=contadores1[i];
            }
            else if(contadores2[i]>contadores3[i]){
                contadores3[i]=contadores2[i];
            }
            else if(contadores3[i]>contadores4[i]){
                contadores4[i]=contadores3[i];
            }
            else if(contadores4[i]>contadores5[i]){
                contadores5[i]=contadores4[i];
            }
            else if(contadores5[i]>mult[i]){
                mult[i]=contadores5[i];
            }
        } 
        for(int i=0;i<primos.length;i++){
            if(mult[i]>0){
                multiplicacion=(int)(multiplicacion*Math.pow(primos[i],mult[i]));
            }
        }
        System.out.println(multiplicacion);
    }
    
}
