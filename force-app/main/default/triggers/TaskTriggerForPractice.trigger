trigger TaskTriggerForPractice on Task (after insert, after update) {
  if(Trigger.isAfter){
        if(Trigger.isInsert){
            TaskTriggerPracticeHandler.updateLeadOnTaskInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            TaskTriggerPracticeHandler.updateLeadOnTaskUpdate(Trigger.new, Trigger.oldMap);
        }
}
        
}