public with sharing class createTasksForOppsBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        //to handle standard field for test class
        String queryString='';
        if(Test.isRunningTest()){
            queryString='Select id,StageName,LastModifiedDate,CloseDate,OwnerId from Opportunity where StageName !=\'Closed Lost\' and StageName !=\'Closed Won\'';
        }else {
            queryString= 'Select ID,StageName,LastModifiedDate,CloseDate,OwnerId from Opportunity where (StageName != \'Closed Lost\' AND StageName != \'Closed Won\') AND LastModifiedDate < LAST_N_DAYS:7';
        }
    return Database.getQueryLocator([Select id,StageName,LastModifiedDate,CloseDate,OwnerId from Opportunity where (StageName !='Closed Lost' and StageName !='Closed Won') and LastModifiedDate<Last_N_Days:7]);
    }
    public void execute (Database.BatchableContext bc,List<sObject> records){
        List<Opportunity> oppList=(List<Opportunity>) records;
        List<task> taskList=new List<Task>();
        for(Opportunity opp:oppList){
            Task tsk=new Task();
            tsk.Subject='Other';
            if(opp.CloseDate < system.today()){
                tsk.ActivityDate=System.today();
            }else{
                tsk.ActivityDate=opp.CloseDate+2;
            }
            tsk.Description='Reminder – Please act on the Opportunity';
            tsk.WhatId=opp.Id;
            tsk.OwnerId=opp.OwnerId;
            tsk.Status='In Progress';
            taskList.add(tsk);
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
        public void finish(Database.BatchableContext bc){
        system.debug('Finished');
        }
    }

