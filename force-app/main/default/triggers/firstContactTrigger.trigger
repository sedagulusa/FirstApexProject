trigger firstContactTrigger on Contact (before insert,before update,after insert,after update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            system.debug('I am in Before Insert trigger.');
            //before When you create a contact it will get triggered.
        }
        if(Trigger.isUpdate){
            system.debug('I am in Before Update trigger.');
            //before When you update a contact record it will get triggered.
        }
    }
     if(Trigger.isAfter){
        if(Trigger.isInsert){
            system.debug('I am in After Insert trigger.');
            //after When you create a contact it will get triggered.
        }
        if(Trigger.isUpdate){
            system.debug('I am in After Update trigger.');
            //after When you update a contact record it will get triggered.
        }
    }
}