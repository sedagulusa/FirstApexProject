public class AirlineTicket {
    public string  departureCity;
    public string arrivalCity;
    public string flightNumber;
    public string seatNumber;
    
    public void printTicket(){
        system.debug('This ticket is for your journey. From '+departureCity +' to'+arrivalCity+ '.Your flight number is '+flightNumber+' .And your seat number is '+seatNumber+'.');
        //call the future method
        futureSendEmail(departureCity,arrivalCity,flightNumber,seatNumber);

    }
@future
public static void futureSendEmail(String departureCity,String arrivalCity,String flightNumber,String seatNumber){
    List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());   
            emailAddress.add('sedagulusa@gmail.com') ;        
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Welcome to travel with us!');
            String body='Please find your ticket details below, '+'\n\n'+'Departure (from) : ' +departureCity +'\n'+ 'Arrival (to) : '+arrivalCity+'\n'+'Flight Number: '+flightNumber+'\n'+'Seat Number: '+seatNumber+ '\n\n'+ 'Have a wonderful journey!';


            emailMsg.setPlainTextBody(body);
            emailMsgs.add(emailMsg);
            Messaging.sendEmail(emailMsgs);
}





}