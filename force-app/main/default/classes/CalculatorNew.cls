public class CalculatorNew {
    public Integer dynamicCalculation(Integer num1,Integer num2,String operation){
        Integer result;
        if(operation.equalsIgnoreCase('addition')){
            result=num1+num2;
        }else if(operation.equalsIgnoreCase('substraction')){
            result=num1-num2;
        }else if(operation.equalsIgnoreCase('division')){
            result=num1/num2;
        }else if(operation.equalsIgnoreCase('multiplication')){
            result=num1*num2;
        }
        return result;
    } 
    
}