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

## 개발 기간
* 학부 재학중 전공 수업 3시간에서 진행한 기획부터 설계 그리고 개발까지 완료한 프로젝트 입니다.
* 2024-09-10 ~ 2024-12-03 (84일)
* 기획 1주 / 기능 요구서 2주 / 와이어 프레임 및 목업 4주 / 클래스 다이어그램 1주 / 시퀀스 다이어그램 및 개발 5주

## 빌드 및 배포
* Maven(war) 빌드, AWS LightSail(Tomcat) 배포
### [접속가능 :o:](http://bit.ly/3B1tlWk)

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
![image](https://github.com/user-attachments/assets/f73e393b-620f-4083-bdbc-19af8a8c7177)


<img src="https://capsule-render.vercel.app/api?type=waving&color=a6a6df&height=150&section=footer" />

