public class CustomSettingDemo {
    public static void demoMethod(){
        //List custom setting
        Map<String,Country_Code_cs__c> countryCode=Country_Code_cs__c.getAll();
        system.debug('Custom settings List Type: '+countryCode);
        for(Country_Code_cs__c cs:Country_Code_cs__c.getAll().values()){
            system.debug(cs.Country_Code__c);
        }
        //Hierarcy custom setting
        Golds_Gym_Membership__c gm1 = Golds_Gym_Membership__c.getorgDefaults();
        //Parameters - UserID/ProfileID
        Golds_Gym_Membership__c gm2 = Golds_Gym_Membership__c.getInstance(UserInfo.getUserId());
        Golds_Gym_Membership__c gm3 = Golds_Gym_Membership__c.getInstance('0058b00000G2WEo');
        system.debug(gm1);
        system.debug(gm2);
        system.debug(gm3);
    }
}
//CustomSettingDemo.demoMethod();