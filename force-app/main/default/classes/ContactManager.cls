@RestResource(urlMapping='/Contacts/*')
global with sharing class ContactManager {
    global class MyException extends Exception {
        
    }
    @HttpGet
    global static Contact getContacts() {
        RestRequest request=RestContext.request;
        String requestURL = request.requestURI;
        String conId=requestURL.substring(requestURL.lastIndexOf('/')+1);
        if(conId.length() < 18){
            throw new MyException('Id is not 18 characters!');
        }else{
        List<Contact> conList=[Select Id,Title,FirstName,LastName,Email,Phone from Contact Where Id=:conId];
        return conList[0];
        }
}
@HttpPost
global static Id createContact(String FirstName, String LastName, String Title,String Email,String Phone){
    if(LastName==''||LastName==NULL){
        throw new MyException('Last name is missing!');
    }else{
    Contact con=new Contact();
    con.FirstName=FirstName;
    con.LastName=LastName;
    con.Email=Email;
    con.Phone=Phone;
    con.Title=Title;

    insert con;
    return con.Id;
    }
    
}
@HttpDelete
    global static void deleteContact(){
        RestRequest request = RestContext.request;
        String conId = request.requestURI.substring(
         request.requestURI.lastIndexOf('/')+1);
         List<Contact> myContactList=[Select Id From Contact Where Id=:conId];

         if(myContactList.isEmpty()){
          throw new MyException('Id could not found!');
         }else{
            delete myContactList[0];
         }
         
    }
    @HttpPut
    //upsert
    global static Contact upsertContact(String Id,String FirstName, String LastName, String Title,String Email,String Phone){
        Contact con=new Contact();
        con.FirstName=FirstName;
        con.LastName=LastName;
        con.Email=Email;
        con.Phone=Phone;
        con.Title=Title;
        con.Id=Id;

        upsert con;
        return con;
    }
    @HttpPatch
    global static Contact updateContact(){
        RestRequest request = RestContext.request;
        String contactId = request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1);
        Contact con=[Select id from Contact Where Id=:contactId];
        Map<String, Object> values = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        for(String fieldName:values.keySet()){
            con.put(fieldName,values.get(fieldName));
        }
        update con;
        return con;
    }
}