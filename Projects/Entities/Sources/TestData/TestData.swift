//
//  TestData.swift
//  Entities
//
//  Created by 정재학 on 4/3/25.
//

import Foundation

/// Entities 테스트 데이터 생성 관리
public struct TestData {
    
    /// 테스트 유저 정보
    public static var userInformation: UserInformation {
        return UserInformation(
            id: 1,
            name: "Test",
            username: "TestNick",
            email: "email@test.com",
            address: TestData.address,
            phone: "010-1234-5678",
            website: "https://www.naver.com",
            company: TestData.company)
    }
    
    /// 테스트 유저 주소
    public static var address: Address {
        return Address(street: "street",
                       suite: "suite",
                       city: "seoul",
                       zipcode: "12345",
                       geo: TestData.geo)
    }
    
    /// 테스트 유저 좌표
    public static var geo: Geo {
        return Geo(latitude: "38", longitude: "38")
    }
    
    /// 테스트 유저 회사
    public static var company: Company {
        return Company(name: "ComponyName", catchPhrase: "CP", businesStrategy: "BS")
    }
}
