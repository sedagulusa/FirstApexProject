public class DMLPracticeAssignment {
    public static List<Account> validAccounts(){
        List<Account> validAccs=[Select Name,Type From Account 
        Where Type in ('Prospect','Customer - Direct','Customer - Channel',
                       'Channel Partner / Reseller','Installation Partner',
                       'Technology Partner','Other')];
        return validAccs;
        //List<Account> validAccsWithType=DMLPracticeAssignment.validAccounts();
        //system.debug(validAccsWithType);
        //for(Account each:validAccsWithType){
        //system.debug(each);
        //}
        //
    }
    public static void inspectAccNum(){
        List<Account> inspectList=[Select AccountNumber From Account ];
        system.debug(inspectList);
        system.debug(inspectList.size());
        for (Account eachAcc:inspectList){
            if(eachAcc.AccountNumber==null){
             eachAcc.AccountNumber='ACC123456';
                update eachAcc;
                system.debug('Each account '+eachAcc);
            }  
        }
    }//DMLPracticeAssignment.inspectAccNum();
    public static void AccWithCont(){//parent to child [Selecet ID,Name,Number_of_Contacs__c,(Select Id,Name,Email from Contacts Where Email != Null) From Account];
        List<Account> accCont=[Select id, name,Number_of_Contacs__c, 
                               (select accountid,name from Contacts Where Email !=null) from Account];
       List<sObject> cont=[Select count(name) total , accountid from Contact Where Email !=null group by accountid];
       system.debug(accCont);
        system.debug(cont);
         for(Account a :accCont){ 
            for(sObject c:cont){
                  if(a.id==c.get('accountId')){
                    a.Number_of_Contacs__c=(Decimal)c.get('total');
                   system.debug('Number_of_Contacs__c '+a.Number_of_Contacs__c);
                } 
            }
        }
        update accCont;
    }
    public static void  populateAllowanceStatus(){
        List <Allowance__c> allw=[Select name,Status__c from Allowance__c];
        for(Allowance__c eachallw:allw){
            if(eachallw.Status__c==null){
                eachallw.Status__c='Submitted';
            } 
        }
        update allw;
    }
    public static void getTheCases(){//child to parent//[SELECT Id,Priority, Account.CustomerPriority__c FROM Case WHERE Account.CustomerPriority__c!=null]
        List<Account> casesWithAccounts=[Select id, CustomerPriority__c,                          
                                         (Select accountId, Priority from Cases)  
                                         from Account Where CustomerPriority__c !=null];
        system.debug(casesWithAccounts);
        List<Case> casesWithPri=[Select accountId, Priority from Case];
       
        for(Account acc :casesWithAccounts){ 
            for(Case cs:casesWithPri){
                  if(acc.id==cs.accountId){
                  cs.Priority=acc.CustomerPriority__c;
                } 
            }
        }
        update casesWithPri;
    }
}