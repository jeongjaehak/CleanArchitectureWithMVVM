//
//  NetworkEnums.swift
//  NetworkFramework
//
//  Created by 정재학 on 3/28/25.
//

import Foundation

/**
 REST(Representational State Transfer)의 약자로 자원을 이름으로 구분하여 해당 자원의 상태를 주고받는 모든 것을 의미합니다.
 
 즉 REST란
 HTTP URI(Uniform Resource Identifier)를 통해 자원(Resource)을 명시하고,
 HTTP Method(POST, GET, PUT, DELETE, PATCH 등)를 통해
 해당 자원(URI)에 대한 CRUD Operation을 적용하는 것을 의미합니다.
 
 CRUD Operation이란
 CRUD는 대부분의 컴퓨터 소프트웨어가 가지는 기본적인 데이터 처리 기능인 Create(생성), Read(읽기), Update(갱신), Delete(삭제)를 묶어서 일컫는 말로
 REST에서의 CRUD Operation 동작 예시는 다음과 같다.
 
 Create : 데이터 생성(POST)
 Read : 데이터 조회(GET)
 Update : 데이터 수정(PUT, PATCH)
 Delete : 데이터 삭제(DELETE)
 */
public enum HttpMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

/**
 Content-Type이란?
 Http 통신에서 전송되는 데이터의 타입을 명시하기 위해 header에 실리는 정보다. 즉, api 요청 시 request에 실어 보내는 데이터(body)의 타입 정보다.

 Content-Type 종류
 1) Multipart Related MIME 타입

 Content-Type: Multipart/related <-- 기본형태
 Content-Type: Application/X-FixedRecord
 2) XML Media의 타입

 Content-Type: text/xml
 Content-Type: Application/xml
 Content-Type: Application/xml-external-parsed-entity
 Content-Type: Application/xml-dtd
 Content-Type: Application/mathtml+xml
 Content-Type: Application/xslt+xml
 3) Application의 타입

 Content-Type: Application/EDI-X12 <-- Defined in RFC 1767
 Content-Type: Application/EDIFACT <-- Defined in RFC 1767
 Content-Type: Application/javascript <-- Defined in RFC 4329
 Content-Type: Application/octet-stream : <-- 디폴트 미디어 타입은 운영체제 종종 실행파일, 다운로드를 의미
 Content-Type: Application/ogg <-- Defined in RFC 3534
 Content-Type: Application/x-shockwave-flash <-- Adobe Flash files
 Content-Type: Application/json <-- JavaScript Object Notation JSON; Defined in RFC 4627
 Content-Type: Application/x-www-form-urlencode <-- HTML Form 형태
 4) 오디오 타입

 Content-Type: audio/mpeg <-- MP3 or other MPEG audio
 Content-Type: audio/x-ms-wma <-- Windows Media Audio;
 Content-Type: audio/vnd.rn-realaudio <-- RealAudio; 등등
 5) Multipart 타입

 Content-Type: multipart/mixed: MIME E-mail;
 Content-Type: multipart/alternative: MIME E-mail;
 Content-Type: multipart/related: MIME E-mail <-- Defined in RFC 2387 and used by MHTML(HTML mail)
 Content-Type: multipart/formed-data <-- 파일 첨부
 6) TEXT 타입

 Content-Type: text/css
 Content-Type: text/html
 Content-Type: text/javascript
 Content-Type: text/plain
 Content-Type: text/xml

 */

public enum ContentType: String {
    case json = "application/json"
}
