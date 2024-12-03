<img src="https://capsule-render.vercel.app/api?type=waving&color=a6a6df&height=150&section=header" />
<div align="center">
  
# 도서관리 시스템 프로젝트 README
![image](https://github.com/user-attachments/assets/b73592bf-2b55-4b4a-acd7-e13de1de1369)
![image](https://github.com/user-attachments/assets/cd55ffb9-7b6a-4cf5-875f-7e20c296a51a)
![image](https://github.com/user-attachments/assets/ade8be8c-a55a-4364-b966-4665d9bd144d)



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

# 목차
[1. 프로젝트 설명](#프로젝트-설명)<br/>
[2. 프로젝트 기간](#프로젝트-기간)<br/>
[3. 빌드 및 배포](#빌드-및-배포)<br/>
[4. 기능 요구서](#기능-요구서)<br/>
[5. 와이어프레임과 목업](#와이어프레임과-목업)<br/>
[6. 프로젝트 구조](#프로젝트-구조)<br/>
[7. 클래스 다이어그램](#클래스-다이어그램)<br/>
[8. 시퀀스 다이어그램](#시퀀스-다이어그램)<br/>
[9. 작업 테이블](#작업-테이블)<br/>
[10. TroubleShooting](#TroubleShooting)<br/>
[11. 후기 및 향후 계획](#후기-및-향후-계획)<br/>

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
### 사용자 [접속가능 :X:](https://bit.ly/49foLk1)
### 관리자 [접속가능 :X:](https://bit.ly/41eRNOQ)


## 기능 요구서
<a href="https://github.com/lsngmin/library/tree/0d9365230e0d8c83f75e0181ac47080100e436b9/library-project-functionalRequire" target="_blank">
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
[메인코드](https://github.com/lsngmin/library/tree/4cbd173b0e08afa6a325fac6345020c27b21e2d9/src/main/java/com/library/admin/controller)

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

![image](https://github.com/user-attachments/assets/391338c6-1a81-4e57-9529-93f57b5928fc)




## 시퀀스 다이어그램
<details>
  <summary>사용자</summary>
  
### 1. 로그인 to 내 정보 조회 , 임시  비밀번호 발급 , 비밀번호 변
<div align="center">

![스크린샷 2024-11-28 013618](https://github.com/user-attachments/assets/db53781a-b8a1-45e5-91eb-a15d28b4d04b)

![image](https://github.com/user-attachments/assets/739cb58d-983d-4372-ba0a-5faae540dd71)

![image](https://github.com/user-attachments/assets/990ad8eb-3495-4021-959d-b670fa22e54b)


</div>

### 2. 도서기증
<div align="center">

![image](https://github.com/user-attachments/assets/16819cb3-470d-4f18-89f4-607fe062eeaa)

![기증도서 신청 및 현황 시퀀스](https://github.com/user-attachments/assets/67b549e2-14d5-4d3b-b10d-905319ff5ff6)


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

### 6. 공지사항

<div align="center">

![image](https://github.com/user-attachments/assets/7e48f5f5-7a24-4805-a812-a8bdad2400f8)

</div>

### 7. 인기도서

<div align="center">

![image](https://github.com/user-attachments/assets/336c359a-845c-41f1-8dcb-743eee15c43a)

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

### 5. 학생 정보 조회
<div align="center">
  
![image](https://github.com/user-attachments/assets/950e9222-9834-4910-97f3-8dfec73770d6)

</div>

### 6. 도서 등록, 수정

![image](https://github.com/user-attachments/assets/71d5b80a-35d8-4bec-ac7b-972383c3913f)

![image](https://github.com/user-attachments/assets/e12b070e-b1e9-4607-ba55-c435290f5da0)


### 7. 도서 기증 / 희망 신청 현황
<div align="center">

![image](https://github.com/user-attachments/assets/3cc51bbd-7678-4115-9bf8-2baab24b9330)

![image](https://github.com/user-attachments/assets/0dbd8458-7756-4697-b221-e329a7d3062f)

</div></details>


## 작업 테이블
* 개발 분담을 위해서 노션에서 담당 작업과 마감일 등을 설정하여 사용 했습니다.
* [PDF파일 보기](https://github.com/lsngmin/library/tree/0d9365230e0d8c83f75e0181ac47080100e436b9/library-project-worktable)

* LEE : VIEW(관리자 대시보드, 관리자 로그인, 비밀번호 변경, 통합검색, 유저 로그인, 비밀번호 변경, 도서 기증, 내정보), 관리자 대여, 반납, 연체 해제, 사용자 기증 신청, 현황, 내 정보 조회, 대여 연장 기능 구현
* WON : VIEW(로그인, 내정보, 관리자 도서 등록, 수정, 정보, 관리자 기증/희망 도서 현황, 관리자 유저정보, 상세도서, 비밀번호 변경, 관심도서 목록), 관리자 도서 등록, 수정, 유저 정보, 기증/희망 현황, 사용자 희망도서 신청, 현황 , 도서 상세보기 기능 구현
* MAENG : VIEW(메인, 기증도서 신청, 이용안내, 공지사항, 희망도서 신청), 통합검색 , 공지사항 기능 구현, 인기도서 기능 구현
* PARK : VIEW(희망도서 현황 및 신청, 비밀번호 변경, 책 상세보기, 관심도서 신청, 인기도서, 상세도서)
  
<div align="center">

![image](https://github.com/user-attachments/assets/abaf44d8-c14d-462e-a1b6-de3b0171f3c3)

</div>


## TroubleShooting
### JPA 관련 설정 오류
```
org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'loginController': Unsatisfied dependency expressed through field 'userService'; nested exception is org.springframework.beans.factory.NoSuchBeanDefinitionException: No qualifying bean of type 'com.library.service.UserService' available: expected at least 1 bean which qualifies as autowire candidate. Dependency annotations: {@org.springframework.beans.factory.annotation.Autowired(required=true)}
```
SpringFramework에서 JPA 엔터티를 등록후 Repository 생성 후 컨트롤러에서 Autowired 어노테이션을 이용한 의존성 주입 과정에서 BeanCreateException 에러 발생, 모든 설정을 JAVA CLASS 파일로 구현해서 해봤지만 결과는 동일, SPRING을 사용하는 의미도 퇴색</br></br>
JPA를 고집해서 사용하고 싶었지만 개발 기간이 촉박하기 때문에 대체제인 Mybatis 프레임워크를 사용.</br></br>
MYBATIS는 SQL를 직접 제어한다는 점에서 최적하된 쿼리를 작성 가능, 자유로운 통계/분석용 쿼리를 사용할 수 있는 점은 GOOD 하지만</br>
CRUD 반복적인 작업이 들어가다 보니 팀원들이 많이 힘들어하였다, DB에 종속적이라 추후에 다른 DB로 변경하기 어렵다는 점이 아쉬움.</br>

### Build ~ Deploy 오류
```
java.lang.NoClassDefFoundError: org/apache/catalina/LifecycleException
```
coyeb 사이트에서 Git 기반 자동 빌드 및 배포하는 사이트 이용할 계획이었으나 로컬에선 아무런 문제가 없었는데 배포 과정 중에 LifecycleException에러 발생
jar 빌드 방식은 포기하고, war 방식으로 tomcat에 올려 구동 </br>
war방식은 coyeb에서 지원하지 않는 것으로 보여 AWS EC2에 환경 설정 후 빠르게 배포 성공

##  후기 및 향후 계획
    





<img src="https://capsule-render.vercel.app/api?type=waving&color=a6a6df&height=150&section=footer" />

