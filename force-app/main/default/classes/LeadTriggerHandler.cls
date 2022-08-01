public class LeadTriggerHandler { 
    public static void checkClosedLostReason(List<Lead> listTriNew,List<Lead> listTriOld,Map<Id,lead> mapTriNew,Map<Id,lead> mapTriOld ){
        for(Lead l:listTriNew){
            //if it is INSERT and status is closed lost
            //and reason is empty
            //then validate--.addError()
            ////if it is UPDATE and status is changed and status is closed lost 
            //and reason is empty
            //then validate--.addError()
            if((listTriOld==null)||(listTriOld !=null && l.Status !=mapTriOld.get(l.id).Status)){
              //if insert old is null||if update old is not null and status new and old are different
              //then throw error
                if(l.Status=='Closed - Not Converted' && l.Closed_Lost_Reason__c==null){
                    l.Closed_Lost_Reason__c.addError('Reason is necessary');
                }
            }
            
        }
    }
}