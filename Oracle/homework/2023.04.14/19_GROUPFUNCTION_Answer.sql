--1) 각 학과별 학생 수를 검색하세요
SELECT MAJOR
     , COUNT(*)
    FROM STUDENT
    GROUP BY MAJOR;

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT MAJOR
     , ROUND(AVG(AVR*4.5/4), 2) AS AVR
    FROM STUDENT
    WHERE MAJOR IN ('화학', '생물')
    GROUP BY MAJOR;

--3) 부임일이 25년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT ORDERS
     , COUNT(*)
    FROM PROFESSOR
    WHERE (SYSDATE - HIREDATE) / 365 > 10
    GROUP BY ORDERS;

SELECT ORDERS ---------------------
     , COUNT(*)
    FROM PROFESSOR
    WHERE BETWEEN_MONTHS(SYSDATE, HIREDATE) / 12 >= 25
    GROUP BY ORDERS;
--4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT CNAME
     , SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%'
    GROUP BY CNAME;
    
SELECT SUM(ST_NUM)  ---------------------
    FROM COURSE
    WHERE CNAME LIKE '%화학%';

--5) 학과별 기말고사 평균을 성적순(성적 내림차순)으로 검색하세요
SELECT CNO
     , RESULT
    FROM SCORE;

SELECT MAJOR
    FROM STUDENT ST
    JOIN(
            SELECT CNO
                 , RESULT
                FROM SCORE
    )SC
    ON SC.SNO = ST.SNO;

SELECT ST.MAJOR   ----------------------
     , ROUND(AVG(SC.RESULT), 2)
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    GROUP BY ST.MAJOR
    ORDER BY AVG(SC.RESULT) DESC;

--6) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
SELECT DNO
     , JOB
     , TRUNC(AVG(SAL),2)
    FROM EMP
    WHERE DNO = 30
    GROUP BY DNO, JOB;

--7) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요(학과, 학년, 평점)
SELECT MAJOR
     , SYEAR
     , MAX(AVR)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    HAVING MAJOR = '물리';

--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT MAJOR
     , ROUND(AVG(AVR), 2)
     FROM STUDENT
     GROUP BY MAJOR
     HAVING MAJOR != '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT MAJOR
     , ROUND(AVG(AVR), 2)
     FROM STUDENT
     GROUP BY MAJOR
     HAVING MAJOR != '화학'
     AND ROUND(AVG(AVR), 2) >= 2.0;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT SC,SNO
     , ST.SNAME
     , ROUND(AVG(SC.RESULT), 2)
    FROM SCORE SC
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    GROUP BY SC.SNO, ST.SNAME
    HAVING ROUND(AVG(SC.RESULT), 2) >= 60;

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT C.PNO
     , P.PNAME
     , SUM(C.ST_NUM)
    FROM COURSE C
    JOIN PROFESSOR P
    ON C.PNO = P.PNO
    GROUP BY C.PNO, P.PNAME
    HAVING SUM(C.ST_NUM) >= 3;

--5) 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요
SELECT AVGRESULT.CNO -----------------------
     , AVGRESULT.CNAME
     , AVGRESULT.PNO
     , P.PNAME
     , AVGRESULT.RESAVG
    FROM(
            SELECT SC.CNO           -----> SUB
                 , C.CNAME
                 , C.PNO
                 , ROUND(AVG(SC.RESULT), 2) AS RESAVG
                FROM SCORE SC
                JOIN COURSE C
                ON SC.CNO = C.CNO
                GROUP BY SC.CNO, C.CNAME, C.PNO
    ) AVGRESULT
    JOIN PROFESSOR P
    ON AVGRESULT.PNO = P.PNO
    WHERE AVGRESULT.RESAVG > (
                                SELECT ROUND(AVG(SCO.RESULT), 2)
                                    FROM SCORE SCO
                                    JOIN COURSE CO
                                    ON SCO.CNO = CO.CNO
                                    AND CO.CNAME = '핵화학'
                                    GROUP BY SCO.CNO
                             );
    
    







SELECT SC.CNO           -----> SUB
     , C.CNAME
     , C.PNO
     , ROUND(AVG(SC.RESULT), 2) AS RESAVG
    FROM SCORE SC
    JOIN COURSE C
    ON SC.CNO = C.CNO
    GROUP BY SC.CNO, C.CNAME, C.PNO;
     

--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요(부서번호, 부서명, 인원수)
SELECT E.DNO
     , D.DNAME
     , COUNT(*)
    FROM EMP E
    JOIN DEPT D
    ON E.DNO = D.DNO
    GROUP BY E.DNO, D.DNAME
    HAVING COUNT(*) >= 4;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT JOB
     , ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY JOB
    HAVING ROUND(AVG(SAL), 2) >= 3000;

--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT MAJOR
     , SYEAR
     , COUNT(*)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    HAVING COUNT(*) >= 5;