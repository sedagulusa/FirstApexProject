public class DmlPracticeCw {
    public static void dml1() {
        Account acc=new Account();
        acc.Name='Apex Test';
        acc.Rating='Cold';
        acc.AccountSource='Web';
        insert acc;
        acc.Type='Prospect';
        update acc;
    }
    public static void dmlCustom(){
        Salesforce_Project__c prj=new Salesforce_Project__c();
        prj.Project_Name__c='New Test Project';
        insert prj;
        prj.Status__c='Completed';
        prj.Description__c='This is description.';
        update prj;

    }
    public static void dmlSOQL(){
        Salesforce_Project__c proj=[Select Status__c,Project_Name__c from Salesforce_Project__c where Project_Name__c='New Test Project' Limit 1];
        proj.Status__c='In-progress';
        update proj;
    }
    public static void dmlContWithAcc(){
        Account acc=new Account();
        acc.Name='Techno-New';
        insert acc;

        Contact cnt=new Contact();
        cnt.LastName='Zahuri';
        cnt.FirstName='Zahide';
        cnt.AccountId=acc.Id;
        insert cnt;
    }
    public static void dmlProWithTic(){
        Salesforce_Project__c proj=[Select Status__c,Project_Name__c from Salesforce_Project__c where Project_Name__c='MVPB' Limit 1];
        Salesforce_Ticket__c ticket=new Salesforce_Ticket__c();
        ticket.Subject__c='Ticket from Apex';
        ticket.Status__c='In development';
        ticket.Salesforce_Project__c=proj.Id;
        insert ticket;
    }
    public static void dmlMoreAcc(){
       List<Account> accList=new List<Account>();
       Account acc1=new Account();
       acc1.Name='TestAccount1';
       accList.add(acc1);
       Account acc2=new Account();
       acc2.Name='TestAccount2';
       accList.add(acc2);
       Account acc3=new Account();
       acc3.Name='TestAccount3';
       accList.add(acc3);

       insert accList;
    }
    public static void dmlWithAccForLoop(){
        list<Account> accList=new List<Account>();
        for(Integer i=0;i<100;i++){
            Account acc=new Account();
            acc.Name='ApexAccount'+i;
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            insert accList;
        }

    }
    public static void dmlDelete(){
        List<Account> accListToDelete=[Select Name from Account Where Name Like 'Apex%'];
        Delete accListToDelete;
    }
    public static void dmlUpdateForLoopProject(){
        List<Salesforce_Project__c> prjList=[Select Name from Salesforce_Project__c];
        for(Salesforce_Project__c pro:prjList){
        pro.Description__c='This is the description';
        }
        if (!prjList.isEmpty()){
            update prjList;
        }
    }
    public static void topTenOppDescriptionUpdate(){
        List<Opportunity> oppList=[SELECT Id,name from Opportunity Limit 10];
        for(Opportunity opp:oppList){
            opp.Description='This is the one of the top 10 opportunity.Please work on this as priority.';
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
    }
    public static void CreateContactsforACcount(){
        Account acc=[Select Name,Id from Account Where Name='SpaceZ' Limit 1];
        List<Contact> listContact=new List<Contact>();
        for(Integer i=1;i<11;i++){
            Contact cnt=new Contact();
        cnt.LastName=acc.Name;
        cnt.FirstName='Star'+i;
        cnt.AccountId=acc.Id;
        listContact.add(cnt) ;
    }
    if(!listContact.isEmpty())
        insert listContact;
    }
    public void createNewTaskForCase(){
        List<Case> caseList = [Select Status from Case where Status = 'New'];
        List<Task> taskList = new List<Task>();
        for(Case cs : caseList){
            Task tsk =  new Task();
            tsk.Subject = 'Call';
            tsk.Priority = 'Normal';
            tsk.Status = 'Not Started';
            tsk.WhatId = cs.id;
            tsk.ActivityDate = Date.today() + 3;
            taskList.add(tsk);            
        } 
        if(!taskList.isEmpty()){
            insert taskList;
        }
      }
    public static void upsertDemo(){
        List<Salesforce_Project__c> prjList=new List<Salesforce_Project__c>();
        Salesforce_Project__c prj=new Salesforce_Project__c();
        prj.Project_Name__c='upsertTesting';
        prjList.add(prj);
        Salesforce_Project__c prjUpdate=[Select Name From Salesforce_Project__c Limit 1];
        prjUpdate.Project_Name__c='UpsertTestingUpdate';
        prjList.add(prjUpdate);
        
        upsert prjList;
    }
    
    
    
    
    
    
    
    
}