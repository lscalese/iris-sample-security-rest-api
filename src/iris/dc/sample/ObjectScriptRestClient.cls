Class iris.dc.sample.ObjectScriptRestClient
{

ClassMethod GetRequestObj() As %Net.HttpRequest
{
    Set httpRequest = ##class(%Net.HttpRequest).%New()
    Set httpRequest.Username = "_system"
    Set httpRequest.Password = "SYS"
    Set httpRequest.Server = "iris-security-rest-server"
    Set httpRequest.Port = 52773
    Set httpRequest.Https = 0
    Quit httpRequest
}

/// Description
ClassMethod ExampleGetUserList() As %Status
{
    Set sc = $$$OK
    Set httpClient = ##class(IrisSecurity.HttpClient).%New()
    Set httpRequest = ..GetRequestObj()
    Do httpRequest.SetHeader("accept", "application/json")
    Set msg = ##class(IrisSecurity.msg.GetListOfUsersRequest).%New()
    Set sc = httpClient.GETGetListOfUsers(msg,.response,.httpRequest,.httpresponse)
    Write !,"Status           : ",$SYSTEM.Status.GetOneErrorText(sc)
    Quit:$$$ISERR(sc) sc
    Write !,"Http Status Code : ",response.httpStatusCode
    Write !
    zw response
    
    If response.httpStatusCode = 200 {
        Set formatter=##class(%JSON.Formatter).%New()
        Do formatter.Format({}.%FromJSON(response.body))
    } 

    Quit sc
}

ClassMethod ExampleGetWebAppList() As %Status
{
    Set sc = $$$OK
    Set httpClient = ##class(IrisSecurity.HttpClient).%New()
    Set httpRequest = ..GetRequestObj()
    Do httpRequest.SetHeader("accept", "application/json")
    Set msg = ##class(IrisSecurity.msg.GetListOfWebAppsRequest).%New()
    Set sc = httpClient.GETGetListOfWebApps(msg,.response,.httpRequest,.httpresponse)
    Write !,"Status           : ",$SYSTEM.Status.GetOneErrorText(sc)
    Quit:$$$ISERR(sc) sc
    Write !,"Http Status Code : ",response.httpStatusCode
    Write !
    zw response
    
    If response.httpStatusCode = 200 {
        Set formatter=##class(%JSON.Formatter).%New()
        Do formatter.Format({}.%FromJSON(response.body))
    } 

    Quit sc
}

}
