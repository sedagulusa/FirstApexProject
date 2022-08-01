public class ListIteration {
    public void iterateIntegerList(){
        List<Integer> myList=new List<Integer>();
        myList.add(1);
        myList.add(5);
        myList.add(15);
        myList.add(20);
        myList.add(30);
        system.debug(myList);
        for (Integer expectedValue:myList){
            system.debug(expectedValue);
        }
        
    }
      public void iterateStringList(){
          List<String> myList1=new List<String>();
        myList1.add('Onur');
        myList1.add('Berna');
        myList1.add('Bahar');
        myList1.add('Zehra');
        myList1.add('Nargiza');
          system.debug(myList1);      
          for (String name:myList1){
              system.debug(name);
          }
      }         
}