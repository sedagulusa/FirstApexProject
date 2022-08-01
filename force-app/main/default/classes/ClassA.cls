public class ClassA {
    public ClassA(){
        if(GeneralSetting.printFlag!='off'){
        system.debug('ClassA constructor.');
    }
        }
    public static void ClassAmethod1(){
        if(GeneralSetting.printFlag!='off'){
        system.debug('ClassA method 1 print statement.');
    }
    }
}