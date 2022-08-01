public with sharing class UpdateLeadStatusQueueable implements Queueable{

    public list<Lead> leadList=new List<Lead>();
    public UpdateLeadStatusQueueable(List<Lead> inputLeadList) {//use constructor
       this.leadList=inputLeadList;
    }
  //Scenario :
  //Update all the Leads with 'Working - Contacted' status to 'Closed - Converted'
  //Execute
  public void execute(QueueableContext qc){
    if(!leadList.isEmpty()){

        for(Lead ld:leadList){
            if(ld.Status =='Working - Contacted'){
                ld.Status='Closed - Converted';
            }
        }
        update leadList;
        
    }
  }
}
//when the instance of a class is created constructor runs