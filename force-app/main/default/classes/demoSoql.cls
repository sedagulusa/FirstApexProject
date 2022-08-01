public class demoSoql {
    public static void demoSoql_1() {
    List<Account> myAccList=[Select name,id,Active__c from Account Limit 2];
    system.debug(myAccList);
    system.debug(myAccList.size());
    Account acc=[Select Id,name,CreatedDate from Account ORDER BY CreatedDate desc limit 1 ];
    system.debug('latest created account is :'+acc);
    }
    public static void demoSoql_2(){
        Account acc=[Select Id,name,Phone,CreatedDate from Account ORDER BY CreatedDate desc limit 1 ];
        
        String accountname= acc.Name;
        string accountphone=acc.Phone;
        system.debug('latest created account is :'+acc+ 'name and phone are :'+accountname+' '+accountphone );
    }
    public static void demoSoql_3(){
        List<Account> myAccList=[Select name,id,Active__c,phone from Account Limit 5];
        for(account acc:myAccList){
            String accountname=acc.Name;
            String accountphone=acc.phone;
            String isactive=acc.Active__c;
            system.debug(accountname +accountphone + isactive);
        }

    }
}
