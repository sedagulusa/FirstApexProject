public class EmployeeInformation {
    public String showInfos(Integer empNum) {
        map<Integer,string> employeeMap=new map<Integer,string>();
        employeeMap.put(001,'Seda');
        employeeMap.put(002,'Mehmet');
        String empName=employeeMap.get(empNum);
        return empName ;
    }
    public void demoIf(){
        String value='Wake up';
        if( value.length()>0){
            system.debug('Valid string.');
        }else{
            system.debug('Invalid!');
        }
    }

        }