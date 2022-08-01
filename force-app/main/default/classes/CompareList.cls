public class CompareList {
    public void compareListOfString(List<String> theOtherStringList){
        list<string> listOfstring=new list<string>();
        listOfString.add('TX');
        listOfString.add('GA');
        listOfString.add('VA');
        listOfString.add('MA');
        
        if(listOfString.equals(theOtherStringList)){
            system.debug('The values are matching!');
        }else{
            system.debug('Sorry,the values are not matching');
        }
    }

}