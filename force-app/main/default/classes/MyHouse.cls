public class MyHouse {
    string houseOwner='Seda';
    
    public void kitchen(){
        system.debug('I am in the kitchen '+houseOwner);
    }
      public void bedroom(){
         system.debug('I am in the bedroom '+houseOwner);
    }
      public void garrage(){
         system.debug('I am in the garrage '+houseOwner);
    }
    public void roomType(string roomType){
        system.debug('I am in the '+roomType);
    }
}