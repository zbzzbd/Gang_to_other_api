*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           HttpLibrary.HTTP
Library           Tools/tool.py

*** Variables ***
${url}            http://resource.ggang.cn:8002/GGangResouces

*** Keywords ***
insert_signal
    [Arguments]    ${data}    ${expected_RetCode}    ${expected_Msg}
    ${dit}    create dictionary    Content-type=application/json
    create session    api    ${url}    ${dit}
    ${addr}    post request    api    /AddResouces    data=${data}
    log    ${addr.content}
    should be equal as strings    ${addr.status_code}    200
    ${respone}    Evaluate    '${addr.content}'.decode("utf-8")
    ${responsedata}    to json    ${respone}    true
    ${RetCode}    get json value    ${responsedata}    /RetCode
    ${RetMsg}    get json value    ${responsedata}    /RetMsg
    ${Message}    get json value    ${responsedata}    /Message
    should be equal as strings    ${RetCode}    ${expected_RetCode}
    should be equal    ${RetMsg}    ${expected_Msg}
    Comment    should be equal    ${Message}    ${expected_Message}

insert_Mutil
    [Arguments]    ${data}    ${expected_RetCode}    ${expected_Msg}
    ${dit}    create dictionary    Content-type=application/json
    create session    api    ${url}    ${dit}
    ${addr}    post request    api    /AddResoucesList    data=${data}
    log    ${addr.content}
    should be equal as strings    ${addr.status_code}    200
    ${respone}    Evaluate    '${addr.content}'.decode("utf-8")
    ${responsedata}    to json    ${addr.content}    true
    ${RetCode}    get json value    ${responsedata}    /RetCode
    ${RetMsg}    get json value    ${responsedata}    /RetMsg
    ${Message}    get json value    ${responsedata}    /Message
    should be equal as strings    ${RetCode}    ${expected_RetCode}
    should be equal    ${RetMsg}    ${expected_Msg}

Muitil_product_param
    @{list}    create list
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"1000","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    : FOR    ${var}    IN RANGE    1    2
    \    ${data}    set variable    {"ProductName":"duotiaocharu${var}","Specification":"20.0*1500*6000","Material":"430","ProductType":"guige","Factory":"taigang","WareHouse":"xinfa","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"shanghai","City":"shanghai","Contact":"lianxiren","Tel":"13262630280","Number":"10000","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"tanshan"}
    \    append to list    ${list}    ${data}
    Comment    log    =@{list}=
    Comment    ${list_value}    Convert To String    ${list}
    [Return]    ${list}

get_par
    ${list}    get pram data
    [Return]    ${list}
