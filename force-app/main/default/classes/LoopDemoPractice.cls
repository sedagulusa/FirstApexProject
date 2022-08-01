public class LoopDemoPractice {
    public void reverseListValues(){
        List<Integer> myList=new List<Integer>();
          myList.add(10);
          myList.add(20);
          myList.add(30);
          myList.add(40);
          myList.add(50);
        
         List<Integer> reverseList=new List<Integer>();
        for(integer i=myList.size()-1;i>=0;i--){
           reverseList.add(myList.get(i));
        }
        system.debug('The reverse list is: '+reverseList);
    }
}