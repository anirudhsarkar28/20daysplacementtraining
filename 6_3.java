import java.util.*;

public class Main {
  public static void main(String[] args) {
      String w;
    for (int i=1; i<21; i=i+1){
        if (i % 2 == 0){
            w = "even";
        }
        else{
            w = "odd";
        }
        System.out.println((i) + " is " + (w) );
    }
  }
}
