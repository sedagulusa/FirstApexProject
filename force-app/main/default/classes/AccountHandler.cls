public class AccountHandler {
    public static List<Account> insertNewAccount(List<String> myList){
    List<Account> accList=new List<Account>();
        if(!myList.isEmpty()){
           for(String accEach:myList){
            Account acc=new Account();
            acc.Name=accEach;
               accList.add(acc);
               system.debug(accList);
        } 
            if(!accList.isEmpty()){
                insert accList;
                system.debug('insert succsesfully');
            }
                
                //llllllllll
           return accList; 
            
        }else
            system.debug('Pls enter some string values.');
        
        return null;
       
    }
}