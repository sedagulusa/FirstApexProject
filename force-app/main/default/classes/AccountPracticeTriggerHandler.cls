public class AccountPracticeTriggerHandler {
    
    public static void fillShippingDetails(List<Account> accList){
    
        for(Account acc:accList){
            if(acc.ShippingStreet == null){
                acc.ShippingStreet=acc.BillingStreet;
            }
            if(acc.ShippingCity == null){
                acc.ShippingCity=acc.BillingCity;
            }
            if(acc.ShippingState == null){
                acc.ShippingState=acc.BillingState;
            }
            if(acc.ShippingCountry == null){
                acc.ShippingCountry=acc.BillingCountry;
            }
            if(acc.ShippingPostalCode == null){
                acc.ShippingPostalCode=acc.BillingPostalCode;
            }
        } 
    }
    public static void matchMailingwithContacts(List<Account> accTriNew, Map<ID,Account> accOldMAp){
        //SOQL-To fetch the existing contacts
        List<account> accToUpdate=new List<Account>();
        for (Account acc:accTriNew){
            if(acc.BillingStreet != accOldMAp.get(acc.id).BillingStreet){
                accToUpdate.add(acc);
            }
        }
        List<Account> accWithContactList=[Select Id,Name,BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry, (select ID,Name from Contacts) from Account where ID IN:accToUpdate];
        List<Contact> conToUpdate=new List<Contact>();
        for(Account acc:accWithContactList){
            for(Contact con:acc.Contacts){
                con.MailingStreet=acc.BillingStreet;
                con.MailingCity=acc.BillingCity;
                con.MailingState=acc.BillingState;
                con.MailingPostalCode=acc.BillingPostalCode;
                con.MailingCountry=acc.BillingCountry;
                
            }
        }
        if(!conToUpdate.isEmpty()){
            update conToUpdate;
        }
    }
    //Scenario5
    public static void updateAccDescription(List<Account> accTriNew, Map<ID,Account> accOldMap,Boolean directFlag){       
        
        for(Account acc : accTriNew){
            //Update Operation
            if(!directFlag){
                if((acc.Active__c  != accOldMap.get(acc.id).Active__c && acc.Active__c == 'Yes')){
                    acc.Description = 'Account is Active';
                }
            }
            //Insert Operation
            if(directFlag && acc.Active__c == 'Yes'){
                acc.Description = 'Account is Active';                
            }
            
            
        }
   } 
    public static void contactVIPUpdate(List<Account> accTriNew, Map<ID,Account> accNewMap,Map<ID,Account> accOldMap)//Practice
    {
        Set<ID> accVIPChanged=new Set<ID>();
        for(Account acc:accTriNew){
            if(acc.VIP__c != accOldMap.get(acc.id).VIP__c){
               accVIPChanged.add(acc.id); 
            }
        }
        List<Contact> conList=[Select ID,Name,Account.Id,VIP__c from Contact where Account.Id IN:accVIPChanged];
        for (Contact con:conList){
            con.VIP__c=accNewMap.get(con.Account.Id).VIP__c;
        }
        update conList;
    }
    public static void addErrorOnDelete(List<Account> accTriOld){
        for(Account acc :accTriOld ){
            if(acc.Active__c =='Yes'){
                acc.addError('You cannot delete active Account.');
            }
        }
    } 
    public static void sendEmailOnDelete(List<Account> accTriOld){
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        for(Account acc : accTriOld){
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Account Delete Confirmation');
            emailMsg.setPlainTextBody('Account Name : ' +acc.Name+  ' is Deleted');
            emailMsgs.add(emailMsg);            
        }
        Messaging.sendEmail(emailMsgs);       
    }
    public static void sendEmailOnUndelete(List<Account> accTriNew){
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        List<Account> accList = new List<Account>();
        
        for(Account acc : [Select ID,Name from Account where ID IN:accTriNew]){
            //Mark it Active
            acc.Active__c = 'Yes'; 
            accList.add(acc);
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());            
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Account Restore Confirmation');
            emailMsg.setPlainTextBody('Account Name : ' +acc.Name+  'is Active now');
            emailMsgs.add(emailMsg);
        }
        if(!accList.isEmpty()){
            update accList;
        }
        Messaging.sendEmail(emailMsgs);         
    }
   
    }