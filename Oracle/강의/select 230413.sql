--1. 서브쿼리
--1-1. 단일 행 쿼리
SELECT *
    FROM PROFESSOR
    WHERE PNAME = '송강';

--단일 행 서브쿼리
--송강 교수보다 부임일시가 빠른 교수들의 목록 조회
SELECT P.*
    FROM PROFESSOR P
    WHERE P.HIREDATE < (
                            SELECT HIREDATE
                                FROM PROFESSOR
                                WHERE PNAME = '송강'
                        );

--손하늘 사원보다 급여가 높은 사원목록 조회
SELECT E.*
    FROM EMP E
    WHERE E.SAL > (
                        SELECT SAL
                            FROM EMP
                            WHERE ENAME = '손하늘'
                   );

--서브쿼리에 *넣으려면? JOIN절에 넣어라
SELECT E.*
    FROM EMP E
    JOIN (
              SELECT *
                  FROM EMP 
                  WHERE ENAME = '손하늘'                              
         ) B
    ON E.SAL > B.SAL;

--1.2 다중 행 서브쿼리
--노육학생의 정보
SELECT *
    FROM STUDENT
    WHERE SNAME = '노육';

--노육이라는 학생과 학점이 같은 학생들
SELECT ST.*
    FROM STUDENT ST
    WHERE ST.AVR IN (
                        SELECT S.AVR
                            FROM STUDENT S
                            WHERE S.SNAME = '노육'
                    );



SELECT ST.*
    FROM STUDENT ST
    JOIN (
                    SELECT AVR
                        FROM STUDENT
                        WHERE SNAME = '노육'
                 ) B
    ON ST.AVR = B.AVR;

--기말고사 성적이 95점 이상인 학번, 과목번호, 과목명, 성적 => 서브쿼리
--학생테이블이랑 조인해서 학번, 학생이름, 과목번호, 과목명, 성적, 전공
SELECT B.SNO
     , ST.SNAME
     , B.CNO
     , B.CNAME
     , B.RESULT
     , ST.MAJOR
    FROM (
            SELECT SC.SNO
                 , SC.CNO
                 , C.CNAME
                 ,SC.RESULT
                FROM SCORE SC
                JOIN COURSE C
                ON SC.CNO = C.CNO
                AND RESULT >= 95
     ) B
    JOIN STUDENT ST
    ON B.SNO = ST.SNO;



SELECT SC.SNO     --->서브쿼리
     , SC.CNO
     , C.CNAME
     ,SC.RESULT
     FROM SCORE SC
     JOIN COURSE C
     ON SC.CNO = C.CNO
     AND RESULT >= 95;

--SCORE, SCGRADE, STUDENT => 하나의 서브쿼리
--COURSE, PROFESSOR => SUB(담당교수 업는 과목도 조회)

--서브 두개 조인해서 결과
--담당교수가 없는 과목도 나올수 있도록
--과목이름, 담당교수 이름, 학생이름, 점수등급, 과목번호 순서로 조회

SELECT ST.SNO
     , ST.SNAME
     , SC.CNO
     , SC.RESULT
     , SCG.GRADE
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    JOIN SCGRADE SCG
    ON SC.RESULT BETWEEN SCG.LOSCORE AND SCG.HISCORE;
    
SELECT P.PNO
     , P.PNAME
     , C.CNO
     , C.CNAME
    FROM COURSE C
    LEFT JOIN PROFESSOR P
    ON P.PNO = C.PNO;

SELECT A.SNO
     , A.SNAME
     , B.CNO
     , B.CNAME
     , B.PNO
     , B.PNAME
     , A.RESULT
     , A.GRADE
    FROM (
        SELECT ST.SNO
             , ST.SNAME
             , SC.CNO
             , SC.RESULT
             , SCG.GRADE
            FROM STUDENT ST
            JOIN SCORE SC
            ON ST.SNO = SC.SNO
            JOIN SCGRADE SCG
            ON SC.RESULT BETWEEN SCG.LOSCORE AND SCG.HISCORE
        ) A
    RIGHT JOIN (
            SELECT P.PNO
                 , P.PNAME
                 , C.CNO
                 , C.CNAME
                FROM COURSE C
                LEFT JOIN PROFESSOR P
                ON P.PNO = C.PNO
         ) B
        ON A.CNO = B.CNO
        ORDER BY B.CNO;

--2. 집합연산자
--2-1. 합집합 연산자
--2000년 이후에 임용된 교수와 2000년 이후에 입사한 직원의 목록조회
SELECT PNO AS 직원번호
     , PNAME AS 직원이름
     , HIREDATE AS 입사일시
    FROM PROFESSOR
    WHERE HIREDATE > TO_DATE('19991231 23:59:59', 'yyyyMMdd HH24:mi:ss')
UNION
SELECT ENO
     , ENAME
     , HDATE
    FROM EMP
    WHERE HDATE > TO_DATE('19991231 23:59:59', 'yyyyMMdd HH24:mi:ss');

--2-2. 차집합 연산자
--성이 제갈이면서 지원업무를 하지 않는 사원의 사원번호, 사원이름, 업무 조회
SELECT ENO
     , ENAME
     , JOB
    FROM EMP
    WHERE ENAME LIKE '제갈%'
MINUS
SELECT ENO
     , ENAME
     , JOB
    FROM EMP
    WHERE JOB = '지원';

--과목중에서 담당교수가 배정이 안됐거나 담당교수의 정보가 존재하지 않는 과목번호, 과목명 조회
SELECT C.CNO
     , C.CNAME
    FROM COURSE C
MINUS
SELECT C.CNO
     , C.CNAME
    FROM COURSE C
    JOIN PROFESSOR P
    ON C.PNO = P.PNO;

--화학과 교수중에 일반화학 수업 하지 않는 교수들만 조회
SELECT P.PNO
     , P.PNAME
    FROM PROFESSOR P
    WHERE SECTION = '화학'
MINUS
SELECT P.PNO
     , P.PNAME
    FROM PROFESSOR P
    JOIN COURSE C
    ON P.PNO = C.PNO
    WHERE C.CNAME = '일반화학';

SELECT P.PNO
     , P.PNAME
     , C.CNO
     , C.CNAME
    FROM PROFESSOR P
    JOIN COURSE C
    ON P.PNO = C.PNO
    AND P.SECTION = '화학'
    AND C.CNAME != '일반화학';

--2-3. 교집합 연산자
--물리, 화학과 학생 중 학점이 3.0 이상인 학생의 학번, 학생이름, 학과, 평점 조회
SELECT SNO
     , SNAME
     , MAJOR
     , AVR
    FROM STUDENT
    WHERE MAJOR IN ('물리', '화학')
INTERSECT
SELECT SNO
     , SNAME
     , MAJOR
     , AVR
    FROM STUDENT
    WHERE AVR >= 3.0;


    
     




    

