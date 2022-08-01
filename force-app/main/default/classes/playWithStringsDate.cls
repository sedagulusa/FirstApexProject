public class playWithStringsDate {
    public void printOutput(){
        system.debug('Welcome to Practice');
        
        String text='Hello Eagles!     ';
        String textTrimmed=text.trim();
        system.debug('I have removed the spaces '+textTrimmed);
        String text1='marvel';
        String text1Cap=text1.capitalize();
        system.debug(text1Cap);
        Date tdy=Date.today();
        Date yesterdaysDate=tdy.addDays(-1); 
        system.debug('Yesterday was '+yesterdaysDate);
        Date tomorrowsDate=tdy.addDays(1);
        system.debug('Tomorrow will be '+tomorrowsDate);
        Date afterOneYear=Date.newInstance(2023, 6, 18);
        system.debug('After 1 year today: '+afterOneYear);
    }
}