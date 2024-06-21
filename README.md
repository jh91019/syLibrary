# 📚 도서관 및 도서 통합관리 웹
국비 훈련 과정에 진행한 두 번째 팀 프로젝트입니다.  
이용 권한이 구분되는 케이스를 레퍼런스로 활용하여 둘 이상의 사용자를 가정하고, 각 환경에 맞는 통합 웹 환경을 구현하고자 가상의 도서관 & 도서 통합 관리 시스템 구축을 주제로 선정하였습니다.

<br/>

* * *

## 📑 목차
[1. 프로젝트 개요](#1-프로젝트-개요)
  - [주제 및 목표](#-주제-및-목표)
  - [사용 기술 및 팀 구성](#-사용-기술-및-팀-구성)
  - [팀원별 구현 기능](#-팀원별-구현-기능)
   
[2. 프로그램 구조](#2-프로그램-구조)
  - [ER Diagram](#-er-diagram)
  - [View](#-view)
  - [Usecase Diagram](#-usecase-diagram)
  - [Flow Chart](#-flow-chart)

[3. 개별 페이지 안내](#3-개별-페이지-안내)
  - [관리자 화면](#-관리자-화면)
  - [사용자 화면](#-사용자-화면)

[4. 후기 및 개선점](#4-후기-및-개선점)
  - [프로젝트 후기](#-프로젝트-후기)
  - [개선점](#-개선점)

[5. 참고 URL](#5-참고-url)

<br/>

* * *

## 1. 프로젝트 개요
### 📅 개발 기간
2024.02.08 ~ 2024.03.11 (약 4주)
- 1주차: 프로젝트 기획 및 DB 구축 회의, 화면 설계(파트별 레이아웃 및 핵심 기능 설계).
- 2주차: 파트별 DB 설계 및 구축. 개인별 화면 및 모델 개발 작업 진행.
- 3주차: 1차 기능테스트 및 작업현황 공유. 오류 수정.
- 4주차: 2차 기능테스트. 사이트 오픈 및 최종시연. 프레젠테이션 준비.

<br/>

### 📝 주제 및 목표
**[주제]** 도서관 및 도서 통합관리 웹 사이트

**[목표]**
1. 1차 프로젝트 후의 피드백 반영 및 훈련기간 동안 학습한 내용의 적용		
2. Front-end & Back-end의 다양한 기술스택을 활용한 웹 애플리케이션 구현
3. 데이터베이스 구축 및 SQL문 연습 & 뷰, 조인, 프로시저 등의 적극 활용

<br/>

### 💻 사용 기술 및 팀 구성

**[사용 기술 및 개발 환경]**
- OS : Windows11
- Front-end  :  HTML5, CSS3, Javascript
- Back-end : JDK21, OracleDB 23.1.1, Java
- Tools : Eclipse, SQL Developer
- Library : Lombok 1.18.30, MyBatis 3.5.15, Json, Jquery 3.7.1, JSTL, Ajax, Bootstrap 5.3, Sweetalert2, Chart.js 4.4.0, Apache Tomcat 10.1.19

<br/>

### 팀원별 구현 기능
![team](https://github.com/jh91019/android/assets/156145497/e90d15c6-c666-4275-9262-df549e33b49c)

* * *

## 2. 프로그램 구조
### ☑ ER Diagram
![erd](https://github.com/jh91019/android/assets/156145497/fd2e695f-51e4-4f3c-b91a-1421b781315a)

<br/>

### ☑ View
![view](https://github.com/jh91019/android/assets/156145497/2425f37d-5358-47a2-be5a-ca54975f7fa3)

<br/>

### ☑ Usecase Diagram
![usecase](https://github.com/jh91019/android/assets/156145497/62260a38-3dd1-499a-9b2d-7af892ea42b0)

<br/>

### ☑ Flow Chart
**[관리자]**
![flow_admin](https://github.com/jh91019/android/assets/156145497/900737ac-d290-492a-8253-f987fb55572c)

**[회원/비회원]**
![flow](https://github.com/jh91019/android/assets/156145497/e212ed6f-034d-44e5-9a92-001f785a5692)

<br/>

* * *

## 3. 개별 페이지 안내
### 📌 관리자 화면
#### 🔸메인 화면

![admain1](https://github.com/jh91019/android/assets/156145497/9796cc57-cb39-4959-8fef-6dfcd1659ef2)
![admain2](https://github.com/jh91019/android/assets/156145497/22108082-2d6d-44cf-9605-b07e49dcaffa)
![admain3](https://github.com/jh91019/android/assets/156145497/1533f2f1-c36e-4e87-abf4-7c134af82650)

<br/>

#### 🔸도서 관리

![도서 수정 삭제](https://github.com/jh91019/android/assets/156145497/537df695-60bd-4b06-a8c4-14601855ecfa)
[도서 목록/수정/삭제]
- 도서번호, 도서명, 저자, 출판사, 분류별로 검색 가능
- 분류나 검색어가 없을 경우 alert 창으로 알림
- 번호 클릭 시 도서 수정 화면으로 이동
- 삭제 시 한 번 더 묻는 알림창 표시

<br/>

![도서 등록](https://github.com/jh91019/android/assets/156145497/8f83de76-748b-4de4-abc5-41b5fe7a0f87)
[도서 등록]
- 전부 입력하지 않으면 각각에 맞춰 알림창이 뜸
- 도서 등록 후 확인을 누르면 목록으로 이동, 취소를 누르면 추가 등록 가능
- 데이터베이스의 SL_BOOK.B_CATEGORY를 불러와서 select 대신 datalist로 처리함 (기존의 분류 선택과 직접 작성 전부 가능) 

<br/>

#### 🔸대출 반납
![도서 대출 반납 목록](https://github.com/jh91019/android/assets/156145497/194cc700-48bb-4dcb-9271-e64e8aa9a688)
[도서 대출/반납 목록]
- 최초 리스트는 가장 최근 대출건부터, 연체일을 누르면 미반납 중에서 연체일이 큰 순서로 정렬
- 연체자에게 반납 요구 연락 가능
- 해당 대출자의 이메일을 기본으로 가져옴 
- 보내는 사람은 도서관 메일로 지정
- 모달의 바깥 부분을 누르거나 X 표시 클릭 시 꺼짐

<br/>

![대출 도서 관리](https://github.com/jh91019/android/assets/156145497/619c428e-4b5e-48a7-9716-1d538b7459d1)
![reserv](https://github.com/jh91019/android/assets/156145497/ff98eef7-d56b-4ca0-b821-280eccc025b1)

<br/>

#### 🔸도서 통계 및 회원 관리
![chart](https://github.com/jh91019/android/assets/156145497/bb629161-c8aa-4ffd-ad8b-cbb3a0a6d6b7)
![member](https://github.com/jh91019/android/assets/156145497/ccad5cc9-5079-4fc9-9bfd-cbd8f9e885cb)

<br/>
<br/>

### 📌 회원/비회원 화면

* * *

## 4. 후기 및 개선점
### 🖍 프로젝트 후기
- DB구축 과정에서 기획부터 다양한 테이블 관계 형성과 프로시저, 뷰를 적극 활용할 수 있도록 노력했고 그 결과 많은 공부가 되었다.
- 협업툴로써  SVN을 활용하여 1차 프로젝트보다 의사소통 및 버전 관리를 더 효율적으로 진행할 수 있었다.
- 팀 프로젝트를 통해 서로 부족한 부분을 채울 수 있는 계기가 되었다.

<br/>

### ⚒ 개선점
- 데이터가 바뀔 때마다 화면 깜빡이는 현상 개선
- 검색어 자동 완성 기능 업그레이드
- 온라인 중고 서적 사이트나 도서관 이용 모바일 앱 등으로의 발전
- 도서 정보 오픈 API 활용해보기
- 현업에서 많이 사용하는 Git을 활용해 볼 것을 고려

<br/>

* * *

## 5. 참고 URL
- **[노원구립 도서관]**: https://www.nowonlib.kr/
- **[인창 도서관]**: https://www.gurilib.go.kr/inlib/index.do
- **[국립 중앙 도서관]**: https://www.nl.go.kr/
- **[알라딘]**: https://www.aladin.co.kr/home/welcome.aspx
- **[교보문고]**: https://www.kyobobook.co.kr/

