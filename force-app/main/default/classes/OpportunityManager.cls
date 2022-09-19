@RestResource(urlMapping='/Opportunities/*')
global with sharing class OpportunityManager {
//error msg
    global class MyException extends Exception {
        
    }
    @HttpGet
    global static Opportunity getOpp(){
        RestRequest request = RestContext.request;
        String requestURL = request.requestURI;
        String oppId=requestURL.substring(requestURL.lastIndexOf('/')+1);
       List<Opportunity> oppList=[Select Name,StageName,CloseDate from Opportunity where Id=:oppId];
        if(!oppList.isEmpty()){
            return oppList[0];
        }else{
            throw new MyException('This opportunity is not found!');
        }
       
    }
    @HttpPost
    global static Id createOpp(String name1, String stageName1, Date CloseDate1){

        if((name1==''||name1==NULL)||
        (stageName1==''||stageName1==NULL)||
        (CloseDate1==NULL)){
          throw new MyException('Mandatory field is missing!');
        }else{
        Opportunity opp=new Opportunity();
        opp.Name=name1;
        opp.StageName=stageName1;
        opp.CloseDate=closeDate1;
       // Date.valueOf(CloseDate1);
       //"2012-04-29" it accepts this format
       insert opp;
       return opp.Id;
        }     
}
@HttpPatch
global static Opportunity updateOpp() {
    RestRequest request = RestContext.request;
    String requestURL = request.requestURI;
    String oppId=requestURL.substring(requestURL.lastIndexOf('/')+1);
    Opportunity opp=[Select Id,name,StageName,CloseDate,ExpectedRevenue from Opportunity where Id=:oppId];
    String jsonString=request.requestBody.toString();
    //Deserialize
    Map<String, Object> oppParams = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
    for(String fieldName:oppParams.keySet()){
        opp.put(fieldName,oppParams.get(fieldName));
    }
    update opp;
    return opp;
}
}