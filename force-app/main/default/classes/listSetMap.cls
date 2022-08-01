public class listSetMap {
    public void demoList() {
List<Integer> countOfTen=new List<Integer>();
countOfTen.add(10);
countOfTen.add(20);
countOfTen.add(30);
countOfTen.add(40);
countOfTen.add(50);
System.debug('List of tens '+countOfTen);
system.debug('Index3: '+countOfTen.get(3));
    }
    public void demoSet(){
        set<String> avengersSet=new set<String>();
        avengersSet.add('x');
        avengersSet.add('y');
        avengersSet.add('z');
        System.debug('Set: '+avengersSet);
        System.debug('Size is ' + avengersSet.size());
    }
    public void demoMap(){
        Map<string,string> myMap=new Map<string,string>();
        myMap.put('First','apple');
        myMap.put('Second','orange');
        myMap.put('Third','cherry');
        system.debug('My fruit list is '+ myMap);
        system.debug(myMap.get('Second'));
        system.debug('All the keys are: '+myMap.keySet());
        system.debug('All the values are: '+myMap.values());
    }



}