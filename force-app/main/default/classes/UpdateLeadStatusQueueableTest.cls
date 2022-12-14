@isTest
public with sharing class UpdateLeadStatusQueueableTest {
    
    @isTest 
    public static void testMethod1(){
        List<Lead> leadList = TestDataFactory.createLead(36);
        updateLeadStatusQueueable leadQueue = new updateLeadStatusQueueable(leadList);
        //Execute the Queueable 
        test.startTest();
            system.enqueueJob(leadQueue);
        test.stopTest();
        List<Lead> leadToUpdate = [SELECT Status FROM Lead];
        
        for(Lead ld : leadToUpdate){
            System.assertEquals('Closed - Converted', ld.Status);
        }
    }
}