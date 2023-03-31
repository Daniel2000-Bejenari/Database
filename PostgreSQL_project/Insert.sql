----- !!!!! se va rula mai intai primul trigger 
DELETE FROM contracte;
DELETE FROM detalii_concedii;
DELETE FROM concedii;
DELETE FROM detalii_contributii;
DELETE FROM detalii_retineri;
DELETE FROM detalii_sporuri;
DELETE FROM functii;
DELETE FROM pontaje;
DELETE FROM retineri;
DELETE FROM sporuri;
DELETE FROM contributii;
DELETE FROM departamente;
DELETE FROM angajati;
------------------------------------ insert angajati--------------------------------------------------------------------------------------------------------------------

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'SS01', 'Stanciu', 'Stefan', 1890502098731, 'savina_voinea28@yahoo.com', 'Strada Putul lui Zamfir 26',
0747113806 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'PS02', 'Pindaru', 'Sonia', 2970626231174, 'floare.zamfir@hotmail.com', 'Strada Nitu Vasile Str. Nitu Vasile, nr. 14, Bucuresti',
0213110179 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'GL03', 'Gherban', 'Lidia', 6030412463869, 'arsenie13@hotmail.com', 'Calea Vacaresti 391, Bucuresti', 0245207677 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'VH04', 'Voinea', 'Horia', 6011010197991, 'cipriana_costea@yahoo.com', 'Bulevardul Dacia 11, Bucuresti',
0723519035 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'DC05', 'Dragan', 'Corina', 6010905269381, 'aristita54@yahoo.com', 'Str. Dealul Biserici Nr. 67-109, Galeriile Real Berceni, Bucuresti',
0744795316 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'GC06', 'Gheorghiu', 'Cristi', 1931119176996, 'bernard_maxim@hotmail.com', 'Bulevardul Mihail Kogalniceanu 70-72, Bucuresti',
0722555235 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'RG07', 'Radu', 'Geanina', 6020610373582, 'brandusa21@yahoo.com', 'Drobeta Street 23, Bucuresti',
0261854403 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'LM08', 'Lamboiu', 'Mara', 2870124299420, 'norica.blaga24@hotmail.com', 'Strada Barbu Vacarescu 201, Bucuresti',
0723942368 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'VL09', 'Vilculescu', 'Lucia', 1950503077246, 'patru64@hotmail.com', 'Strada Fabricii 22, Bucuresti',
0214109048 );

insert into angajati (marca, nume, prenume, cnp, email, adresa, telefon)
values ( 'DC10', 'Dumitru', 'Corina', 2920119156070, 'alex66@yahoo.com', 'Str. Dealul Biserici Nr. 67-109, Galeriile Real Berceni, Bucuresti',
0243213576 );

---------------------------- insert concedii -----------------------------------
insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON001', 'Concediul de odihna' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON002', 'Concediul pentru  formare profesionala' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON003', 'Concediul fara plata' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON004', 'Concediul medical' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON005', 'Concediul medical pentru accident de munca' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON006', 'Concediul de maternitate' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON007', 'Concediul paternal' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON008', 'Concediul de creșterea copilului ' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON009', 'Concediul pentru ingrijirea copilului bolnav ' );

insert into concedii ( cod_concedii, tip_concedii )
values ( 'CON010', 'Concediul pentru carantina' );

-------------------------------------------- insert contracte --------------------------------------------------------------

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('C4Q2GUFU', 'per_determinata', 'CR001', 4000, date'2021-04-06', date'2021-04-16', date'2025-04-16', 'SS01'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('PQG9BKQ6', 'per_determinata', 'CR002', 5400, date'2021-04-06', date'2021-04-16', date'2026-04-16', 'PS02'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('U9ZX8TGZ', 'per_nedeterminata', 'CR003', 4700, date'2021-04-06', date'2021-04-16', null, 'GL03'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('CGCQV5XN', 'per_determinata', 'CR004', 5500, date'2021-04-06', date'2021-04-16', date'2028-04-16','VH04'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('TEUYFZ9X', 'per_nedeterminata', 'CR005', 3900, date'2021-04-06', date'2021-04-16', null, 'DC05'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('AQEY9J95', 'per_nedeterminata', 'CR006', 3800, date'2021-04-06', date'2021-04-16', null, 'GC06'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('5X78HEYF', 'per_nedeterminata', 'CR007', 5100, date'2021-04-06', date'2021-04-16', null, 'RG07'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('A9MKMF7T', 'per_nedeterminata', 'CR008', 3300, date'2021-04-06', date'2021-04-16', null, 'LM08'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('624KMR6U', 'per_determinata', 'CR009', 3200, date'2021-04-06', date'2021-04-16', date'2029-04-16', 'VL09'); 

insert into contracte (cod_contract, tip_contract, nr_contract, salarii, data_contract, data_incepere, data_sfarsire,
					  marca)
values ('YTTRMB8J', 'per_determinata', 'CR010', 5500, date'2021-04-06', date'2021-04-16', date'2031-04-16', 'DC10'); 

------------------ insert contributie -----------------

insert into contributii (cod_contributii, denumire, procent)
values ('CAS', 'Contributie pensie', 0.25 );

insert into contributii (cod_contributii, denumire, procent)
values ('CASS', 'Contributie sanatate', 0.10 );

insert into contributii (cod_contributii, denumire, procent)
values ('DP', 'Deducere personala', null );

insert into contributii (cod_contributii, denumire, procent)
values ('IV', 'Impozit pe venit', 0.10 );

insert into contributii (cod_contributii, denumire, procent)
values ('CAM', 'Contributie asiguratorie munca', 0.0225 );

------- insert  departamente ---------

insert into departamente (cod_departament, denumire_departament)
values ('DPF', 'dep_financiar');

insert into departamente (cod_departament, denumire_departament)
values ('DPP', 'dep_productie');

insert into departamente (cod_departament, denumire_departament)
values ('DPV', 'dep_vanzari');

insert into departamente (cod_departament, denumire_departament)
values ('DPHR', 'dep_HR');

---------- insert detalii concedii ------------
insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2021-05-01', date'2021-05-01', date'2021-04-21', 'SS01', 'CON001');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2021-05-21', date'2021-06-01', date'2021-04-21', 'PS02', 'CON002');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2021-06-11', date'2021-06-16', date'2021-04-21', 'GL03', 'CON003');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2021-07-01', date'2021-07-17', date'2021-06-21', 'VH04', 'CON004');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2021-07-21', date'2021-08-01', date'2021-07-18', 'DC05', 'CON005');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2021-09-21', date'2021-10-01', date'2021-08-21', 'GC06', 'CON006');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2021-10-23', date'2021-11-01', date'2021-10-21', 'RG07', 'CON007');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2022-05-21', date'2022-06-01', date'2022-04-21', 'LM08', 'CON008');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2022-06-21', date'2022-07-01', date'2022-05-21', 'VL09', 'CON009');

insert into detalii_concedii (data_inceperii, data_incheiere, data_solicitare, marca, cod_concedii)
values (date'2022-10-21', date'2022-11-01', date'2022-10-15', 'DC10', 'CON010');

---------------- insert detalii contributii -----------
insert into detalii_contributii (marca, cod_contributii, data)
values ('SS01', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('SS01', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('SS01', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('SS01', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('SS01', 'CAM', date'now()');
---------SS01---

insert into detalii_contributii (marca, cod_contributii, data)
values ('PS02', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('PS02', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('PS02', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('PS02', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('PS02', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('GL03', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GL03', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GL03', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GL03', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GL03', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('VH04', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VH04', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VH04', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VH04', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VH04', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('DC05', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC05', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC05', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC05', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC05', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('GC06', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GC06', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GC06', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GC06', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('GC06', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('RG07', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('RG07', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('RG07', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('RG07', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('RG07', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('LM08', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('LM08', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('LM08', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('LM08', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('LM08', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('VL09', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VL09', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VL09', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VL09', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('VL09', 'CAM', date'now()');


insert into detalii_contributii (marca, cod_contributii, data)
values ('DC10', 'CAS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC10', 'CASS', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC10', 'DP', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC10', 'IV', date'now()');

insert into detalii_contributii (marca, cod_contributii, data)
values ('DC10', 'CAM', date'now()');

------- inser retineri ----
insert into retineri (cod_retinere, denumire, procent)
values ('RE001', 'Penalitati intarziere', 0.05);

insert into retineri (cod_retinere, denumire, procent)
values ('RE002', 'Penalitati conportament inadecvat', 0.07);

insert into retineri (cod_retinere, denumire, procent)
values ('RE003', 'Penalitati nerespectarea sigurantei la locul de munca', 0.03);

insert into retineri (cod_retinere, denumire, procent)
values ('RE004', 'Penalitati abuz in serviciu', 0.1);

insert into retineri (cod_retinere, denumire, procent)
values ('RE005', 'Retineri pentru acoperirea pagubelor', 0.05);

insert into retineri (cod_retinere, denumire, procent)
values ('RE006', 'Retineri pentru acoperirea dierselor datorii fata de firma', 0.05);

insert into retineri (cod_retinere, denumire, procent)
values ('RE007', 'Retineri la sindicat', 0.01);

----------- insert detalii retineri ------- 

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'SS01', 'RE001');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'PS02', 'RE002');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'GL03', 'RE003');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'VH04', 'RE004');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'DC05', 'RE005');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'GC06', 'RE006');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'RG07', 'RE007');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'LM08', 'RE001');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'VL09', 'RE002');

insert into detalii_retineri (data, marca, cod_retinere)
values (date'now()', 'DC10', 'RE003');

----------------insert sporuri -------

insert into sporuri (cod_spor, tip_spor, procent)
values ('SP001', 'spor de noapte', 0.25);

insert into sporuri (cod_spor, tip_spor, procent)
values ('SP002', 'spor de pericol', 0.12);

insert into sporuri (cod_spor, tip_spor, procent)
values ('SP003', 'spor de rusine', 0.15);

insert into sporuri (cod_spor, tip_spor, procent)
values ('SP004', 'spor de vechime', 0.5);

insert into sporuri (cod_spor, tip_spor, procent)
values ('SP005', 'spor de munca de sarbatori', 1.00);

insert into sporuri (cod_spor, tip_spor, procent)
values ('SP006', 'spor ore suplimentare', 0.75);

insert into sporuri (cod_spor, tip_spor, procent)
values ('SP007', 'spor de handicap', 0.15);

------- insert detalii sporuri -----

insert into detalii_sporuri ( data, marca, cod_spor )
values (date'now()', 'SS01', 'SP001');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'PS02', 'SP002');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'GL03', 'SP003');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'VH04', 'SP004');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'DC05', 'SP005');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'GC06', 'SP006');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'RG07', 'SP007');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'LM08', 'SP001');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'VL09', 'SP002');

insert into detalii_sporuri (data, marca, cod_spor)
values (date'now()', 'DC10', 'SP003');

------- insert functii ----

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('EC', 'Economist', 'DPF', 'SS01');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('CO', 'Contabil', 'DPF', 'PS02');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('LC', 'Lucrator comercial', 'DPP', 'GL03');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('OP', 'Operator masina', 'DPP', 'VH04');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('MK', 'Marketer', 'DPV', 'DC05');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('AN', 'Data Analist', 'DPV', 'GC06');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('RC', 'Recruter', 'DPHR', 'RG07');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('SC', 'Secretara', 'DPHR', 'LM08');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('MG', 'Manager', 'DPP', 'VL09');

insert into functii (cod_functie, denumire_functie, cod_departament, marca)
values ('IF', 'Programator', 'DPF', 'DC10');

-------- insert pontaje -------------

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P001', date'now()', 'SS01', 'CON001', 160, 1, 0, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P002', date'now()', 'PS02', 'CON002', 160, 0, 0, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P003', date'now()', 'GL03', 'CON003', 160, 0, 4, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P004', date'now()', 'VH04', 'CON004', 160, 0, 0, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P005', date'now()', 'DC05', 'CON005', 160, 0, 0, 2 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P006', date'now()', 'GC06', 'CON006', 160, 1, 0, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P007', date'now()', 'RG07', 'CON007', 170, 0, 0, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('POO8', date'now()', 'LM08', 'CON001', 170, 1, 0, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P009', date'now()', 'VL09', 'CON002', 172, 0, 0, 0 );

insert into pontaje (cod_pontaj, data, marca, cod_concedii, ore_lucrate, ore_suplimentare,
					ore_invoire, ore_it)
values ('P010', date'now()', 'DC10', 'CON003', 173, 1, 0, 0 );
