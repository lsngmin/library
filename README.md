<img src="https://capsule-render.vercel.app/api?type=waving&color=a6a6df&height=150&section=header" />
<div align="center">
  
# 도서관리 시스템 프로젝트 README
  
## :star: Skills :star:

<img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white"/>
<img src="https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/Amazon_AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white"/>
<img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white"/>
<img src="https://img.shields.io/badge/IntelliJ_IDEA-000000.svg?style=for-the-badge&logo=intellij-idea&logoColor=white"/>	

## :star: Co-Work :star:

<img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"/>
<img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white"/>
<img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white"/>

### draw.io

## :construction_worker: Worker

<a href="https://github.com/lsngmin/library/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=lsngmin/library" />
</a>
</div>

## 프로젝트 설명
* 도서관 내의 비치된 책의 정보와 대출가능여부를 알 수 있는 홈페이지 입니다.
* 도서관 관리자가 사용자와 책의 코드 만으로 쉽게 대출과 반납이 가능합니다.
* 관심도서 기능과 희망, 기증 도서 신청 기능을 통해 도서관 사용자의 니즈를 알 수 있습니다.
* 연체 해제, 책 정보 등록, 수정 기능을 사용할 수 있습니다.

## 프로젝트 기간
* 학부 재학중 전공 수업 3시간에서 진행한 기획부터 설계 그리고 개발까지 완료한 프로젝트 입니다.
* 2024-09-10 ~ 2024-12-03 (84일)
* 기획 1주 / 기능 요구서 2주 / 와이어 프레임 및 목업 4주 / 클래스 다이어그램 1주 / 시퀀스 다이어그램 및 개발 5주

## 빌드 및 배포
* Maven(war) 빌드, AWS LightSail(Tomcat) 배포
### [접속가능 :o:](http://bit.ly/3B1tlWk)

## 기능 요구서
<a href="https://github.com/lsngmin/library/blob/cd1ec5c5da5738c9e11684215b19b501e323b184/library-project-%EA%B8%B0%EB%8A%A5%EC%9A%94%EA%B5%AC%EC%84%9C.xlsx" target="_blank">
    <img src="https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white" alt="Microsoft Excel">
</a><details><summary>상세보기</summary>

![image](https://github.com/user-attachments/assets/43981a2a-8340-4e52-a67c-9c4bebeb5cdd)
![image](https://github.com/user-attachments/assets/c5c7be20-ac5d-4a2b-97b8-c9a87d8f4830)
![image](https://github.com/user-attachments/assets/d51d7dea-0163-4908-b4f2-22b4f64e0544)
![image](https://github.com/user-attachments/assets/24d36624-57aa-4b1a-b003-9dbc3ea3f0a8)
![image](https://github.com/user-attachments/assets/9be49693-788d-424b-84b9-035bdb4c74c6)
![image](https://github.com/user-attachments/assets/d9a8aaf1-baa1-4a2c-9405-2f5b829ab2b6)

</details>

## 와이어프레임과 목업
* [와이어프레임 보러가기](https://github.com/lsngmin/library/tree/16cf3c39f534a8744a375c91f9ba9778bcb8296e/library-project-wireframe)
* [목업 보러가기](https://github.com/lsngmin/library/tree/16cf3c39f534a8744a375c91f9ba9778bcb8296e/library-project-mockUp)



## 프로젝트 구조

```bash
library
├─src
│  └─main
│      ├─java
│      │  └─com
│      │      └─library
│      │          ├─admin
│      │          │  ├─controller
│      │          │  └─model
│      │          ├─book
│      │          │  ├─exception
│      │          │  ├─model
│      │          │  └─service
│      │          ├─controller
│      │          ├─donationBook
│      │          │  ├─model
│      │          │  └─service
│      │          ├─noticeBoard
│      │          │  ├─model
│      │          │  └─service
│      │          ├─rental
│      │          │  ├─controller
│      │          │  ├─model
│      │          │  └─service
│      │          ├─user
│      │          │  ├─controller
│      │          │  ├─model
│      │          │  └─service
│      │          └─wishBook
│      │              ├─model
│      │              └─service
│      ├─resources
│      │  └─mappings
│      └─webapp
│          ├─resources
│          │  ├─css
│          │  │  ├─admindashboard
│          │  │  ├─library
│          │  │  ├─login
│          │  │  └─myinfo
│          │  ├─img
│          │  │  └─admindashboard
│          │  └─js
│          │      ├─admindashboard
│          │      ├─library
│          │      └─myinfo
│          └─WEB-INF
│              └─views
│                  ├─admin
│                  ├─library
│                  └─myinfo
                
```
## 클래스 다이어그램
![클래스 다이어그램](https://github.com/user-attachments/assets/9287ef19-7222-48a4-83f3-4d8fde6d6a7a)

## 시퀀스 다이어그램
<details>
  <summary>사용자</summary>
  
### 1. 로그인 to 내 정보 조회  
<div align="center">

![스크린샷 2024-11-28 013618](https://github.com/user-attachments/assets/db53781a-b8a1-45e5-91eb-a15d28b4d04b)

</div>

### 2. 도서기증
<div align="center">

![image](https://github.com/user-attachments/assets/16819cb3-470d-4f18-89f4-607fe062eeaa)

</div>

### 3. 희망도서

<div align="center">

![image](https://github.com/user-attachments/assets/9d94c103-1daf-4da6-ae1b-fdd0c91a82dd)

![image](https://github.com/user-attachments/assets/bc217428-72e9-4661-b5be-e516cb218583)

</div>

### 4. 관심도서 목록

<div align="center">

![image](https://github.com/user-attachments/assets/7e6b86c1-bcc9-4ab7-9f68-5558973f5a7c)

</div>

### 5. 통합 검색, 상세 보기

<div align="center">

![image](https://github.com/user-attachments/assets/fef4a5ba-ef09-465f-aa68-a787e68b4c58)

![image](https://github.com/user-attachments/assets/766528a6-6faf-4532-b3ca-9c021501468a)

</div>
</details>
<details>
  <summary>관리자</summary>

### 1. 대시보드 정보 출력, 대출실행 프로세스

<div align="center">
  
![image](https://github.com/user-attachments/assets/78fa804c-c14a-4a0d-bf2d-4221b31c4a48)

</div>

### 2. 반납 실행 프로세스

<div align="center">

![image](https://github.com/user-attachments/assets/315b4180-6fd9-4101-983e-7d1803fc4271)

</div>

### 3. 연체 해제 프로세스

<div align="center">

![image](https://github.com/user-attachments/assets/11e37e00-4621-453f-80d4-8c369a07baab)

</div>

### 4. 희망도서 신청 현황

<div align="center">

![image](https://github.com/user-attachments/assets/0dbd8458-7756-4697-b221-e329a7d3062f)

</div>
</details>

## 노션 작업 테이블
* [PDF파일 보기](https://github.com/lsngmin/library/blob/16cf3c39f534a8744a375c91f9ba9778bcb8296e/library-project-worktable.pdf)
  
<div align="center">
  
![image](https://github.com/user-attachments/assets/abaf44d8-c14d-462e-a1b6-de3b0171f3c3)

</div>

<img src="https://capsule-render.vercel.app/api?type=waving&color=a6a6df&height=150&section=footer" />

