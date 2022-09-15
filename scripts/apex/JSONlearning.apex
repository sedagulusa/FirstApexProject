{
    "Name":"Grand Hotels & Resorts Ltd",
    "Type":"Costumer-Direct",
    "Rating":"Hot",
    "AnnualRevenue":500000000
}
{
    "FirstName":"Lauren",
    "LastName":"Boyle",
    "Email":"lboyle@uog.com"
}
//SObject to JSON
Account acc=[Select Id,Name,Type,Rating,AnnualRevenue from Account Limit 1];
String jsonStringAcc=JSON.serialize(acc);
system.debug(jsonStringAcc);

Contact con=[Select Id,FirstName,LastName,Email from Contact Where FirstName='Bala'];
String jsonStringCon=JSON.serialize(con);
System.debug(jsonStringCon);

List<Account> accList=[Select Id,Name,Type,Rating,AnnualRevenue from Account Limit 5];
String jsonStringAcc=JSON.serialize(accList);
system.debug(jsonStringAcc);

//JSON to SObject
Account acc=[Select Id,Name,Type,Rating,AnnualRevenue from Account Limit 1];
String jsonStringAcc=JSON.serialize(acc);
Account acc1=(Account) JSON.deserialize(jsonStringAcc, Account.class);//typecasting
system.debug('NEw Account '+acc1);

List<Account> accList=[Select Id,Name,Type,Rating,AnnualRevenue from Account Limit 5];
String jsonStringAcc2=JSON.serialize(accList);
List<Account> accList2=(List<Account>)JSON.deserialize(jsonStringAcc2, List<Account>.class);
system.debug('Deserialize list '+accList2);

/*XML*/
//JSON-REST
{
    "Name" : "Grand Hotels & Resorts Ltd",
    "Type" : "Customer - Direct",
    "Rating" : "Hot",
    "AnnualRevenue" : 100000000
}
//XML-SOAP
<Account>
    <Name>Grand Hotels & Resorts Ltd</Name>
    <Type>Customer - Direct</Type>
    <Rating>Hot</Rating>
    <AnnualRevenue>100000000</AnnualRevenue>
</Account>
