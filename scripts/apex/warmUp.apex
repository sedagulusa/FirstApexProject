List<account> myList=new List<Account>(); 
Account acc1=new Account();
acc1.Name='Test 1';
myList.add(acc1);
Account acc2=new Account();
acc2.Name='Test 2';
myList.add(acc2);
insert myList;

List<Account> newList=[Select name,id from Account Where name='Test 1' or name='Test 2'];
system.assertEquals('Test 1', newList.get(0).Name);
system.assertEquals('Test 2', newList.get(1).Name);

for(Account each:newList){
    each.Name='Test account';

}
update newList;
//create contacts
//1.parent needs to be created
//2.get the ID
//3.Create the contact with the parent id,AccountID=acc.id
//4.create 2/more contacts for each account-
//5.Loop through parent and loop