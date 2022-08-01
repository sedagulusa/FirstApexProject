public class DmlDemoPreWork1 {
    public static Id createAccount() {
        Account acc=new Account();
        acc.Name='Supreme';
        insert acc;
        return acc.Id;
    }
    public static void createContact() {
Contact cnt=new Contact();
cnt.LastName='Daily';
cnt.AccountId=createAccount();
insert cnt;//Insert 
    }
   public static void updateOneOrphanContact (){
    Account acc=[Select Id From Account WHERE Name='Supreme' LIMIT 1];
    Contact c=[Select Id From Contact Where AccountId = NULL LIMIT 1];

    system.debug('c= '+c);
    c.AccountId=acc.Id;
    update c;
   }
}