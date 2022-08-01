public class MapPracticeSession {
    public static void mapsPractice(){
    List<String> AClass1=new List<String>{'Ali','Adem','Ahmet','Altan'};//
        List<String> BClass2=new List<String>{'Ali','Alice','Aly','Almeda'};
            Map<String,List<String>> mapOfClasses=new Map<String,List<String>>(); 
    mapOfClasses.put('Class-A',AClass1);
    mapOfClasses.put('Class-B',BClass2);
        system.debug(mapOfClasses);
        system.debug(mapOfClasses.keySet());
        system.debug(mapOfClasses.values());
        system.debug(mapOfClasses.get('Class-A'));
        system.debug(mapOfClasses.get('Class-B'));
        List<String> myList=mapOfClasses.get('Class-B');
        System.debug('My List: ' + myList);
        System.debug('3rd student:' + myList.get(2));
        Map<String, String> MyStrings = new Map<String, String>{'a' => 'b', 'c' => 'd'.toUpperCase()};
            system.debug(MyStrings);
    }
    public static void loopDemo(){
        Integer count=1;
        while(count<=25){
            system.debug(count);
            count++;
        }
    }
    public void printNum(Integer n){
        for(Integer i=1;i<=n;i++){
            system.debug(i);//1-n
        }
    }
    
           
        
    }