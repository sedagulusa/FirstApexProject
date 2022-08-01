//When account is created with Industry as Banking;
//Create a contact with Contact LastName as Account Name.
trigger AccountTrigger2 on Account (after insert) {
   /* If(Trigger.isInsert && Trigger.isAfter){
        AccountTrigger2Handler.createContact1(Trigger.New);
    }*/
    //Create the number of contacts which are equal to the number entered in no.of Contacts field on the Account
    If(Trigger.isAfter && Trigger.isInsert)
       {
           AccountTrigger2Handler.createContact2(Trigger.New) ;
        }
}