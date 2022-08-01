public class LpDemo {
    
    public void sumOfInt(list<Integer> myList){
        if(!myList.isEmpty()){
            
            Integer sum=0;
                for(Integer value:myList){
                sum=sum+value;
            }
            system.debug('The sum of my elements is: '+sum);
        }else{
            system.debug('List is Empty.');
        }
    }
    public void multiplicationTable(Integer constant){
        for(Integer i=1;i<=10;i++){
            system.debug(i +' x '+constant+' = '+ (i*constant));
        }
    }
}