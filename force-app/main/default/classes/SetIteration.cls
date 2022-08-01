public class SetIteration {
    public void myIterationSet(){
        set<string> mySet=new set<String>();
        mySet.add('apple');
        mySet.add('orange');
        mySet.add('pear');
        mySet.add('kiwi');
        mySet.add('orange');
        system.debug(mySet);
        for(String fruits:mySet){
            system.debug(fruits);
        }
        Set<String> newSet=new Set<String>();
        for(String fruits:mySet){
           String capFruits=fruits.capitalize();
           system.debug(capFruits);
            newSet.add(capFruits);
        }
        system.debug(newSet);
    }    
}