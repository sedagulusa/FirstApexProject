public class ListPractice {
    public static void listClassMethods(){
            List<String> colorsList=new List<String>{'orange','violet','pink','brown','yellow','Red','Green'};
            List<String> colourCodesList=new List<string>{'#FFA500','#8F00FF','#FFC0CB','#964B00','#FFFF00','#ff0000','#00FF00'};//6
            List<String> newList=new List<String>();
            newList.addAll(colorsList);
        	newList.addAll(colourCodesList);
            system.debug(colorsList);//1
        	system.debug('The size of my list is '+colorsList.size());//2
        	system.debug('If may list contains Red color:  '+colorsList.contains('Red'));//3
         	system.debug('Last element of my list in upper case: '+colorsList.get(colorsList.size()-1).touppercase());//4
        	system.debug('The fourth element in upper case: '+colorsList.get(3).touppercase() );//5
        	system.debug('If the two lists are equal: '+ colorsList.equals(colourCodesList));//7
        	system.debug('Merged new list: '+newList);//8
        
        
    }
    
}