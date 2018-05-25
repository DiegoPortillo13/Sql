
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Familia
 */
public class Selection_Sort {

    /**
     * @param args the command line arguments
     */
    static int count = 0;
    
    public static void main(String[] args) {
        // TODO code application logic here
  
        int[] Arreglo = new int[10];
        for (int i = 0; i < Arreglo.length; i++) {
            Arreglo[i] = (int) (Math.random() * 10) + 1;
        }
        //ImpArr(Arreglo);
        selectionSort(Arreglo);
        //ImpArr(Arreglo);//imprime el selection sort
       
        insertionSort(Arreglo);
        //ImpArr(Arreglo);// imprime el insertion sort
        
        bubbleSort(Arreglo);
        // ImpArr(Arreglo);
        
       
        mergeSort(Arreglo, 0, 10 - 1);
        //ImpArr(Arreglo);
        
        quickSort(Arreglo, 0, 10 - 1);
        //ImpArr(Arreglo);
        


    }

    public static void ImpArr(int[] Arre) {
        for (int i : Arre) {
            System.out.print("[" + i + "]");
        }
        System.out.println("");
    }

    public static void selectionSort(int[] Arre) {
              long t1 = System.currentTimeMillis();
        for (int i = 0; i < Arre.length - 1; i++) {
            int min = i;
            for (int j = i + 1; j < Arre.length; j++) {
                if (Arre[j] < Arre[min]) {
                    min = j;
                }
            }
            int t = Arre[min];
            Arre[min] = Arre[i];
            Arre[i] = t;
        }
         long t2 = System.currentTimeMillis() - t1;
        System.out.println("El tiempo de Selection Sort es: " + t2/1e6);
    }

    public static void insertionSort(int[] Arre) {
        int temp;long t1 = System.currentTimeMillis();
        int n = Arre.length;//Se declara una variable que lea todo el arreglo
        for (int i = 1; i < n; ++i) {//el for que recorre el arreglo
            int temp = Arre[i];//una variable temp con el valor en i
            int j = i - 1;//variable para la insersion
            while (j >= 0 && Arre[j] > temp) {
                Arre[j + 1] = Arre[j];
                j = j - 1;
            }
            Arre[j + 1] = temp;
        }
        long t3 = System.currentTimeMillis() - t1;
        System.out.println("El tiempo de Insertion Sort es: " + t3/1e6);
    }

    public static void bubbleSort(int[] Arre) {
              long t1 = System.currentTimeMillis();
        for (int i = 0; i < Arre.length - 1; i++) {
            for (int j = 0; j < Arre.length - 1; j++) {
                if (Arre[j] > Arre[j + 1]) {
                    int tmp = Arre[j + 1];
                    Arre[j + 1] = Arre[j];
                    Arre[j] = tmp;

                }

            }

        }
        long t3 = System.currentTimeMillis() - t1;
        System.out.println("El tiempo de Bubble Sort es: " + t3/1e6);
    }

    public static void mergeSort(int A[], int izq, int der) {
         
        if (izq < der) {
            int m = (izq + der) / 2;
            mergeSort(A, izq, m);
            mergeSort(A, m + 1, der);
            merge(A, izq, m, der);
        }

    }

    public static void merge(int A[], int izq, int m, int der) {
             long t1 = System.currentTimeMillis();
        int i, j, k;
        int[] B = new int[A.length]; //array auxiliar
        for (i = izq; i <= der; i++) //copia ambas mitades en el array auxiliar
        {
            B[i] = A[i];
        }

        i = izq;
        j = m + 1;
        k = izq;
        while (i <= m && j <= der) //copia el siguiente elemento más grande
        {
            if (B[i] <= B[j]) {
                A[k++] = B[i++];
            } else {
                A[k++] = B[j++];
            }
        }
        while (i <= m) //copia los elementos que quedan de la
        {
            A[k++] = B[i++]; //primera mitad (si los hay)
        }
                long t3 = System.currentTimeMillis() - t1;
        System.out.println("El tiempo de Merge Sort es: " + t3/1e6);
    }

    public static void quickSort(int A[], int izq, int der) {
      long t1 = System.currentTimeMillis();
        int pivote = A[izq]; 
        int i = izq; 
        int j = der; 
        int aux;

        while (i < j) {            
            while (A[i] <= pivote && i < j) {
                i++; 
            }
            while (A[j] > pivote) {
                j--;         
            }
            if (i < j) {                      
                aux = A[i];                  
                A[i] = A[j];
                A[j] = aux;
            }
        }
        A[izq] = A[j]; 
        A[j] = pivote; 
        if (izq < j - 1) {
            quickSort(A, izq, j - 1); 
        }
        if (j + 1 < der) {
            quickSort(A, j + 1, der); 
        }
        long t3 = System.currentTimeMillis() - t1;
        System.out.println("El tiempo de Quick Sort es: " + t3/1e6);
    }

}
