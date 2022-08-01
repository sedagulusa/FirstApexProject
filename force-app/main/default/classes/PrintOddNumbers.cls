public class PrintOddNumbers {
    public void printOdds(Integer startInt , Integer endInt){
       integer counter=0;
        for(integer i=startInt;i<=endInt;i++){
            integer calc=math.mod(i, 2);
            if (calc==1){
                system.debug(i+' is an odd number.');
                counter++;
              }
        }
        system.debug('Total # of odd numbers is:'+counter);
    }

}