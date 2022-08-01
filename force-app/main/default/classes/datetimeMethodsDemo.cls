public class datetimeMethodsDemo {
    public void calculateAgeInMonths(){
        Date birthdate=Date.newInstance(1982, 9, 29);
        Date today1=Date.today();
        Integer months=birthdate.monthsBetween(today1);
        system.debug('Age in months '+months);
    }
    public void calculateAgeInDays(){
        Date birthdate=Date.newInstance(1982, 9, 29);
        Date today1=Date.today();
        Integer days=birthdate.daysBetween(today1);
        system.debug('Age in days '+days);
    }
    public void printSubscriptionEndDate(){
        Date subStartDate=Date.today();
        Date subEndDate=subStartDate.addDays(1000);
        system.debug(subEndDate);
         Integer yearEnd=subEndDate.year();
         Integer monthEnd=subEndDate.month();
        system.debug(yearEnd + monthEnd);         
    }
    public void printOfferEndDate(){
        DateTime offerStart=DateTime.now();
        DateTime offerEnd=offerStart.addHours(51);
        system.debug('Offer Start Date:'+offerStart);
        system.debug('Offer End Date: '+offerEnd);
    }
    public void printNoOfRemainingDays(){
        
        Date startDate=Date.newInstance(2021, 9, 9);
        Date todayDate=Date.today();
        Date endDate=startDate.addYears(1);
        Integer daysLeft=todayDate.daysBetween(endDate);
        system.debug(daysLeft);    
    }
}