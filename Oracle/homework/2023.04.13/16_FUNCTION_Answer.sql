--<단일 행 함수를 사용하세요>
--1) 이름이 두 글자인 학생의 이름을 검색하세요
SELECT SNAME
    FROM STUDENT
    WHERE LENGTH(SNAME) = 3;

--2) '공'씨 성을 가진 학생의 이름을 검색하세요
SELECT SNAME
    FROM STUDENT
    WHERE SUBSTR(SNAME, 1, 1) = '공';

--3) 교수의 지위를 한글자로 검색하세요(ex. 조교수 -> 조)
SELECT PNO
     , PNAME
     , ORDERS
    FROM PROFESSOR
    WHERE SUBSTR(ORDERS, 1, 1) = '조';

--4) 일반 과목을 기초 과목으로 변경해서 모든 과목을 검색하세요
--  (ex. 일반화학 -> 기초화학)
SELECT REPLACE(CNAME, '일반', '기초')
    FROM COURSE;

   
--5) 만일 입력 실수로 student테이블의 sname컬럼에 데이터가 입력될 때
--   문자열 마지막에 공백이 추가되었다면 검색할 때 이를 제외하고
--   검색하는 SELECT 문을 작성하세요
SELECT TRIM(SNAME)
    FROM STUDENT;

--<단일 행 함수를 이용하세요>
--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
SELECT LAST_DAY(HIREDATE) - HIREDATE
    FROM PROFESSOR;

--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT TRUNC ((SYSDATE - HIREDATE) / 7)
    FROM PROFESSOR;
  

--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT P.PNO
     , P.PNAME
     , P.HIREDATE
    FROM PROFESSOR P
    WHERE P.HIREDATE 
        BETWEEN TO_DATE('19940101 00:00:00', 'yyyyMMdd HH24:mi:ss')
        AND TO_DATE('19951231 23:59:59', 'yyyyMMdd HH24:mi:ss');

--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT SNO
     , SNAME
     , TRUNC((AVR*(4.5/4)), 2)
    FROM STUDENT;
    

--5) 사원들의 오늘까지 근무 기간이 몇 년 몇 개월 며칠인지 검색하세요
SELECT  TRUNC((SYSDATE - HDATE) / 365) || '년'|| 
FLOOR((MOD((SYSDATE - HDATE), 365)) / 30) || '개월' ||
CEIL(MOD((MOD((SYSDATE - HDATE), 365)), 30)) || '일'
    
    FROM EMP;

  

--1) 학생의 평균 평점을 다음 형식에 따라 소수점 이하 2자리까지 검색하세요
--'OOO 학생의 평균 평점은 O.OO입니다.'
SELECT SNAME || '학생의 평균 평점은' || TO_CHAR(AVR, 'FM9990.99') || '입니다.'      
    FROM STUDENT;


--2) 교수의 부임일을 다음 형식으로 표현하세요
--'OOO 교수의 부임일은 YYYY년 MM월 DD일입니다.'
SELECT PNAME || '교수의 부임일은 ' || TO_CHAR(HIREDATE, 'YYYY') || '년' || TO_CHAR(HIREDATE, 'MM') 
|| '월' || TO_CHAR(HIREDATE, 'DD') || '일 입니다.'
    FROM PROFESSOR;

SELECT PANAME || TO_CHAR(HIREDATE, '"교수의 부임일은 "YYYY"년 "MM"월 "DD"일 입니다."')
    FROM PROFESSOR;

--3) 교수중에 3월에 부임한 교수의 명단을 검색하세요
SELECT PNAME
    FROM PROFESSOR
    WHERE SUBSTR(TRUNC(HIREDATE, 'MM'), 5, 2) = 3;

SELECT PNO
     , PNAME
     , HIREDATE
    FROM PROFESSOR
    WHERE TO_CHAR(HIREDATE, 'MM') = '03';
    

   