@RestResource(urlMapping='/Opportunities/*')
global with sharing class OpportunityManager {
    @HttpGet
    global static Opportunity getOpp(){
        RestRequest request = RestContext.request;
        String requestURL = request.requestURI;
        String oppId=requestURL.substring(requestURL.lastIndexOf('/')+1);
        Opportunity opp=[Select Name,StageName,CloseDate from Opportunity where Id=:oppId];
        return opp;
    }
}
