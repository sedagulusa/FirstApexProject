@isTest
public class practiceDMLTest {
    @isTest
    //Data created in test class is a test data,it wont be store in org
    public static void createContactsTest(){       
        Account acc=new Account(Name='TestAcc');
        practiceDML demo=new practiceDML();
        insert acc;
        demo.createContacts(acc);
        List<Contact> conList=[Select ID,FirstName,LastName,AccountId From Contact];
        system.assert(!conList.isEmpty());
        system.assert(conList.size()>0);
        system.assertEquals(acc.id, conList.get(0).AccountId);
        system.assertEquals('TestAcc',conList.get(0).LastName);
        
    }
    @isTest
    public static void updateOppsTest(){
      //Create test data
     List <Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=10;i++){
            Opportunity opp=new Opportunity();
            //required fields
            opp.CloseDate=Date.today()+10;
            opp.Name='Opp'+i;
            opp.StageName='Prospecting';
            opp.Description='Test Desc';//should be updated
            oppList.add(opp);
        }
        insert oppList;
        practiceDML demo=new practiceDML();
        demo.updateOpps();
        List<Opportunity> oppListUpdate=[Select Description from Opportunity];
        system.assert(oppListUpdate.size() == 10);
        system.assertEquals('This is one of the top 10 opportunity. Please work on this as priority', oppListUpdate.get(0).Description);
        
        
}
    @isTest
    public static void createTaskforCaseTest(){
      Case cs=new Case();
        cs.Origin='Email';
        cs.Status='New';
        insert cs;
        practiceDML demo=new practiceDML();
        demo.createTaskforCase();
        List<Case> caseList=[Select Status,(Select Subject,Priority,Status,WhatId,ActivityDate from Tasks) from Case];
        
        system.assert(caseList.get(0).Tasks.size()==1);
        system.assertEquals(cs.Id,caseList.get(0).Tasks.get(0).WhatId);
    }
}