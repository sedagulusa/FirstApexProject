public class mapOfEmployees {

    public void countryCapitalCities(){
        Map<Integer,String> myMap=new Map<Integer,String>();
        myMap.put(001,'Dylan');
        myMap.put(002,'Farhan');
        myMap.put(003,'Asgar');
        myMap.put(004,'Noori');
        myMap.put(005,'Daglar');
        system.debug(myMap);
        Set<Integer> mySet=myMap.keySet();
        for(Integer countries:mySet){
            String cities=myMap.get(countries);
            system.debug('Key is '+countries+' , and its value is '+ cities+' .');
        }
        
    }
}