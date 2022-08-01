public class SOQLPracticeDemo {
   public static void allContacts(){
    List<Contact> listCons=[Select Id,Name,Phone from Contact];
    system.debug(listCons);
   }
    public static void latestContact(){
        Contact con=[Select Name,Phone From Contact Order by CreatedDate desc Limit 1];
        String conName=con.Name;
        system.debug('Print contact' +con +' '+ conName+ ' '+con.Phone);
   }
   public static void printContactsinUpperCase(){
List<Contact> listConts=[Select Id,Name,Email from Contact Where Email !=NULL];
system.debug('The Size of the contact list is: '+listConts.size());
for(Contact cnt:listConts){
   system.debug('Contact name: '+cnt.Name.toUpperCase() + ' and the Email: '+cnt.Email.toLowerCase());
   system.debug('---------------------------------');
}
   }
   public static void contactWithFilter(String fname){
      list<Contact> filteredCont=[Select Name,id,Email,Phone from Contact Where Name =:fname Limit 1];
      system.debug(filteredCont);
   }
   //SELECT Id, Name, Type ,StageName,AccountId,Account.Phone,Account.Type FROM Opportunity Where StageName !='Closed Won' and StageName !='Closed Lost'
 public static void childToParentOpptoAcc(){
   List<Opportunity> listOpp=[SELECT Id, Name, Type ,StageName,AccountId,Account.Phone,Account.Type FROM Opportunity Where StageName !='Closed Won' and StageName !='Closed Lost'];
   system.debug(listOpp);
   for(Opportunity opp:listOpp){
      if(opp.AccountId !=null){
         system.debug(opp.Name+' '+opp.Type+' '+opp.Account.Phone);
      }    
   }
 }

}