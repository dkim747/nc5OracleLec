--1) 각 학생의 평점을 검색하라(별칭을 사용)
SELECT SNAME
     , AVR AS 평점
    FROM STUDENT;

--2) 각 과목의 학점수를 검색하라(별칭을 사용)
SELECT CNAME
     , ST_NUM AS 학점수
    FROM COURSE;    

--3) 각 교수의 지위를 검색하라(별칭을 사용)
SELECT PNAME
     , ORDERS AS 지위
    FROM PROFESSOR;

--4) 급여를 10%인상했을 때 연간 지급되는 급여를 검색하라(별칭을 사용)
SELECT SAL * 1.1 AS 인상급여
    FROM EMP;
   

--5) 현재 학생의 평균 평점은 4.0만점이다. 이를 4.5만점으로 환산해서 검색하라(별칭을 사용)
SELECT AVR * (4.5/4) AS 학점변환
    FROM STUDENT;

--1) '__학과인 __학생의 현재 평점은 __입니다' 형태로 학생의 정보를 출력하라
SELECT MAJOR
     , SNAME
     , AVR
    FROM STUDENT;

--2) '__과목은 __학점 과목입니다.' 형태로 과목의 정보를 출력하라
SELECT CNAME
     , ST_NUM
    FROM COURSE;

--3) '__교수는 __학과 소속입니다.' 형태로 교수의 정보를 출력하라
SELECT PNAME
     , SECTION
    FROM PROFESSOR;

--4) 학교에는 어떤 학과가 있는지 검색한다(학생 테이블 기반으로 검색한다)
SELECT DISTINCT MAJOR
    FROM STUDENT;    

--5) 학교에는 어떤 학과가 있는지 검색한다(교수 테이블 기반으로 검색한다)
SELECT DISTINCT SECTION
    FROM PROFESSOR;

--6) 교수의 지위는 어떤 것들이 있는지 검색한다
SELECT DISTINCT ORDERS
    FROM PROFESSOR;

--1) 성적순으로 학생의 이름을 검색하라
SELECT SNAME
     , AVR
    FROM STUDENT
    ORDER BY AVR ASC;

--2) 학과별 성적순으로 학생의 정보를 검색하라
SELECT *
    FROM STUDENT
    ORDER BY MAJOR, AVR;
--3) 학년별 성적순으로 학생의 정보를 검색하라
SELECT *
    FROM STUDENT
    ORDER BY SYEAR, AVR;

--4) 학과별 학년별로 학생의 정보를 성적순으로 검색하라
SELECT *
    FROM STUDENT
    ORDER BY MAJOR DESC, SYEAR, AVR ASC;

--5) 학점순으로 과목 이름을 검색하라
SELECT ST_NUM
     , CNAME
    FROM COURSE
    ORDER BY ST_NUM;

--6) 각 학과별로 교수의 정보를 검색하라
SELECT *
    FROM PROFESSOR
    ORDER BY SECTION;

--7) 지위별로 교수의 정보를 검색하라
SELECT *
    FROM PROFESSOR
    ORDER BY ORDERS;

--8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하라
SELECT *
    FROM PROFESSOR
    ORDER BY SECTION, HIREDATE ASC;

--1) 화학과 학생을 검색하라
SELECT SNAME
     , MAJOR
    FROM STUDENT
    WHERE MAJOR = '화학';

--2) 평점이 2.0 미만인 학생을 검색하라
SELECT SNAME
     , AVR
    FROM STUDENT
    WHERE AVR <= 2.0;

--3) 관우 학생의 평점을 검색하라
SELECT SNAME
     , AVR
     FROM STUDENT
     WHERE SNAME = '관우';

--4) 정교수 명단을 검색하라
SELECT PNAME
     , ORDERS
     FROM PROFESSOR
    WHERE ORDERS = '정교수';

--5) 화학과 소속 교수의 명단을 검색하라
SELECT PNAME
     , SECTION
     FROM PROFESSOR
    WHERE SECTION = '화학';

--6) 송강 교수의 정보를 검색하라
SELECT *     
     FROM PROFESSOR
    WHERE PNAME = '송강';

--7) 학년별로 화학과 학생의 성적을 검색하라
SELECT SNAME
     , SYEAR
     , AVR
     FROM STUDENT
    WHERE MAJOR = '화학';

--8) 2000년 이전에 부임한 교수의 정보를 부임일순으로 검색하라
SELECT *
    FROM PROFESSOR
    WHERE HIREDATE < TO_DATE('20000101 00:00:00', 'yyyyMMdd HH24:mi:ss') -->앞의 문자열을 뒤 형식의 데이트 타입으로 변환
    ORDER BY HIREDATE;

--9) 담당 교수가 없는 과목의 정보를 검색하라
SELECT *     
     FROM COURSE
     WHERE PNO IS NULL;

--1) 유공과와 생물과, 식영과 학생을 검색하라
SELECT SNAME
     , MAJOR
     FROM STUDENT
    WHERE MAJOR = '유공'
    OR MAJOR = '생물'
    OR MAJOR = '식영';

--2) 화학과가 아닌 학생중에 1학년 학생을 검색하라
SELECT SNAME
     , MAJOR
     , SYEAR
     FROM STUDENT
    WHERE MAJOR != '화학'
     AND SYEAR = 1;

--3) 물리학과 3학년 학생을 검색하라
SELECT SNAME
     , MAJOR
     , SYEAR
     FROM STUDENT
    WHERE MAJOR = '물리'
     AND SYEAR = 3;

--4) 평점이 2.0에서 3.0사이인 학생을 검색하라
SELECT SNAME
     , AVR
     FROM STUDENT
    WHERE AVR >= 2.0
      AND AVR <= 3.0;

--5) 교수가 지정되지 않은 과목중에 학점이 3학점인 과목을 검색하라
SELECT CNAME
     , ST_NUM
     , PNO
     FROM COURSE
    WHERE ST_NUM = 3
     AND PNO IS NULL;

--6) 화학과 관련된 과목중 평점이 2학점 이하인 과목을 검색하라
SELECT CNAME
     , ST_NUM
     FROM COURSE
    WHERE CNAME LIKE '%화학%'
    AND ST_NUM <= 2;

--7) 화학과 정교수를 검색하라
SELECT PNAME
     , ORDERS
     , SECTION
     FROM PROFESSOR
    WHERE ORDERS = '정교수'
     AND SECTION = '화학';

--8) 물리학과 학생중에 성이 사마씨인 학생을 검색하라
SELECT SNAME
     , MAJOR
     FROM STUDENT
    WHERE MAJOR = '물리'
     AND SNAME LIKE '사마%';

--9) 성과 이름이 각각 1글자인 교수를 검색하라
SELECT PNAME
     FROM PROFESSOR
    WHERE PNAME LIKE '__';



