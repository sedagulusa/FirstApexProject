public class CountryList {
    public void countryCapitalCities(){
        Map<String,String> myMap=new Map<String,String>();
        myMap.put('USA','DC');
        myMap.put('Turkey','Ankara');
        myMap.put('Turkmenistan','Ashgabat');
        myMap.put('India','New Delhi');
        myMap.put('USA','DC Washington');
        system.debug(myMap);
        Set<String> mySet=myMap.keySet();
        for(String countries:mySet){
            String cities=myMap.get(countries);
            system.debug('Key is '+countries+' , and its value is '+ cities+' .');
        }
        
    }
}