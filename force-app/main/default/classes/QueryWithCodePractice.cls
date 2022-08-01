public class QueryWithCodePractice {
    public static void oppWithProducts(){
     //Parent to Child
     List<opportunity> oppList=[Select id,Name,StageName,Account.name,(SELECT Id, Name,Product2.Name, Quantity, TotalPrice, UnitPrice FROM OpportunityLineItems) from Opportunity];   
     Map<Id,Decimal> oppTotalPrice= new Map<Id,Decimal>();

     for (Opportunity opp : oppList) {
        system.debug(opp.Name);
        if(!opp.OpportunityLineItems.isEmpty()){
        List<OpportunityLineItem> oplineitem=opp.OpportunityLineItems;
        Decimal opTotalPrice=0;
        for(OpportunityLineItem pl:oplineitem){
            system.debug(pl.Product2.Name);
            opTotalPrice +=pl.TotalPrice;
        }
        oppTotalPrice.put(opp.Id,opTotalPrice);
        }
     }
    system.debug('map of opp id with products total price '+oppTotalPrice);
    }
}