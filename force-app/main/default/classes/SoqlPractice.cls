public class SoqlPractice{
    public static void accountSOQL_1(){
        List<Account> accList=[Select ID,Name from Account WHERE Name like '%United%'];
        system.debug('account list= '+accList);
        Account acc=[Select id,Name from Account ORDER BY CreatedDate desc LIMIT 1];
        system.debug('Latest account created is:'+acc);
    }
    public static void accountSOQL_2(){
        Account acc=[Select Id,Name,Phone,AccountNumber from Account ORDER BY createdDate desc LIMIT 1];
        System.debug('latest account created is '+acc);
        String accName=acc.Name;
        String accPhone=acc.Phone;
        system.debug('accName = '+accName+' ,phone is  '+accPhone);
        system.debug('account number is '+acc.AccountNumber);
    }
    public static void accountSOQL_3(){
        List<Account> listAcc=[Select Id,Name,Phone,AccountNumber from Account Order by CreatedDate desc];
        system.debug('all accounts '+listAcc);
        for(Account eachAccount:listAcc) {
            String accName=eachAccount.Name;
            String accPhone=eachAccount.Phone;
            system.debug('accName ='+accName+ ' ,the phone is '+accPhone);
            System.debug('account number is '+eachAccount.AccountNumber);
    
        }
    }
    public static void accountSOQL_Filter(){
        String accNameFilter='University of Arizona';
        List<Account> listAcc=[Select ID,name from Account where name=:accNameFilter];
        system.debug(listAcc);
    }
     public static void ticketToProject(){
        List<Salesforce_Ticket__c> mylist= [Select Name, Priority__c From Salesforce_Ticket__c];
        system.debug(mylist);
     }
     //Account-Contact MDR Parent to Child(inner query)-nested loop
     public static void accountToContacts(){
        List<Account> accWithContacList=[Select Name, (Select Name,Phone From Contacts)
        from Account];
        for(Account acc:accWithContacList){
            system.debug('XX ACCOUNT NAME XX : '+acc.Name);
            for(Contact con:acc.Contacts){
                system.debug('Contact Name: '+con.Name);
                system.debug('Contact Phone: '+con.Phone);
            }
        }

     }
     public static void projectToTickets(){
    List<Salesforce_Project__c> projectWithTickets=[SELECT Project_Name__c, Status__c, 
    (SELECT Name, Priority__c FROM Salesforce_Tickets__r)//__r for child
 FROM Salesforce_Project__c];
 for(Salesforce_Project__c proj:projectWithTickets){
    system.debug('XXProject Name:XX '+proj.Project_Name__c);
    system.debug('XXProject Status:XX '+proj.Status__c);
    for(Salesforce_Ticket__c ticket:proj.Salesforce_Tickets__r){
        system.debug('Ticket Name: '+ticket.Name);
        system.debug('Ticket Priority: '+ticket.Priority__c);
    }
 }
     }
     //returns list of child info-Child to Parent (use__r for parent)
     public static void childToParent_Soql1(){
        List<Contact> listCnt=[SELECT ID,Name,Account.Name,Account.Industry From Contact Where Account.Industry='Energy'];
        for(Contact eachContact:listCnt){
            system.debug(' Contact Name is '+eachContact.Name+ ' Its acc is '+eachContact.Account.Name+' Its industry is '+eachContact.Account.Industry);
        }

     }
     //ParenttoChild-Account to Opportunities
     public static void sampleSoql4(){
        List<Account> accountWithOppList=[Select Name, AnnualRevenue,(Select Name, Amount from Opportunities Where StageName='Closed Won')
        from Account Where Type='Customer - Direct'];
        for(Account eachAccount:accountWithOppList){
            system.debug('Account Name: '+eachAccount.Name + ' Anual Revenue: '+eachAccount.AnnualRevenue);
            for(Opportunity eachOpp:eachAccount.Opportunities){
                system.debug(' Name of the opportunity is '+eachOpp.Name+ ' , Amount of the opportunity is '+eachOpp.Amount);
            }
        }
     } 
//soql from account to opportunity
// public static void accToOpp(){
//     List<Account> accToOppList=[Select Name,(Select CloseDate from Opportunities where CloseDate >Today) from Account];
//     for(Account acc:accToOppList){
//         system.debug('Account Name: '+acc.Name);
//         for(Opportunity opp:acc.Opportunities){
//             system.debug('CloseDate: '+opp.CloseDate);
//         }
//     }
// }
public static void SOSLDemo(){
    List<List<SObject>> searchList=[Find 'Joe' in Name Fields Returning Contact(Name,Phone,Email),Lead(Name,Phone,Email)];
    List<Contact> leadList=(List<Contact>)searchList[0];
    List<Lead> contList=(List<Lead>)searchList[1];
    system.debug('Contact list: '+contList);
    system.debug('Lead list: '+leadList);
}
public static List<Opportunity> findOpportunities(String leadsrc,String stgname){
    List<Opportunity> myOpp=[Select Name From Opportunity Where LeadSource =:leadsrc and StageName =:stgname];
    return myOpp;
}
public static void myQuery(){
    List<Account> acc=[SELECT Name, AnnualRevenue FROM Account Where Type='Customer - Direct'];
    for(Account abc:acc){
        system.debug(abc);
    }
    system.debug('====================================');
    List<Opportunity> opp=[Select Name,Amount From Opportunity where StageName='Closed Won'];
    for(Opportunity abc:opp){
        system.debug(abc);
    }

    
}




    } 
        
   /*
   system.debug(SoqlPractice.findOpportunities('Web','Closed Lost'));

List<Opportunity> ll=SoqlPractice.findOpportunities('Web','Closed Lost');
system.debug(ll);
*/