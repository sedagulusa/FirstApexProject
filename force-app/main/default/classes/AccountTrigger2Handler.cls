public class AccountTrigger2Handler {
    /*Public static void createContact1(List<Account> TriNew){
     List<Contact> cntList=new List<Contact>();
        for(Account acc:TriNew){
            if(acc.Industry == 'Banking'){
                Contact cnt=new Contact();
                cnt.AccountId=acc.Id;
                cnt.LastName=acc.Name;
                cntList.add(cnt);
            }
        }
        insert cntList;
    }*/
    Public static void createContact2(List<Account> TriNew){
       list<contact> listContact = new list<contact>();
       For(Account act :TriNew )   
       {
           if(act.Number_of_Contacs__c >0)
           {
               for(Integer i=1 ; i<=act.Number_of_Contacs__c;i++){
               Contact con = new Contact();
               con.AccountId = act.id;
               con.LastName = act.Name + i;
               listContact.add(con);
               }              
           }         
       }
           if(listContact.size()>0)
           {
               insert listContact;
           }        
     }  
}