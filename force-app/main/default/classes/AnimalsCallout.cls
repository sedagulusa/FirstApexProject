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
     public static HttpResponse fetchAnimals2(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
        return response;
     }
     public static HttpResponse postAnimals(){

      Http http = new Http();
     HttpRequest request = new HttpRequest();
     request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
     request.setMethod('POST');
     request.setHeader('Content-Type', 'application/json;charset=UTF-8');
     // Set the body as a JSON object
     request.setBody('{"name":"ugly bird"}');
     HttpResponse response = http.send(request);
    // Parse the JSON response
     if(response.getStatusCode() != 201) {
     System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
      } else {
     System.debug(response.getBody());
}
    return response;
     }
    

}
