proc sql print outobs=3;
	select * from sashelp.qtr1001;
	select * from sashelp.qtr111;
quit;
	select * from sashelp.rent;
run;

proc sql print outobs=3;
	select * from sashelp.retail;
	select * from sashelp.steel;
run;
	select * from sashelp.stocks;
run;

proc sql print outobs=3;
	select * from stpsamp.stpeuro;
	select * from stpsamp.stpsale;
	select * from stpsamp.stpbgt;
	select * from stpsamp.odsstyle;
quit;