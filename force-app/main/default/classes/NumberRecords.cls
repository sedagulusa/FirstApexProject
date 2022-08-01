public class NumberRecords {
    public void validateNumbers(Integer inputNum){
        List<Integer> numberList=new List<Integer>();
        numberList.add(44);
        numberList.add(67);
        numberList.add(77);
        numberList.add(88);
        if(numberList.contains(inputNum)){
            system.debug('Number exists.');
        }else{
           system.debug('Number does not exist.'); 
        }    
    }
    public void compareSet(Set<Integer> inputSet){
        Set<Integer> values=new Set<Integer>();
        values.add(111);
        values.add(222);
        values.add(333);
        values.add(444);
        if(values.equals(inputSet)){
            system.debug('Both sets are identical.');
        }else{
            system.debug('Both sets are different.');
        }
          

    }
}