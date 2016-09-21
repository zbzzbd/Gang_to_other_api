*** Settings ***
Documentation     多条添加
Resource          ../keywordManager.robot

*** Test Cases ***
test_mutil_all
    [Documentation]    插入5000条数据
    ${data}    get_par
    ${appid}    set variable    e1edeadd-82f4-4868-a4b2-7b507b6fba8f
    insert_Mutil    {"data":${data},"appid":"${appid}"}    "10000"    "添加成功！"

test_mutil_noPram
    [Documentation]    参数为空

test_mutil_signal
    [Documentation]    添加一条资源

test_mutil_is_kong
    [Documentation]    参数为空

test_mutil_insert_theSame
    [Documentation]    多条批量重复添加

test_get
    ${a}    get_par
    log    ${a}
