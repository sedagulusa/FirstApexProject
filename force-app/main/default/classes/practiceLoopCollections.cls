public class practiceLoopCollections {
    public static void findValuesInMap(){

       Map<String,Double> currMap=new Map<String,Double>{'AUD'=>0.73,'CAD'=>0.78,'EUR'=>1.13,'NZD'=>0.68,'INR'=>0.013};

       Set<String> mySet=currMap.keySet();

       system.debug('My keyset '+mySet);
       
       if(mySet.contains('SAD')){
        system.debug('SAD value is '+ currMap.get('SAD'));
       }else{
        system.debug('The searched ISO code is not available for SAD.');
      }
    }
    public static void getUniqueValues(){
      List<String> inputList=new List<String>{'Apple','Apple','Orange','Fig','Grape','Apple','Grape','Fig','Kiwi','Pineapple'};
      System.debug('The input is '+inputList);
      Set<String> outputSet=new Set<String>();
      outputSet.addAll(inputList);
      system.debug('The output is '+outputSet);
    }
    
}