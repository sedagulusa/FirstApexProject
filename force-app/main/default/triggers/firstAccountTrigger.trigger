trigger firstAccountTrigger on Account (after update) {//insert means new record should be created.update is old.
    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('Display values on Before Insert '+ Trigger.new);
        //List without an ID.
        
    }
    if(Trigger.isAfter && Trigger.isInsert){
        system.debug('Display values on After Insert '+ Trigger.new);
        //List with the ID.
    }//The list is going to have the new versions.
    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('Old Values: '+Trigger.Old);
        system.debug('New Values: '+Trigger.New); 
        List<Account> accListOld = Trigger.Old;
        List<Account> accListNew = Trigger.new;
    }

    if(Trigger.isAfter && Trigger.isUpdate){
        system.debug('Old Values Map: '+Trigger.OldMap);
        system.debug('New Values Map: '+Trigger.NewMap);
        Map<Id,Account> oldMap=Trigger.OldMap;
        Map<Id,Account> newMap=Trigger.NewMap;
    }
//ID will be same after-before trigger.
}