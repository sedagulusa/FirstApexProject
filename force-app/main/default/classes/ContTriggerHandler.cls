public class ContTriggerHandler {
        //2a
        public static void errorValidtn1(List<Contact> cntList){
            for(Contact cnt:cntList){
                if(cnt.LeadSource == 'Partner Referral'){
                    cnt.LeadSource.addError('Can not insert/update with Partner Referral!');//Throw error
                }
            }
            
        }
        //2b
        public static void errorValidtn2(List<Contact> cntList , Map<Id,Contact> cntOldMap){
            for(Contact cnt:cntList){//new and old comparision
                if(cnt.LeadSource != cntOldMap.get(cnt.Id).LeadSource){//get(key)=>value
                    cnt.addError('Can not update Lead source!');
            }
        }
        }
        //Assignment 2
        public static void contactPhoneSet(List<Contact> cntList) {        
          Set<Id> accIds = new Set<Id>();       
          for(Contact con :cntList){
               if(con.AccountId !=Null){
                    accIds.add(con.AccountId);
               }
          }
         List<Account> accList=[Select Id,Phone From Account where id In:accIds];
              Map<Id,Account> accMap = new Map<Id,Account>();
              for(Account acc:accList){
              accMap.put(acc.Id,acc);
            }
         
              for(Contact con : cntList){
                   if(accMap.containskey(con.AccountId)){
                    con.OtherPhone = accMap.get(con.AccountId).Phone;
                          }
                   }

      }          
}