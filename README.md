# 클린 아키텍쳐 + MVVM 활용 포트폴리오

## 1. 프로젝트 설명
###
이 프로젝트는 https://jsonplaceholder.typicode.com/users API를 사용하여 받은 데이터를 UICollectionView로 처리하여 리스트 화면 구성하는 프로젝트 입니다.

### 1.1. 프로젝트 작성 규칙
- Entities > Use Cases > Controllers > External Interfaces 종속성 흐름 제어
- Model - View - ViewModel 패턴 사용. 
- UI는 SwiftUI만 사용한다.
- 외부 라이브러리 사용금지.
- 통신모듈 URLSession을 사용하여 구현.
- 데이터 파싱은 Codable을 채택하여 구조체로 관리 및 사용.

### 1.2. 화면 구성
- 전체 

## 2. 프로젝트 설정
### 2.1. [Tuist](https://docs.tuist.dev/ko/#installation) 기반으로 작성
Mise를 이용하여 설치하였으며 Tuist 버전은 4.45.0 기준으로 작성되었습니다. ([mise.toml](./mise.toml) 참고)

## 3. 프로젝트 구조

## 4. GIT Message Convention
- feat: 새로운 기능
- fix: 버그 수정
- docs: 문서 변경 사항
- style: 코드 스타일 관련 변경 (주석, 공백 변경, 개행 처리)
- refactor: 코드 리팩토링
- test: 테스트 코드
- chore: 빌드 작업 (프로젝트 설정 변경, 패키지 관리자 변경, 라이브러리 추가 및 삭제)
