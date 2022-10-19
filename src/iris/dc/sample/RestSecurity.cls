Class dc.sample.RestSecurity Extends Api.Config.REST.OnPreDispatchAbstract
{

ClassMethod OnPreDispatch(pUrl As %String, pMethod As %String, ByRef pContinue As %Boolean) As %Status
{
    Set sc = $$$OK

    /// Implement your custom access verifications here.

    Set key = $Increment(^RestSecurity.log)
    Set ^RestSecurity.log(key) = $ZDateTime($Horolog,3,1) _ " " _ pMethod _ " " _pUrl _ "( IP : " _ $Get(%request.CgiEnvs("REMOTE_ADDR")) _ ")"

    merge ^RestSecurity.log(key, "CgiEnvs") = %request.CgiEnvs
    merge ^RestSecurity.log(key, "Data") = %request.Data

    // Example to stop the execution :
    // Set %response.Status = "401 Unauthorized"
    // Set pContinue = $$$NO

    Quit sc
}

}
