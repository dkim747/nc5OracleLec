--1. OUTER JOIN
CREATE TABLE BOARD(
    BOARD_NO NUMBER,
    BOARD_TITLE VARCHAR(50)
);

CREATE TABLE BOARD_FILE(
    BOARD_NO NUMBER,
    FILE_NM VARCHAR(50)
);

INSERT INTO BOARD_FILE VALUES(13, 'a');

SELECT * FROM BOARD_FILE;

SELECT A.*
     , NVL(B.FILE_NM, 'NO FILE EXIST')
    FROM BOARD A
    FULL OUTER JOIN BOARD_FILE B
    ON A.BOARD_NO = B.BOARD_NO;

--PNO를 이용해서 COURSE의 정보 출력
SELECT PROFESSOR.PNAME
     , COURSE.*
     FROM PROFESSOR
    INNER JOIN COURSE
     ON PROFESSOR.PNO = COURSE.PNO;

--2. INNER JOIN
--SCORE테이블의 모든 데이터와 추가로 STUDENT 테이블의 학생이름 조회
SELECT SC.*
     , ST.SNAME
     FROM SCORE SC
     INNER JOIN STUDENT ST
     ON SC.SNO = ST.SNO;

--모든 사원정보와 부서명 동시에 조회
--ANSI 표준
SELECT EMP.*
     , DEPT.DNAME
     FROM EMP
     INNER JOIN DEPT
     ON EMP.DNO = DEPT.DNO;

--다른 형태의 INNER JOIN
SELECT EMP.*
     , DEPT.DNAME
     FROM EMP
        , DEPT
     WHERE EMP.DNO = DEPT.DNO;

--비등가 조인
SELECT SC.*
     , GR.GRADE
    FROM SCORE SC
    INNER JOIN SCGRADE GR
    ON SC.RESULT BETWEEN GR.LOSCORE AND GR.HISCORE;

SELECT EMP.*
     , SALGRADE.GRADE
    FROM EMP
    INNER JOIN SALGRADE
    ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;

--CROSS JOIN
--조인 조건을 명시하지 않으면 의미없는 데이터가 조회된다.
SELECT A.ENO
     , A.ENAME
     , A.DNO
     , B.DNAME
    FROM EMP A
       , DEPT B;

--셀프조인
--FROM절의 테이블과 조인되는 테이블이 같을 때
--사원의 사수의 이름 조회
SELECT A.ENO
     , A.ENAME
     , A.MGR
     , B.ENO
     , B.ENAME
    FROM EMP A
    JOIN EMP B
    ON A.MGR = B.ENO;

--3.OUTER JOIN
--사원의 사수의 이름 조회 사수의 정보가 존재하지 않는 사원들도 모두 조회
--ANSI
SELECT A.ENO
     , A.ENAME
     , A.MGR
     , B.ENO
     , B.ENAME
    FROM EMP A
    LEFT OUTER JOIN EMP B
    ON A.MGR = B.ENO;

--ORACLE
SELECT A.ENO
     , A.ENAME
     , A.MGR
     , B.ENO
     , B.ENAME
    FROM EMP A
       , EMP B
    WHERE A.MGR = B.ENO(+);

--과목들의 정보를 조회, 교수의 이름과 같이 조회, 담당교수가 배정되지 않은 과목도 조회
SELECT COURSE.*
     , PROFESSOR.PNO
     , PROFESSOR.PNAME
    FROM COURSE
    LEFT OUTER JOIN PROFESSOR
    ON COURSE.PNO = PROFESSOR.PNO;

--4. 다중 조인
--사원의 모든정보 조회, 급여등급, 부서명이 같이 조회되도록
SELECT E.ENO
     , E.ENAME
     , E.MGR
     , E.SAL
     , S.GRADE
     , E.DNO
     , D.DNAME
    FROM EMP E
    JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    JOIN DEPT D
    ON E.DNO = D.DNO
    LEFT JOIN EMP M
    ON E.MGR = M.ENO;

--기말고사 성적을 조회할 건데 과목이름, 담당교수 이름까지 과목번호 순서로 출력
SELECT SC.SNO
     , S.SNAME
     , SC.CNO
     , SC.RESULT
     ,  SG.GRADE
     ,  C.CNAME
     ,  C.PNO
     ,  P.PNAME    
     FROM SCORE SC
     JOIN STUDENT S
     ON S.SNO = SC.SNO
     JOIN COURSE C
     ON SC.CNO = C.CNO
     JOIN PROFESSOR P
     ON C.PNO = P.PNO
     JOIN SCGRADE SG
     ON SC.RESULT BETWEEN SG.LOSCORE AND SG.HISCORE
     ORDER BY SNO, CNO;






