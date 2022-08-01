public class AccTriggerHandler {
    public static void shippingAdressPopulate(List<Account> accList){
            for(Account acc:accList){
                if(acc.ShippingCity ==null){
                    acc.ShippingCity=acc.BillingCity;
                }
                if(acc.ShippingState ==null){
                    acc.ShippingState=acc.BillingState;
                }
                if(acc.ShippingStreet ==null){
                    acc.ShippingStreet=acc.BillingStreet;
                }
                if(acc.ShippingCountry ==null){
                    acc.ShippingCountry=acc.BillingCountry;
                }
                if(acc.ShippingPostalCode ==null){
                    acc.ShippingPostalCode=acc.BillingPostalCode;
                
            }
        }
    }
    //Scenario 4
    public static void mailingUpdate(List<Account> accTriNew, Map<ID,Account> accOldMap){
       
        List<Account> accToUpdate=new List<Account>();
        for(Account acc : accTriNew){
            if(acc.BillingStreet != accOldMap.get(acc.ID).BillingStreet){//compare new and old
                accToUpdate.add(acc);
            }
        }
         //SOQL-contacts
         List<Account> accWithconList=[Select ID,Name,BillingStreet,BillingCity,BillingState,BillingCountry,BillingPostalCode,(select ID,Name from Contacts) From Account Where ID IN :accToUpdate];
         List<Contact> conToUpdateList=new List<Contact>();
         for(Account acc:accWithconList){
             for(Contact con:acc.Contacts){
                 con.MailingStreet=acc.BillingStreet;
                 con.MailingCity=acc.BillingCity;
                 con.MailingState=acc.BillingState;
                 con.MailingCountry=acc.BillingCountry;
                 con.MailingPostalCode=acc.BillingPostalCode;
                 conToUpdateList.add(con);
             }
        }
        if(!conToUpdateList.isEmpty()){
            update conToUpdateList;
        }
        
    }
    //Scenario 5 with the flag for repetitive codes.
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
    //Practice VIP
    public static void contactVIPUpdate(List<Account> accTriNew, Map<ID,Account> accNewMap,Map<ID,Account> accOldMap){
        Set<ID> accVIPChanged=new Set<Id>();
        for(account acc:accTriNew){
            if(acc.VIP__c != accOldMap.get(acc.Id).VIP__c){
                accVIPChanged.add(acc.Id);
            }  
        }
        List<Contact> conList=[Select ID,Name,Account.Id,VIP__c from Contact where Account.Id IN:accVIPChanged];
            for (Contact con:conList){
            con.VIP__c=accNewMap.get(con.Account.Id).VIP__c;
        }
        update conList;
    
    }
    
    
    //Assignment 1(Account - Opp)
   public static void updateOpps(List<Account> accTriNew){
       
        //SOQL - To fetch Contacts
        List<Account> accWithOppsList = [Select ID,Name,(Select ID,StageName from Opportunities where StageName!='Closed Won') 
                                         FROM Account where ID IN :accTriNew];
        List<Opportunity> oppToUpdate = new List<Opportunity>();
        for(Account acc : accWithOppsList){
            for(Opportunity opp : acc.Opportunities){
                opp.StageName = 'Closed Lost';
                oppToUpdate.add(opp);
            }
        }
        if(!oppToUpdate.isEmpty()){
            update oppToUpdate;
        }
        
    }
}