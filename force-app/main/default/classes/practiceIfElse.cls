public class practiceIfElse {
    public void largestOfThree(integer One,Integer Two,Integer Three){
        if(One>Two && One>Three){
            system.debug('the greatest is '+ One);
        }else 
            if(Two>One && Two>Three){
            system.debug('the greatest is '+Two);
        }else{
            system.debug( 'the greatest is '+Three);
        }      
    }
}