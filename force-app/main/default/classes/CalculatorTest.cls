//Annotation-It modifies the way a class/method should behave
   @isTest
    public class CalculatorTest {
   @isTest
    public static void calcTest(){
        calculator calc=new calculator();
        calc.add(4,7);
        //Assertions-to validate the result(true/false)(expected/actual)
        system.assertEquals(11,calc.result);
        calc.a=30;
        calc.b=15;
        calc.sub();
            system.assertEquals(15,calc.result);
        calc.multiply();
            system.assertEquals(450,calc.result);
        calc.division();
            system.assertEquals(2,calc.result);
    }
    @isTest    
    public static void dynamicCalulationMethodTest(){
        calculator calc=new calculator();
        Integer resultValue;
        resultValue=calc.dynamicCalulationMethod(10, 20, 'addition');
        system.assertEquals(30,resultValue);
        resultValue=calc.dynamicCalulationMethod(20, 10, 'SUBSTRACTION');
        system.assertEquals(10,resultValue);
        resultValue=calc.dynamicCalulationMethod(100, 20, 'DIVISION');
        system.assertEquals(5,resultValue);
        resultValue=calc.dynamicCalulationMethod(10, 20, 'MULTIPLICATION');
        system.assertEquals(200,resultValue);
    }
       
}