trigger SFProjectFutureTrigger on Salesforce_Project__c (after insert,after update) {
    if(Trigger.isAfter && Trigger.isInsert){
      //  SFProjectFutureTriggerHandler.updateProjectDescription(Trigger.newMap.keySet());
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        SFProjectFutureTriggerHandler.prepProjIds(Trigger.New,Trigger.OldMap);
}
}