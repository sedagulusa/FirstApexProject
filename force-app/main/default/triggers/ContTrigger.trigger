trigger ContTrigger on Contact (before insert,before update,after update) {//validation before submit,validation before update
    
    if(Trigger.isBefore )
    if(Trigger.isInsert || Trigger.isUpdate){
        ContTriggerHandler.errorValidtn1(Trigger.new);//2a
    }
    if(Trigger.isUpdate){
        ContTriggerHandler.errorValidtn2(Trigger.new,Trigger.OldMap);//2b
    }
    //Assignment 2
    if(Trigger.isBefore && Trigger.isInsert){
        ContTriggerHandler.contactPhoneSet(Trigger.New);
    }
   
}