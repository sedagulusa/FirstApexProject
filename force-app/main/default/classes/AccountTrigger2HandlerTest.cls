@isTest
public class AccountTrigger2HandlerTest {      
  //  @isTest
    public static void createContact1Test(){
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<3;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.Industry='Banking';
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        insert accList;
            List<Contact> CntList=new List<Contact>();
            for(Account acc:accList){
                Contact cnt=new Contact();
                cnt.AccountId=acc.Id;
                cnt.LastName=acc.Name;
                CntList.add(cnt);
            }               
        insert CntList;
        //Validate for last Name of contact
        //Test Starttest - Test Stoptest (Reset Governor Limit)
        test.startTest();
            List<Contact> newList = [Select LastName,Id,Account.Name from Contact];
            system.assertEquals('Test2', newList.get(1).Account.Name);
        test.stopTest();
        }
    @isTest
    Public static void createContact2Test(){
            Account acc = new Account();
            acc.Name = 'Test';
            acc.Active__c = 'Yes';
            acc.Number_of_Contacs__c=2;
            insert acc;
       
         test.startTest();
            List<Contact> newList = [Select LastName,Id,Account.Name,Account.Number_of_Contacs__c from Contact];
            system.assertEquals(acc.Number_of_Contacs__c,newList.size());
        test.stopTest();
    }    
    
  
}