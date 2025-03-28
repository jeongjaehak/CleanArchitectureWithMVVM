//
//  UserInformation.swift
//  Entities
//
//  Created by 정재학 on 3/27/25.
//

import Foundation

/**
 기대 값
 {
     "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
   }
 */
/// 유저 정보를 담는 구조체
public struct UserInformation: Decodable {
    /// 고유 아이디 값
    public let id: Int?
    /// 이름
    public let name: String?
    /// 유저명
    public let username: String?
    /// 주소
    public let address: Address?
    /// 휴대폰 번호
    public let phone: String?
    /// 웹사이트
    public let website: String?
    /// 회사 정보
    public let company: Company?
}
