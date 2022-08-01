public class AccRecursiveTriggerHandler {
    
    public static Boolean isTriggerFirstRun=False;
    public static void recursivePractice(List<Account> accTriNew){
        isTriggerFirstRun=True;
        List<Account> accList = new List<Account>();
        for(Account acc : accTriNew){
            Account accDup = new Account();
            accDup.Name = 'Recursive Duplicate';
            accList.add(accDup);
        }
        if(!accList.isEmpty())
            insert accList;
    }
}