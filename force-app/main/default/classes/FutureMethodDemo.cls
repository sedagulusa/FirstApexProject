public class FutureMethodDemo {

   //You will get 2 logs for synchs and asynchs
        //Synch
    public void getReady(){
        system.debug('Get ready');
    }
    public void breakfast(){
        system.debug('Breakfast');
    }
    public void movie(){
        system.debug('Lets go');       
    }
        //Asynch
   @future    
    public static void futureMethod(){
        system.debug('My future method car servicing');
    }
}
/*FutureMethodDemo demo=new FutureMethodDemo();
demo.getReady();
demo.breakfast();
demo.movie();
FutureMethodDemo.futureMethod();*/