public class DemoWhileDoWhile {

    public void demoWhile(){
        Integer count=1;
        while (count<11){
            system.debug('Print: '+count);
            count++;
        }
        for (Integer i=0;i<10;i++){
        //ten times loop starting from 0 ending 9
        system.debug('Count i: '+ i );
    }
        for (Integer i=0;i<10;i++){
            Integer count1=i+1;
            system.debug('Count1 i: '+count1);
        }
    }
    
}