public class SetPractice {
    public static void setClassMethod(){
        Set<String> uniqueNameSet=new Set<String>{'Tom','Jerry','Naruto','Finn','Pink Panther','Tom'};//1
            system.debug('The unique set is: '+uniqueNameSet);
            system.debug( 'The size of the set is: '+uniqueNameSet.size());//2
        uniqueNameSet.add('Tsubasa');
        uniqueNameSet.add('Perry');
        system.debug('My set after adding new elements :'+uniqueNameSet);//3
        system.debug('If the set contains Seda '+uniqueNameSet.contains('Seda'));//4
        system.debug('Is the set empty? '+ uniqueNameSet.isEmpty());//5
        uniqueNameSet.clear();
        system.debug('After I clear my set: '+uniqueNameSet) ;//6
        system.debug('Is the set empty after clear? '+uniqueNameSet.isEmpty());//7
        system.debug('Set does not have index therefore we can not get an element.');//8
        system.debug('List:Ordered,indexed,can contain duplicates'+'- Set:Unordered,no index,does not allow the duplicates');//9
        
        
        
        
        
        
        	
        
            
    }

}