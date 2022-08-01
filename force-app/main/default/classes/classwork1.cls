public class classwork1 {
public void printsubscription(){
    Date substartdate=Date.today();
    Date subenddate=substartdate.addDays(1000);
    Integer year=subenddate.year();
    system.debug(subenddate);
    system.debug(year);
    Integer month=subenddate.month();
    system.debug(month);
    Datetime dtadd=subenddate.addDays(12);
    system.debug(dtadd);
}
public void welcomeMSG(String msg){
    system.debug(msg);
}
}