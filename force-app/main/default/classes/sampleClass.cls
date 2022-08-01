public class sampleClass {  
     Private string myString='I am private';
     public string myString1='I am Public';
    
    
    
    
   
   Public String getFullName(String firstName,String lastName){
    String fullName = firstName +' '+ lastName;
       system.debug(fullName);
       return fullName;
   }
    public Integer getSum(Integer a,Integer b,Integer c){
        Integer sum = a + b+ c;
        system.debug(sum);
        return sum;
    }
    public Boolean getContains(String demoString){
        Boolean checkContainsValue = demoString.contains('testing');
        system.debug(checkContainsValue);
        return checkContainsValue;
    }
    public String reverseString(String text){
        String textReversed=text.reverse();
        system.debug(textReversed);
        return textReversed;
    }
    public decimal addingNumbers(decimal x,decimal y){
        decimal sum1=x+y;
        system.debug(sum1);
        return sum1;
    }
    public decimal addingNumbers(decimal x,decimal y,decimal z){
        decimal sum2=x+y+z;
        system.debug(sum2);
        return sum2;
    } 
}