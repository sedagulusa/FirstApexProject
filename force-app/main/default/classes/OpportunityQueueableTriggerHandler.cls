public with sharing class OpportunityQueueableTriggerHandler {
   //filter the accounts if they are available
   //SOQL-with chil(opps)
   //Call queable class-List<Acc>

    public static void afterInsertDeleteUndeleteOpp(List<Opportunity> oppList){
        Set <id> accIDS=new Set<Id>();
        for(Opportunity opp:oppList){
          if(opp.AccountId !=Null){
          accIDS.add(opp.AccountId);
        }
      }
      List<Account> accList=[Select id, name, Highest_Amount_Opportunity_Name__c, (Select Amount, Name,StageName from Opportunities Where StageName='Closed Won') From Account where id IN:accIDS];
      system.enqueueJob(new updateHighestAmountOppNameQueueable(accList));
    }
    public static void afterUpdate(Map<Id,Opportunity> oppNewMap, Map<Id,Opportunity> oppOldMap){
        Set <id> accIDS=new Set<Id>();
        for(Opportunity opp:oppNewMap.values()){
          if(opp.AccountId !=null && oppNewMap.get(opp.id).Amount !=oppOldMap.get(opp.id).Amount){
            accIDS.add(opp.AccountId);
  }
}
      List<Account> accList=[Select id, name, Highest_Amount_Opportunity_Name__c, (Select Amount, Name,StageName from Opportunities Where StageName='Closed Won') From Account where id IN:accIDS];
      system.enqueueJob(new updateHighestAmountOppNameQueueable(accList));
    }
}
