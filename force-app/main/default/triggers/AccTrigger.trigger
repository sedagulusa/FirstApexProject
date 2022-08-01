trigger AccTrigger on Account (before insert,after update,before update) {//creates an account and populate   
    //Scenario 1
    if(Trigger.isBefore && Trigger.isInsert){
            AccTriggerHandler.shippingAdressPopulate(Trigger.New);
    }
    //Scenario 4,Practice VIP
    if(Trigger.isUpdate && Trigger.isAfter){
        AccTriggerHandler.mailingUpdate(Trigger.new,Trigger.OldMap);
        AccTriggerHandler.contactVIPUpdate(Trigger.New,Trigger.NewMap,Trigger.OldMap);
    }
    //Scenario 5 with the flag for repetitive codes.
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        Boolean directFlag = false;
        directFlag = Trigger.isInsert;
        AccTriggerHandler.updateAccDescription(Trigger.New,Trigger.OldMap,directFlag);
    }
    //Assignment1 Account-Opportunity
    if(Trigger.isAfter && Trigger.isUpdate){
    AccTriggerHandler.updateOpps(Trigger.New);
}
}