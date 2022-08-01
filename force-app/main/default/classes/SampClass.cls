public class SampClass {
    public static string SampleStaticString;
    public string SampleNonStaticString;
    
    public static void SampleStaticMethod(){
        system.debug('Hey this is static method.');
    }
    public void SampleNonStaticMethod(){
        system.debug('Hey this is non-static method.');
    }
}