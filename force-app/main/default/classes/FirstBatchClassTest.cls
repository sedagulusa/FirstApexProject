@isTest
public class FirstBatchClassTest {
@isTest
    public static void testMethod1(){
        List<Salesforce_Project__c> projList= TestDataFactory.createProjects(200);
        Test.startTest();
        FirstBatchClass sfBatch=new FirstBatchClass();
        Database.executeBatch(sfBatch);//in test class dont give the batch size
        Test.stopTest();
        List<Salesforce_Project__c> prList=[Select Description__c from Salesforce_Project__c];
        for(Salesforce_Project__c prj:prList){
            system.assertEquals('Sample..Updating from Batch',prj.Description__c);
        }
        
    }
}