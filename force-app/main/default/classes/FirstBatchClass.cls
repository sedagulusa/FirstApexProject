//Update the description of salesforce project(this interface gives its own methods to implement)
public class FirstBatchClass implements Database.Batchable<sObject> ,database.stateful{
    
    //start 
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id,Description__c from Salesforce_Project__c]);
    }//50 M
    //Execute
    public void execute(Database.BatchableContext bc,List<Salesforce_Project__c> records){
        List<Salesforce_Project__c> projUpd=new List<Salesforce_Project__c>();
        for(Salesforce_Project__c sp:records){
            sp.Description__c=sp.Description__c+'..Updating from Batch';
            projUpd.add(sp);
        }
        if(!projUpd.isEmpty()){
            update projUpd;
        }   
    }
    //Finish
    public void finish(Database.BatchableContext bc){
        system.debug('I am done');
        
    }
}
//Database.executeBatch(new FirstBatchClass(),1); for execution