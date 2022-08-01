public class EmployeeInfo {
    public void showInfo(Integer empNumber){
        map<Integer,string> employeeMap=new map<Integer,string>();
        employeeMap.put(001,'Madhu');
        employeeMap.put(002,'Sri');
       system.debug(employeeMap.get(empNumber)) ;
    }
    
}