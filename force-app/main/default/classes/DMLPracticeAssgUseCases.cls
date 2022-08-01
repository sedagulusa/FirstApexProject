public class DMLPracticeAssgUseCases {//Madhu's answers
    //usecase 1
    public List<Account> getAccounts(){
        List<Account> accList=[Select ID,Name,Type From Account Where Type !=NULL];
        return accList;
    }
    //usecase 2
    public void populateAllowanceStatus(List<Allowance__c> allowances){
        List<Allowance__c> allowanceToUpdate=new List<Allowance__c>();
        for(Allowance__c alw:allowances){
            if(alw.Status__c == Null){
                alw.Status__c='Submitted';
                allowanceToUpdate.add(alw);
            }
        }
        if(!allowanceToUpdate.isEmpty()){
            update allowanceToUpdate;
            system.debug('Allowances '+allowanceToUpdate);
        }
    }
    //usecase 3
    public void updateAccountNumbers(Map<ID,Account> records){
        List <Account> accsToUpdate=new List<Account>();
        for(Account acc:records.values()){
            if(acc.AccountNumber ==Null){
                acc.AccountNumber='ABC123456';
                accsToUpdate.add(acc);
            }
        }
        if(!accsToUpdate.isEmpty()){
            update accsToUpdate;
        }
    }
    //usecase 4,parent to child(acc to con),inner query is a list so we can get the size of it.
    public void numberOfConts(){
        List<Account> accWithConts=[Select ID,Name,Number_of_Contacs__c,(Select Id,Name,Email from Contacts Where Email != Null) From Account];
        for(Account acc:accWithConts){
            acc.Number_of_Contacs__c=acc.Contacts.size();
        }
        update accWithConts;
    }
    //usecase 5,child to parent(case to acc)
    public void populateCasePriority(){
        List<Case> caseWithAcc=[Select Id,Priority,Account.CustomerPriority__c from Case where Account.CustomerPriority__c !=Null];
        for(Case cs:caseWithAcc){
            cs.Priority=cs.Account.CustomerPriority__c;
        }
        update caseWithAcc;
    }
}
/**/