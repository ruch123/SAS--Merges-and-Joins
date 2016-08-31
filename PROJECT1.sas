libname DATA 'C:\Users\i037805\Google Drive\Summers 2016\SAS Advanced\Data';

run; 

*A) Two tables;
PROC SQL; CREATE TABLE MERGED AS
 SELECT *
 FROM DATA.ADMIT AS A LEFT JOIN DATA.ALLEMPS AS B
 ON A.ID= B.EMPID
 ;QUIT; 

 *B) Several tables;
PROC SQL; CREATE TABLE SRD_CAT AS
 SELECT *
 FROM DATA.ADMIT AS A LEFT JOIN DATA.ALLEMPS AS B  ON A.ID= B.EMPID
				      LEFT JOIN DATA.NEWADMIT AS C ON A.ID=C.ID
				 
				      ;QUIT; 


  *C);
proc sql noprint;
   select sum(fee) format=dollar10. into :totalfee
      from sasuser.all;
quit;
%let totalfee=&totalfee;
proc means data=sasuser.all sum maxdec=0;
   class course_title;
   var fee;
   title "Grand Total for All Courses Is &totalfee";
run;


*E)
