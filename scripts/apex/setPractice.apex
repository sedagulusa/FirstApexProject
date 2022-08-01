Set<Integer> s;
System.debug(s);
if(s == null){
    s=new Set<Integer>();
}
Boolean isSEmpty=s.isEmpty();
system.debug('is empty '+isSEmpty);
system.debug('the size '+s.size());

Set<String> xfruits=new Set<String>();
xfruits.add('Pineapple');
xfruits.add('mango');
xfruits.add('lichi');
xfruits.add('kiwi');
xfruits.add('mango');
set<string> myfruits=new set<string>();
myfruits.add('mango');
myfruits.add('kiwi');
Boolean check=xfruits.containsAll(myfruits);
system.debug(check);
myfruits.clear();
xfruits.clear();
system.debug(myfruits.size()+' '+xfruits.size());

