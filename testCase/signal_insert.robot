*** Settings ***
Documentation     单条添加
Resource          ../keywordManager.robot

*** Test Cases ***
test_signal_all
    [Documentation]    全部请求，正确值
    ${data}    set variable    {"ProductName":"不锈钢板HU","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"3000","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    e1edeadd-82f4-4868-a4b2-7b507b6fba8f
    insert_signal    {"data":${data},"appid":"${appid}"}    "10000"    "添加资源成功"

test_signal_noPram
    [Documentation]    请求参数为空
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    " \ "
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "无效请求！"

test_signal_MutilPram
    [Documentation]    插入多条数据
    ${data}    set variable    [{"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"},{"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}]
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "数据格式不正确！"

test_signal_param_is_kong
    [Documentation]    调用接口，参数值为空
    ${data}    set variable    {"ProductName":"","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10003"    "请输入产品名称ProductName"

test_signal_insert_sameAgain
    [Documentation]    重复添加,目前可以重复添加
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10000"    "添加资源成功"

test_signal_appid_error
    [Documentation]    错误的APPID
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    459ac6de-5a38-49ff-8bf4-a7e56bb36feezbzzbd
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "身份验证失败！"

test_signal_appid_kong
    [Documentation]    appid 为空
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "AppId不能为空！"

test_signal_mustbe
    [Documentation]    请求参数全部是必填写项
    ${data}    set variable    {"ProductName":"不锈钢板mustbe","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","Price":100,"Weight":100,"City":"上海","Contact":"联系人","Tel":"13262630280","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10000"    "添加资源成功"

test_product_Number_string
    [Documentation]    产品件数类型非整数性：为字符串
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10a","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "参数类型错误"

test_product_Number_float
    [Documentation]    产品件数类型非整数性：float num=10.1
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10.1","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10003"    "参数类型不正确"

test_product_piece_int
    [Documentation]    产品件重为非浮点型：int 类型
    ${data}    set variable    {"ProductName":"不锈钢板priceInternet","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":10,"SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "无效请求！"

test_product_piece_string
    [Documentation]    产品件重 piece类型非浮点型：为字符串 10asd
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10asd","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "无效参数"

test_product_price_int
    [Documentation]    price 类型不正确为：int 类型 10
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "无效参数"

test_product_price_float
    [Documentation]    产品价格类型为：浮点型 10.00
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10.00","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "无效参数"

test_porduct_weight_int
    [Documentation]    库存吨数类型不正确:为int
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10001"    "无效请求！"

test_product_number_lagerInt
    [Documentation]    number 数字超过 INT 2**31 -1 数据范围 数值为：1000000000000000000000000000000000
    ${data}    set variable    {"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"1000000000000000000000000000000000","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"}
    ${appid}    set variable    b2937442-45c1-45af-b3ca-9482834ae27e
    insert_signal    {"data":${data},"appid":"${appid}"}    "10003"    "参数错误"

test_pa
    ${list}    Muitil_product_param

test_insert_1
    insert_signal    {"data":{"ProductName":"不锈钢板","Specification":"20.0*1500*6000","Material":"430","ProductType":"产品规格","Factory":"太钢","WareHouse":"新百发仓库(无锡)","WareHouseTel":"13262630280","Price":100,"Weight":100,"Province":"上海","City":"上海","Contact":"联系人","Tel":"13262630280","Number":"10","Piece":"10","SourceUrl":"http://www.tsgw.cc/","ProviderName":"泰山钢网"},"appid":"b2937442-45c1-45af-b3ca-9482834ae27e"}    "10003"    "参数错误"
