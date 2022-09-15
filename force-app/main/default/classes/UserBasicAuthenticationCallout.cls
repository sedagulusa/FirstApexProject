public with sharing class UserBasicAuthenticationCallout {//remote site approval from setup-org
    public static void getUsersauthenticate(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        HttpResponse response=new HttpResponse();

        request.setEndpoint('https://socalledrest.herokuapp.com/mock/users');
        request.setMethod('GET');
        //this part will be handled from org-named credentials
        String username='carbon';
        String password='hydrogen';
        Blob headerValue=Blob.valueOf(username+':'+password);
        String AuthorizationHeader = 'BASIC '+ EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', AuthorizationHeader);

        response=http.send(request);
        if(response.getStatusCode()==200){
            String jsonString=response.getBody();
            List<UserBasicAuthenticationWrapper> responseList = (List<UserBasicAuthenticationWrapper>) JSON.deserialize(jsonString, List<UserBasicAuthenticationWrapper>.class);
            for(UserBasicAuthenticationWrapper result : responseList){
            system.debug('Each Value : '+result.id+' '+result.email+' '+result.name+' '+result.username);
        }
        }
    }
    public static void getUsersNamedCredential(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        HttpResponse response=new HttpResponse();

        request.setEndpoint('callout:BasicAuthenticationUser');
        request.setMethod('GET');

        response=http.send(request);
        if(response.getStatusCode()==200){
            String jsonString=response.getBody();
            List<UserBasicAuthenticationWrapper> responseList = (List<UserBasicAuthenticationWrapper>) JSON.deserialize(jsonString, List<UserBasicAuthenticationWrapper>.class);
            for(UserBasicAuthenticationWrapper result : responseList){
            system.debug('Each Value : '+result.id+' '+result.email+' '+result.name+' '+result.username);
        }
        }
    }
}