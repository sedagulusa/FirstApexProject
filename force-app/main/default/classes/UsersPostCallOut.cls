public with sharing class UsersPostCallOut {
    public static void createUsersPOST(){
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            //Request
            request.setEndpoint('https://gorest.co.in/public/v2/users');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept', 'application/json');
            String token = '7e70afbfb47f1e976b492c0fc5442daa4953eb1d74b632549fdb4abbb937497d';
            request.setHeader('Authorization', 'Bearer '+token);
            //(Integer id1,String name1,String email1,String gender1,String status1)
            UsersPostWrapper wrapper1 = new UsersPostWrapper(1,'XYZ','testxyz@gmail.com','Male','active');
            String jsonString = JSON.serialize(wrapper1);
            system.debug('request JSON: '+jsonString);
            request.setBody(jsonString);
            response = http.send(request);
            system.debug('Response Code : '+response.getStatusCode());
        }
}
