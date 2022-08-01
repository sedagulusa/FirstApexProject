public with sharing class exceptionHandling {

public static void exceptionHandlingDemo() {
//Insert an acc without a name
Account acc=new Account();
 try{
    insert acc;
}
 catch(DmlException e){
    system.debug('Exception'+e);
}
 finally{
    //you can throw customized error mssg or send an email
    system.debug('Finally block code');
}
    }
    public static void databaseMethodemo(){
        List<Account> accList=new List<Account>();
        Account acc1=new Account();  
        acc1.Name='FirstAccount';
        accList.add(acc1);
        Account acc2=new Account();
        accList.add(acc2);
        //Database insert-all or nothing(default true),false picks the good ones and inserts them
        List<Database.SaveResult> resultAcc=Database.insert(accList,false);
        for(Database.SaveResult result:resultAcc){
            if(result.isSuccess()){
                //Logic to create acc
                system.debug('I am successful'+result.id);
            }else{
                system.debug('Sorry I failed'+result.getErrors());
            }
        }
    }

}