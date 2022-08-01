public with sharing class updateHighestAmountOppNameQueueable implements Queueable{
    public List<Account> accList=new List<Account>();
    //Account list will have accounts and related opps
    // to find the opp name with highest amount
    public updateHighestAmountOppNameQueueable(List<Account> accList) {
    this.accList=accList;
    }
    public static void execute(QueueableContext qc){
       for(Account acc:accList){
        Decimal maxAmount=0;
        String maxOppName='';
        for(Opportunity opp:acc.Opportunities){
           if(opp.StageName=='Closed Won'&& opp.Amount !=Null && opp.Amount > maxAmount){
            maxAmount=opp.Amount;
            maxOppName=opp.Name;
           }
        }
        acc.Highest_Amount_Opportunity_Name__c=maxOppName;
       }
       update accList;
    }
}
