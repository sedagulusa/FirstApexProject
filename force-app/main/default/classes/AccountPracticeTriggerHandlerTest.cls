@isTest
public class AccountPracticeTriggerHandlerTest {
    
    /* Trigger / TriggerHandler => Find the logic that will fire the trigger (DML)
    */
    
    @testSetup
    public static void TestDataSetup(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<100;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.Active__c = 'No';
            acc.Description = 'Inactive';
            acc.VIP__c = false;
            accList.add(acc);
        }
        insert accList;
        //Insert 100 contacts
        List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<100;i++){
            Contact con = new Contact();
            con.LastName = 'TestContact';
            con.VIP__c = false;            
            con.AccountId = accList.get(i).id;
            conList.add(con);
        }
        insert conList;
    }
    
    @isTest
    public static void testMethodUpdate(){
        List<Account> accList = [Select Name,Active__c,Description from Account];
        for(Account acc : accList){
            acc.Active__c = 'Yes';
        }
        //fire the trigger
        update accList;
        //Validate 
        //Test Starttest - Test Stoptest (Reset Governor Limit)
        test.startTest();
            List<Account> accListUpdate = [Select Active__c,Description from Account];
            system.assertEquals('Account is Active', accListUpdate.get(1).Description);
        test.stopTest();
        
    }
    
    @isTest
    public static void updateVIPforContactsTest(){
        List<Account> accList = [Select Name,VIP__c from Account];        
        for(Account acc : accList){
            acc.VIP__c = true;            
        }
        //trigger will be fired
        update accList;
        //SOQL Contacts
        Test.starttest();
        List<Contact> conList = [Select Id,VIP__c from Contact];
        for(Contact con: conList){
            system.assertEquals(true, con.VIP__c);
        }
        Test.stoptest();
    }
    
}