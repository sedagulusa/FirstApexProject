public class AccountSumOfAmountOppsBatch implements Database.Batchable<sObject>,Database.stateful{
    //stateful is for storing variables
    public Decimal overallSumOpps=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        String querystring='Select Id,Total_Amount_of_All_the_Opportunities__c from Account';
        return Database.getQueryLocator(querystring);
    }
    public void execute(Database.BatchableContext bc,List<Account> records){
        for(Account acc:records){
            if(acc.Total_Amount_of_All_the_Opportunities__c !=NULL)
           overallSumOpps =overallSumOpps+acc.Total_Amount_of_All_the_Opportunities__c;
        }
    }
    public void finish(Database.BatchableContext bc){
        system.debug('OverallsumOpp '+overallSumOpps);
        AsyncApexJob asyncJob = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems
                                 FROM AsyncApexJob WHERE Id =:BC.getJobId()];
        
       
         List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());   
            emailAddress.add('sedagulusa@gmail.com') ;        
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Account Calculation Status -'+asyncJob.Status);
            String body='Sum of Ammount of all opportunities : '+overallSumOpps;

            emailMsg.setPlainTextBody(body);
            emailMsgs.add(emailMsg);
            Messaging.sendEmail(emailMsgs);      
    }
}