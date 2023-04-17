--1) 평점이 3.0에서 4.0사이의 학생을 검색하라(between and)
SELECT S.*
    FROM STUDENT S
    WHERE AVR BETWEEN 3.0 AND 4.0
    ORDER BY S.SNO;
    
ALTER SESSION NLS_DATE_FORMAT = 'yyyyMMdd HH24:mi:ss';

--2) 1994년에서 1995년까지 부임한 교수의 명단을 검색하라(between and)
SELECT P.PNO
     , P.PNAME
     , P.HIREDATE
    FROM PROFESSOR P
    WHERE P.HIREDATE 
        BETWEEN TO_DATE('19940101 00:00:00', 'yyyyMMdd HH24:mi:ss')
        AND TO_DATE('19941231 23:59:59', 'yyyyMMdd HH24:mi:ss')
    ORDER BY HIREDATE;

--3) 화학과와 물리학과, 생물학과 학생을 검색하라(in)
SELECT ST.*
     FROM STUDENT ST
     WHERE MAJOR IN ('화학', '물리', '생물')
     ORDER BY SNO;


--4) 정교수와 조교수를 검색하라(in)
SELECT P.*
    FROM PROFESSOR P
    WHERE ORDERS IN ('정교수', '조교수')
    ORDER BY PNO;


--5) 학점수가 1학점, 2학점인 과목을 검색하라(in)
SELECT C.*
    FROM COURSE C
    WHERE ST_NUM IN (1, 2)
    ORDER BY CNO;


--6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라(between and)
SELECT S.*
    FROM STUDENT S
    WHERE S.SYEAR IN (1, 2)
      AND S.AVR BETWEEN 2.0 AND 3.0
    ORDER BY SNO;

--7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라(in)
SELECT S.*
    FROM STUDENT S
    WHERE MAJOR IN ('화학', '물리')
      AND SYEAR BETWEEN 1 AND 2
    ORDER BY AVR;


--8) 부임일이 1995년 이전인 정교수를 검색하라(to_date)
SELECT P.*
    FROM PROFESSOR P
    WHERE HIREDATE <= TO_DATE('19941231 00:00:00', 'yyyyMMdd HH24:mi:ss')
      AND ORDERS = '정교수'
    ORDER BY PNO;

--1) 송강 교수가 강의하는 과목을 검색한다
SELECT C.*
     , P.PNAME
    FROM COURSE C
    JOIN PROFESSOR P
      ON C.PNO = P.PNO
    WHERE P.PNAME = '송강';


--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT P.*
     , C.CNAME
    FROM PROFESSOR P
    JOIN COURSE C
    ON P.PNO = C.PNO
    WHERE C.CNAME LIKE '%화학%';
    

--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT P.*
     , C.ST_NUM
    FROM PROFESSOR P
    JOIN COURSE C
    ON P.PNO = C.PNO
    WHERE ST_NUM = 2;


--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT C.*
     , P.PNAME
     , P.SECTION
    FROM COURSE C
    JOIN PROFESSOR P
    ON C.PNO = P.PNO
    WHERE SECTION = '화학';


--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT ST.*
     , SC.RESULT
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    WHERE MAJOR = '화학'
      AND SYEAR = 1
    ORDER BY SC.SNO;

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT C.*
     , SC.SNO
     , ST.SNAME
     , SC.RESULT     
    FROM COURSE C
    JOIN SCORE SC
    ON C.CNO = SC.CNO
    JOIN STUDENT ST
    ON ST.SNO = SC.SNO
    WHERE C.CNAME = '일반화학'
    ORDER BY ST.SNO;    


--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT ST.*
     , C.CNAME
     , SC.RESULT
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    JOIN COURSE C
    ON C.CNO = SC.CNO
    WHERE ST.SYEAR = 1
      AND C.CNAME = '일반화학'
      AND ST.MAJOR = '화학';


--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT ST.*
     , SC.CNO
     , C.CNAME
     
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    JOIN COURSE C
    ON SC.CNO = C.CNO
    WHERE MAJOR = '화학'
    AND ST.SYEAR = 1
    ORDER BY ST.SNO;

--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT ST.*
     , C.CNAME
     , SC.RESULT
     , SCG.GRADE
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    JOIN COURSE C
    ON C.CNO = SC.CNO
    JOIN SCGRADE SCG
    ON SC.RESULT BETWEEN SCG.LOSCORE AND SCG.HISCORE
    WHERE C.CNAME = '유기화학'
        AND SCG.GRADE = 'F';

--1) 학생중에 동명이인을 검색한다
SELECT DISTINCT ST1.SNO
     , ST1.SNAME
     , ST2.SNAME
    FROM STUDENT ST1
    JOIN STUDENT ST2
    ON ST1.SNAME = ST2.SNAME
    WHERE ST1.SNO != ST2.SNO;

--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT P.*
     , C.CNO
     , C.CNAME
    FROM PROFESSOR P
    LEFT JOIN COURSE C
    ON P.PNO = C.PNO
    ORDER BY P.SECTION;

--3) 이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색한다
SELECT C.*
     , P.PNAME
     FROM COURSE C
     LEFT JOIN PROFESSOR P
     ON C.PNO = P.PNO
     ORDER BY ST_NUM;

--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT C.CNO
     , C.CNAME
     , P.PNAME
    FROM COURSE C
    LEFT JOIN PROFESSOR P
    ON C.PNO = P.PNO;

--2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT ST.SNO
     , ST.SNAME
     , ST.MAJOR
     , SC.RESULT
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    WHERE ST.MAJOR = '화학'
    ORDER BY SNO;
     

--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT ST.SNO
     , ST.SNAME
     , ST.SYEAR
     , C.CNO
     , C.CNAME
     , SC.RESULT
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    JOIN COURSE C
    ON C.CNO = SC.CNO
    WHERE C.CNAME = '유기화학';
    
--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT P.PNO
     , P.PNAME
     , C.CNO
     , C.CNAME
     , ST.SNO
     , ST.SNAME
     , ST.MAJOR     
    FROM STUDENT ST
    JOIN PROFESSOR P
    ON ST.MAJOR = P.SECTION
    JOIN COURSE C
    ON C.PNO = P.PNO
    WHERE ST.MAJOR = '화학';    

--5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT P.*
     , C.CNO
     , C.CNAME
    FROM PROFESSOR P
    LEFT OUTER JOIN COURSE C
    ON C.PNO = P.PNO;

--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
SELECT P.*
     , C.CNO
     , C.CNAME
    FROM PROFESSOR P
    FULL OUTER JOIN COURSE C
    ON C.PNO = P.PNO;