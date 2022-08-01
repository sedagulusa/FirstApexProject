trigger SalesforceTicketTrigger on Salesforce_Ticket__c (after Update) {
 if(Trigger.isAfter && Trigger.isUpdate){
        SalesforceTicketTriggerHandler.projMarkComplete(Trigger.New);
    }
}