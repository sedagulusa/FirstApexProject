@isTest
public with sharing class FirstBatchClassSchedulerTest {
    @isTest
    public static void testMethod1(){
    List<Salesforce_Project__c> projList=TestDataFactory.createProjects(100);
    test.startTest();
    FirstBatchClassScheduler schProj=new FirstBatchClassScheduler();
    String cron='0 30 22 * * ? *';//10.30 pm
    system.schedule('SFprojectBatchScheduler', cron,schProj); 
    test.stopTest();
     //Validation
     List<AsyncApexJob> jobsScheduled = [select Id, ApexClass.Name, Status, JobType from AsyncApexJob where JobType = 'ScheduledApex'];
     system.assert(jobsScheduled.size() == 1);
     system.assertEquals('FirstBatchClassScheduler', jobsScheduled.get(0).ApexClass.Name);


}
}
