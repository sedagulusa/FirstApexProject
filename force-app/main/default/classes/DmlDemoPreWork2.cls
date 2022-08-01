public class DmlDemoPreWork2 {
    //bulkification
    public static void createMultipleAccConts(integer count) {
        if(count<=0){
            return;
        }
list<account> listAcc=new list<Account>();
for(Integer i=0;i<count;i++){
    Account acc=new Account();
    acc.Name='SpaceZ';
    acc.Active__c='Yes';
    listAcc.add(acc);

}
if(!listAcc.isEmpty()){
    insert listAcc;
}
List<Contact> listCnt=new List<Contact>();
for(Account acc:listAcc){
    Id accid=acc.Id;
    for(Integer i=0;i<count;i++){
        Contact c=new Contact();
        c.LastName='Sumahoro';
        c.AccountId=accid;
        listCnt.add(c);
    }
}
if(!listCnt.isEmpty()){
    insert listCnt;
      }
    }
    
}