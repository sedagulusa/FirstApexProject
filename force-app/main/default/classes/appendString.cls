public class appendString {
    public void changeMyMap(){
        Map<Integer,String> myMap=new Map<Integer,String>();
        myMap.put(1001,'Samba');
        myMap.put(1002,'Leyla');
        myMap.put(1003,'Khalid');
        myMap.put(1004,'Xara');
        myMap.put(1005,'Caleb');
        myMap.put(1006,'AJ');
        system.debug('MyMap : '+myMap);
        
        Set<Integer> keySet1=myMap.keySet();//{003,002,004,001}
        List<integer> list1 =new List<integer>(keySet1);//{001,002,003,004}
         
        Map<Integer,String> myMap2=new Map<Integer,String>();
        //myMap2.put('key','value')  //map.get('key')
       
        for(integer i=0;i<keySet1.size();i++){
          myMap2.put(list1.get(i), myMap.get(list1.get(i))+'-Student '+ (i+1));  
        }
        system.debug('MyMap2 : '+myMap2);
    }
}