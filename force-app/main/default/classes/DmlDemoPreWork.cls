public class DmlDemoPreWork {
    public static void createContact() {
        Contact cnt=new Contact();
        cnt.Salutation='Mrs.';
        cnt.LastName='Shahid';
        cnt.Phone='798787754';
        cnt.MailingCity='Ankara';
        cnt.MailingStreet='Kizilkaya';
        cnt.MailingCountry='Turkey';
        insert cnt;//DML-insert ,it will create ID automatically
        system.debug(cnt);  
    }
    public static void createUpdateContact(){
        Contact cnt=new Contact();
        cnt.Salutation='Mrs.';
        cnt.LastName='Musk';
        cnt.Phone='7987889';
        cnt.MailingCity='Cap Town';
        cnt.MailingStreet='Fortside';
        cnt.MailingCountry='South Africa';
        insert cnt;//DML-insert ,it will create ID automatically
        system.debug(cnt); 
        cnt.FirstName='Elon';
        update cnt;
        system.debug(cnt);
    }
    public static void updateOneContact(){
        Contact c1=[Select ID,FirstName,LastName from Contact where LastName='Musk' limit 1 ];
        c1.FirstName='Elon';
        c1.Email='musk@yahoo.com';
    
        update c1;
        system.debug(c1);
    }
}