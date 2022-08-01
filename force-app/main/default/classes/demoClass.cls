public class demoClass {
    public void displayValues(){
        String FavCharacter='Rachel';
        Integer season=10;
        Boolean isHeCute=True;
        system.debug('My favorite character is '+FavCharacter);
        system.debug('There are '+season+ ' seasons.');
        system.debug( 'Is Joey cute? '+isHeCute);
            
        Long myLongNum=756669977L;
        Double myDoubleNum=6767.78;
        system.debug('print my long number '+myLongNum);
        system.debug('print my double number '+myDoubleNum);

        Date myDate=system.today();
        ID mySalesForceID='0068b00001KB3x7AAD';
        Object myObj=12789;
        system.debug('print my date '+myDate);
        system.debug('print my ID '+mySalesForceID);
        system.debug('print my object '+myObj);

        string firstName='Seda';
        string lastName='Gul';
        string fullName=firstName + lastName;
        system.debug(fullName);

    
    }

}