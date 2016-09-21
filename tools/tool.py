# -*- coding: utf-8 -*-
import  time
def get_pram_data():
    list = []
    for i in range(0,5170):
        sec=int(time.time())
        print str(sec)
        data = {"ProductName": "buxiu"+str(sec)+"gang", "Specification": "20.0*1500*6000", "Material": "430", "ProductType": "guige",
                "Factory": "taigang", "WareHouse": "wuxin", "WareHouseTel": "13262630280", "Price": 3000, "Weight": 100,
                "Province": "shanghai", "City": "shanghai", "Contact": "lianxiren", "Tel": "13262630280", "Number": i, "Piece": i,
                "SourceUrl": "http://www.tsgw.cc/", "ProviderName": "taishan"}
        list.append(data)
    print list
    return list


if __name__=="__main__":
    print  get_pram_data()