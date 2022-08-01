public class stringDemo {
    public void displaystringDemo() {
String demoString='We are learning string methods';
//1.toUpperCase
String upperString=demoString.toUpperCase();
system.debug('Print upper case '+upperString);
//2.toLowerCase
String lowerString=demoString.toLowerCase();
system.debug('Print lowercase '+lowerString);
//3.startsWith
Boolean startString=demoString.startsWith('We');
system.debug('Does the text start with given value? '+startString);//true
//4.endsWith
Boolean endString=demoString.endsWith('today');
system.debug('Does the text end with given value? '+endString);//false
//5.contains-exact match
Boolean containsLearning=demoString.contains('learning');
System.debug('Does the text contain learning?'+ containsLearning);//true
//6.containsIgnoreCase
Boolean containsLearning1 = demoString.containsIgnoreCase('LEARNING');
system.debug('Does the String contain with ignore case the given value? :'+containsLearning1);//true-ignoring
//7.equals
        String val1= 'IRON MAN';
        String val2= 'Iron Man';
        Boolean testEqualsTwoString = val1.equals(val2);
        system.debug('Are 2 strings equal :'+testEqualsTwoString);//false

        Boolean testEqualsTwoString1 = val1.equalsIgnoreCase(val2);
        system.debug('Are 2 strings equal :'+testEqualsTwoString1);//true
//8. equals-compare string and ID
        String testID = '0015i000006FWsVAAW';
        ID dummyValue = '0015i000006FWsVAAW';
        Boolean testEqualsIDString = testID.equals(dummyValue);
        system.debug('Are String and ID equal :'+testEqualsIDString);//true

    }
    public void homeWork(){
        String stringValue='Austin is Tax free';
        Boolean firstComparison=stringValue.contains('Texas');//false
        system.debug(firstComparison);


        String firstValue='Bubble';
        String secondValue='BUBBLE';
        Boolean result= firstValue.equalsIgnoreCase(secondValue);//true ignoring 
        system.debug(result);
       
    }
}