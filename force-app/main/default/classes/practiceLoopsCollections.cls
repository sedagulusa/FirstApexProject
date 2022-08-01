public class practiceLoopsCollections {
    public Double findLargestInList(List<Double> myList){
        Double largestNum=0;
        for(Double eachNum:myList){
            if(largestNum==0 || eachNum>largestNum){
                largestNum=eachNum;
                
            }
        }
       return largestNum; 
    }

}