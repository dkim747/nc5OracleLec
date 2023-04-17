--10. 사이값을 찾아주는 BETWWEN AND 절
--급여가 3500에서 5000사이에 있는 직원목록 조회
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 3500 AND 5000;

--급여가 3500에서 5000사이에 있고 부서번호가 01~10인 직워목록 조회
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 3500 AND 5000
      AND DNO BETWEEN '01' AND '10';
    
--TO_DATE 사용해서 임용일자가 1994년 1월 1일 이후 1998년 2월 3일 이전인 교수목록 조회
SELECT *
    FROM PROFESSOR
    WHERE HIREDATE 
        BETWEEN TO_DATE('19940101 00:00:00', 'yyyyMMdd HH24:mi:ss') 
            AND TO_DATE('19980202 23:59:59', 'yyyyMMdd HH24:mi:ss')
    ORDER BY HIREDATE;

--DNO = 10, 20, 30 직원목록 조회
SELECT *
    FROM EMP
    WHERE DNO = '10'
       OR DNO = '20'
       OR DNO = '30';
--IN절로 변환
SELECT *
    FROM EMP
    WHERE DNO IN ('10', '20', '30');

--DATE 표시 형식 지정
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy/MM/dd HH24:mi:ss';

--11. 여러개의 데이터를 비교해주는 IN절
--화학과나 물리학과 학생이면서 1, 2, 3학년인 학생만 조회
SELECT *
    FROM STUDENT
    WHERE MAJOR IN ('화학', '물리')
      AND SYEAR IN (1, 2, 3);

--업무가 개발, 경영이면서 보너스가 700만원 이상인 직원 목록 조회
SELECT *
    FROM EMP
    WHERE JOB IN ('개발', '경영')
      AND COMM >= 700;

--과목의 PNO를 사용해서 PROFESSOR의 PNAME 조회
SELECT A.*
     , B.PNAME
    FROM COURSE A
    LEFT OUTER JOIN PROFESSOR B
    ON A.PNO = B.PNO;
