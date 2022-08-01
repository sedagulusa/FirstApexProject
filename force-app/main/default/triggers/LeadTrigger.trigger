trigger LeadTrigger on Lead (before insert,after insert,before update,after update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        LeadTriggerHandler.checkClosedLostReason(Trigger.New,Trigger.Old,Trigger.NewMap,Trigger.OldMap);
    }
}