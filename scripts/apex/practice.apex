// system.debug(SoqlPractice.findOpportunities('Web','Closed Lost'));

// List<Opportunity> ll=SoqlPractice.findOpportunities('Web','Closed Won');
// system.debug(ll);
DmlPracticeCw dd=new DmlPracticeCw();
Account acc=new Account(Name='Practice Account');
insert acc;
dd.CreateContacts();