trigger SalesforceProjectPracticeTrigger on Salesforce_Project__c (after insert,before update,before insert,after update) {
    
    if(trigger.isAfter && trigger.isInsert){
        SalesforceProjectPracticeTriggerHandler.createTickets(Trigger.New);
    }
     if(trigger.isBefore && trigger.isUpdate){
        SalesforceProjectPracticeTriggerHandler.checkForOpenTickets(Trigger.New,Trigger.NewMap);
     }   
}