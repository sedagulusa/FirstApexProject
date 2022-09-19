public with sharing class CovidCallout {
    public static HttpResponse covidInfo(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        HttpResponse response=new HttpResponse();

        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');

        response=http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        if(response.getStatusCode()==200){
            String jsonResponse=response.getBody();
            List<CovidCalloutWrapper> result=(List<CovidCalloutWrapper>)JSON.deserialize(jsonResponse,List<CovidCalloutWrapper>.class );
        for(CovidCalloutWrapper eachresult:result){
            system.debug(eachresult);
        }
        }
        return response;
    }
}
