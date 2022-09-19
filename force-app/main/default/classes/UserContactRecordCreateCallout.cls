public with sharing class UserContactRecordCreateCallout {
    /*
    1.Hit the Endpoint or API and get the response
    2.Break the JSON response to readable format
    3.Create Contact records with the data received
     */

     public static void getUsers(){
      Http http=new Http();
      HttpRequest request=new HttpRequest();
      HttpResponse response=new HttpResponse();
      //GET(sENDING THE REQUEST)
      request.setEndpoint('https://mockyard.herokuapp.com/users/5');
      request.setMethod('GET');
      //Response
      response=http.send(request);
      if(response.getStatusCode()==200){
        String jsonResponseUsers=response.getBody();
        List<UserContactRecordCreateCalloutWrapper> resultUsers=(List<UserContactRecordCreateCalloutWrapper>) JSON.deserialize(jsonResponseUsers, List<UserContactRecordCreateCalloutWrapper>.class);
        for(UserContactRecordCreateCalloutWrapper result:resultUsers){
            system.debug('Each Value : '+result.id+' '+result.name+' '+result.age+' '+result.city+' '+result.country+' '+result.email+' '+result.gender+' '+result.image+' '+result.phone);
        }
      createContacts(resultUsers);
      }
     }
     public static void createContacts(List<UserContactRecordCreateCalloutWrapper> resultUsers){
      List<Contact> conList=new List<Contact>();
      for(UserContactRecordCreateCalloutWrapper result:resultUsers){
        Contact con=new Contact();
        List<String> names=result.name.split(' ');
        con.FirstName=names.get(0);
        con.LastName=names.get(1);
        con.email=result.email;
        con.gender__c=result.gender;
        con.image__c=result.image;
        con.Phone=result.phone;
        con.MailingCountry=result.country;
        con.MailingCity=result.city;
        con.age__c=result.age;
        con.Description='This is from External API';
        conList.add(con);


      }
      if(!conList.isEmpty()){
        insert conList;
      }
     }
}
