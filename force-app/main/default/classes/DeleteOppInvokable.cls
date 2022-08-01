public with sharing class DeleteOppInvokable {
    @InvocableMethod
    public static void deleteOpps(List<Id> accIds){
        //Use Case – Delete related Closed Lost Opportunities on the Account
        List<Opportunity> oppList = [Select ID,StageName, AccountId from Opportunity where AccountId IN:accIds AND StageName = 'Closed Lost'];
        if(!oppList.isEmpty()){
            Delete oppList;
        }
    }
}   

