trigger AccountPracticeTrigger on Account (before insert,after update,before update,before delete,after delete) {
    if(Trigger.isBefore && Trigger.isInsert){
        
        AccountPracticeTriggerHandler.fillShippingDetails(Trigger.New);
      
        }
    //Scenario 4,Practice
    if(Trigger.isUpdate && Trigger.isAfter){
        AccountPracticeTriggerHandler.matchMailingwithContacts(Trigger.New,Trigger.OldMap);
        AccountPracticeTriggerHandler.contactVIPUpdate(Trigger.New,Trigger.NewMap,Trigger.OldMap);
    }
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        Boolean directFlag = false;
        directFlag = Trigger.isInsert;
        AccountPracticeTriggerHandler.updateAccDescription(Trigger.New,Trigger.OldMap,directFlag);
    }
    //Scenario 6
    if(Trigger.isBefore && Trigger.isDelete){
    AccountPracticeTriggerHandler.addErrorOnDelete(Trigger.Old);
    }
    //Scenario 7
    if(Trigger.isAfter && Trigger.isDelete){
    AccountPracticeTriggerHandler.sendEmailOnDelete(Trigger.old);
    }
    //Scenario 8
    if(trigger.isAfter && Trigger.isUndelete){
    AccountPracticeTriggerHandler.sendEmailOnUndelete(Trigger.new);
    }
    //Queable job
    if(Trigger.isAfter && Trigger.isInsert && !system.isQueueable()){
        system.enqueueJob(new secondJobQueueable(Trigger.new));
    }
   
    }