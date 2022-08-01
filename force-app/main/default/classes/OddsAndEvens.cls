public class OddsAndEvens {

    public static List<Integer> printTheOdds(integer startInt, integer endInt){
       
        List<Integer> oddList=New List<Integer>();
        List<Integer> evenList=New List<Integer>();

        for(Integer i=startInt; i<=endInt; i++){
            Integer modOne=math.mod(i, 2);
            if(modOne==1){
                oddList.add(i);
            }else{
                evenList.add(i);
            }
        }
        //System.debug(' Odd Numbers => ' + oddList);
        //System.debug(' Even Numbers => ' + evenList);

        return oddList;
    }
}