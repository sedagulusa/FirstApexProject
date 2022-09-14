public with sharing class AnimalsCallout {
    /*1.Open a connection
      2.Preparing the Request - Set the end point/Set the method
      3.Capturing the Response
     */
     public static HttpResponse fetchAnimals(){
      
      Http http=new Http();
      HttpRequest request=new HttpRequest();
      HttpResponse response=new HttpResponse();

      //GET(sENDING THE REQUEST)
      request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
      request.setMethod('GET');

      //Response

      response=http.send(request);
      system.debug('Get status code '+response.getStatusCode());
      system.debug('Response Body '+response.getBody());
      if(response.getStatusCode()==200){
      String jsonResponseAnimals=response.getBody();
      AnimalsWrapper result=(AnimalsWrapper) JSON.deserialize(jsonResponseAnimals, AnimalsWrapper.class);
      for(String animal:result.animals){
        system.debug('Each Animals: '+animal);
      }
      }
      return response;
     }
}
