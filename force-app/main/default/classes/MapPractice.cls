public class MapPractice {
    public static void mapClassMethods(){
        Map<Integer,String> zipCodeToCityMap=new Map<Integer,String>();//1
        zipCodeToCityMap.put(100101,'New Delhi');
        zipCodeToCityMap.put(101234 ,'Istanbul');
        zipCodeToCityMap.put(569023,'New York City');
        system.debug('My map: '+zipCodeToCityMap);
        zipCodeToCityMap.put(204101,'Hathras');
        zipCodeToCityMap.put(500034,'Hyderabad');
        system.debug('My map after adding new elements: '+zipCodeToCityMap);//2
        Set<Integer> zipCodes=zipCodeToCityMap.keySet();
        system.debug('If my map contains 204101: '+zipCodes.contains(204101));//3
        system.debug('All zip codes present in the map: '+zipCodes);//4
        List<String> cityList=new List<String>();
        for(Integer eachZipCode:zipCodes){
            String cityName=zipCodeToCityMap.get(eachZipCode);
            cityList.add(cityName);
        }
        //Or system.debug(zipCodeToCityMap.values());
        system.debug('All the cities are: '+cityList);//5
        system.debug('The number of mappings present '+zipCodeToCityMap.size());//6
        Set<Integer> allZipCodes=zipCodeToCityMap.keySet();//7
        List<String> cityNameList=zipCodeToCityMap.values();//8
        system.debug('If the my map is empty : '+zipCodeToCityMap.isEmpty());//9
        system.debug('List elements can be of any data type—primitive types, collections, sObjects, '+
                    ' user-defined types, and built-in Apex types.'+
                    ' A map is a collection of key-value pairs where each unique key maps to a single value.');
        
        
        
        
        
        
        
        
        
    }

}