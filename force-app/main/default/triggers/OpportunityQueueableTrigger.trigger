trigger OpportunityQueueableTrigger on Opportunity (after insert,after update,after delete,after undelete) {
if(trigger.isAfter){
    if(Trigger.isInsert){
        OpportunityQueueableTriggerHandler.afterInsertDeleteUndeleteOpp(trigger.new);
    }
    if(Trigger.isDelete){
        OpportunityQueueableTriggerHandler.afterInsertDeleteUndeleteOpp(trigger.old);
    }
    if(Trigger.isUndelete){
        OpportunityQueueableTriggerHandler.afterInsertDeleteUndeleteOpp(trigger.new);
    }
    if(trigger.isUpdate){
        OpportunityQueueableTriggerHandler.afterUpdate(Trigger.newMap,Trigger.oldMap);
    }
}
}