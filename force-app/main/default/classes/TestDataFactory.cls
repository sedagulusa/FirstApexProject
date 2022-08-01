@isTest
public class TestDataFactory {    
    //Creating Projects
    public static List<Salesforce_Project__c> createProjects(Integer countProj){
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>();        
        for(Integer i=0;i<countProj;i++){
            Salesforce_Project__c proj = new Salesforce_Project__c();
            proj.Project_Name__c = 'Test'+i;
            proj.Description__c = 'Sample';
            proj.Status__c = 'New';
            projList.add(proj);            
        }
        insert projList;
        return projList;
    }
    
    //create projects with tickets
    public static List<Salesforce_Project__c> createProjTckts(Integer countProj, Integer countTckts){
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>(); 
        Integer i,j;
        for(i=0;i<countProj;i++){
            Salesforce_Project__c proj = new Salesforce_Project__c();
            proj.Project_Name__c = 'Test'+i;
            proj.Description__c = 'Sample';
            proj.Status__c = 'New';
            projList.add(proj);            
        }
        insert projList;
        
        
        List<Salesforce_Ticket__c> tickList = new List<Salesforce_Ticket__c>();        
        for (j=0; j<countProj; j++) {
            // For each : Salesforce Project just inserted, add Salesforce Tickets
            for (Integer k=1; k<=countTckts; k++) {
                Salesforce_Ticket__c tick = new Salesforce_Ticket__c();
                tick.Salesforce_Project__c = projList.get(j).id;
                tick.Subject__c = 'Subject ' + k;
                tick.Status__c = 'New';
                tick.Priority__c = 'Medium';
                tickList.add(tick);
                system.debug('Before'+tick.Status__c);
            }
        }    
        insert tickList;        
        return projList;
        
        
    }
    public static List<Lead> createLead(Integer countLead){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0;i<countLead;i++){
            Lead ld = new Lead();
            ld.LastName = 'LeadQueue'+i;
            ld.Company = 'ABC';
            ld.Status = 'Working - Contacted';
            leadList.add(ld);
        }
        if(!leadList.isEmpty()){
            insert leadList;
        }
        return leadList;
    }
    public static List<Opportunity> createOpp(Integer countOpp){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=0;i<countOpp;i++){
            Opportunity opp=new Opportunity();
            opp.Name='Test Batch '+i;
            opp.CloseDate=system.today()+10;
            opp.StageName='Prospecting';
            opp.OwnerId=UserInfo.getUserId();
            //opp.LastModifiedDate=System.today()+10;
        }
        insert oppList;
        return oppList;
    }
}