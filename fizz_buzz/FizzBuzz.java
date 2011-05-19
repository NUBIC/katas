public class FizzBuzz {

  // 1
  // public static void main(String[] args) {
  //   for (int i = 1; i <= 100; i++) {
  //     String result = "";
  //     if (i % 3 == 0) {
  //       result += "Fizz";
  //     } 
  //     if (i % 5 == 0) {
  //       result += "Buzz";
  //     }
  //     if (result == "") {
  //       result = Integer.toString(i);
  //     }
  //     System.out.println(result);
  //   }
  // }

  // 2
  public static void main(String[] args) {
    int i = 1;
    while (i <=100) {
      System.out.println(getFizzBuzzValue(i));
      i++;
    }
  }
  
  public static String getFizzBuzzValue(int i) {
    if ((i % 3 == 0) && (i % 5 == 0)) {
      return "FizzBuzz";
    } else if (i % 3 == 0) {
      return "Fizz";
    } else if (i % 5 == 0) {
      return "Buzz";
    } else {
      return Integer.toString(i);
    }
  }
  
}