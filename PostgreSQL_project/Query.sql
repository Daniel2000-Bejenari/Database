--1.
--calculeaza si insereaza valoare in campul valoare din
--detalii sporuri. Se ruleaza inainte de insert. 
--Este functionabil daca se ruleaza inainte de insert. 
  
  CREATE OR REPLACE FUNCTION calculare_valoare_spor() 
RETURNS trigger AS $calculare_valoare_spor$
BEGIN
    UPDATE detalii_sporuri
        SET valoare = (SELECT (salarii) * (procent) 
                         FROM contracte natural join angajati 
					   natural join detalii_sporuri natural join sporuri
                         WHERE marca = NEW.marca)
         WHERE marca = NEW.marca;

    RETURN NEW;
END;
$calculare_valoare_spor$ LANGUAGE plpgsql;

CREATE TRIGGER points_added
  AFTER INSERT
  ON detalii_sporuri
  FOR EACH ROW
  EXECUTE PROCEDURE calculare_valoare_spor();		
  -- select * from detalii_sporuri
  
--trigger - restrictie la modificarea unui nou salariu pentru angajati
  CREATE OR REPLACE FUNCTION check_salary()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL  
  AS
$$
BEGIN
	IF (NEW.salarii - OLD.salarii) / OLD.salarii >= 1 THEN
		RAISE 'The salary increment cannot that high.';
	END IF;

	RETURN NEW;
END;
$$
 
 
CREATE TRIGGER before_update_salary
	BEFORE UPDATE
	ON contracte
	FOR EACH ROW
	EXECUTE PROCEDURE check_salary();
  
/*UPDATE contracte
SET salarii = 8400
WHERE nr_contract = 'CR001';*/

  --select * from contracte
  
  
--functia get_employee, calculeaza cati angajati vor iesi in concediu in perioada 
--(2021-07-01 - 2021-07-21)
create or replace function get_employee()
returns int
language plpgsql
as
$$
declare
   employee_count integer;
begin
   select count(*) 
   into employee_count
   from detalii_concedii
   where data_inceperii between date'2021-07-01' and date'2021-07-21';
   
   return employee_count;
end;
$$;
select get_employee();
-- select * from detalii_concedii

-- cursor - get_employee_surname, 
-- concatenarea angajatilor care au in prenume litera i si care au un salariu de 5500 lei
create or replace function get_employee_surname(salarii_p integer)
   returns text as $$
declare 
	 surname text default '';
	 rec_employee   record;
	 cur_employee cursor(salarii_p integer) 
		 for select prenume, salarii
		 from angajati natural join contracte
		 where salarii = salarii_p;
begin
   
   open cur_employee(salarii_p);
	
   loop
   
      fetch cur_employee into rec_employee;
    
      exit when not found;

    
      if rec_employee.prenume like '%i%' then 
         surname := surname || ',' || rec_employee.prenume || ':' || rec_employee.salarii;
      end if;
   end loop;
  
   
   close cur_employee;

   return surname;
end; $$

language plpgsql;

select get_employee_surname(5500);

-- select * from contracte

-- transferul sumei de 50 lei din valoarea sporului angajatului cu numarul marcii DC05
create or replace procedure transfer_p(
)
language plpgsql    
as $$
begin
    
    update detalii_sporuri 
    set valoare = valoare - 50 
    where cod_spor = 'SP005';

    
    update contracte 
    set salarii = salarii + 50 
    where marca = 'DC05';

    commit;
end;$$

call transfer_p();
--select * from contracte;
--select * from detalii_sporuri

---- calcul total ore ----

CREATE OR REPLACE FUNCTION calculare_total_ore() 
	RETURNS trigger AS $calculare_total_ore$ 
DECLARE t_ore pontaje.total_ore%TYPE ; 
	BEGIN
	SELECT ore_lucrate + ore_suplimentare - ore_invoire + ore_it INTO t_ore FROM pontaje 
	WHERE ore_lucrate = NEW.ore_lucrate AND ore_suplimentare = NEW.ore_suplimentare 
	AND ore_invoire = NEW.ore_invoire AND ore_it = NEW.ore_it limit 1; 
	NEW.total_ore := t_ore; 
		RETURN NEW; 
END; 
$calculare_total_ore$ LANGUAGE plpgsql; 

DROP TRIGGER IF EXISTS calculare_total_ore ON pontaje CASCADE; 
CREATE TRIGGER calculare_total_ore BEFORE INSERT ON pontaje 
FOR EACH ROW EXECUTE PROCEDURE calculare_total_ore(); 

INSERT INTO pontaje VALUES ('P001', date'2022-12-10', 'DC10', 'CON3', null, 100, 150, 150, 100) ; 
select * from pontaje;
  
  ----- select * from pontaje
  
  ---- calcul valoare spor ----

CREATE OR REPLACE FUNCTION calculare_valoare_spor() 
	RETURNS TRIGGER AS $calculare_valoare_spor$
DECLARE
	v_spor detalii_sporuri.valoare%TYPE;
BEGIN
    SELECT salarii * procent INTO v_spor FROM detalii_sporuri 
		inner join contracte on detalii_sporuri.marca = contracte.marca
		inner join sporuri on detalii_sporuri.cod_spor = sporuri.cod_spor
        WHERE contracte.marca = NEW.marca and sporuri.cod_spor = new.cod_spor limit 1;
		
	NEW.valoare := v_spor;
	
	RETURN NEW;
END;
$calculare_valoare_spor$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS calculare_valoare_spor ON detalii_sporuri CASCADE;
CREATE TRIGGER calculare_valoare_spor BEFORE INSERT ON detalii_sporuri
FOR EACH ROW EXECUTE PROCEDURE calculare_valoare_spor();

insert into detalii_sporuri values (date'2022-12-19', null, 'PS02', 'SP005');

select * from detalii_sporuri;


---- calcul valoare retinere ----

CREATE OR REPLACE FUNCTION calculare_valoare_retinere() 
	RETURNS TRIGGER AS $calculare_valoare_retinere$
DECLARE
	v_retinere detalii_retineri.valoare%TYPE;
BEGIN
    SELECT salarii * procent INTO v_retinere FROM detalii_retineri 
		inner join contracte on detalii_retineri.marca = contracte.marca
		inner join retineri on detalii_retineri.cod_retinere = retineri.cod_retinere
        WHERE contracte.marca = NEW.marca AND retineri.cod_retinere = NEW.cod_retinere LIMIT 1;
		
	NEW.valoare := v_retinere;
	
	RETURN NEW;
END;
$calculare_valoare_retinere$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS calculare_valoare_retinere ON detalii_retineri CASCADE;
CREATE TRIGGER calculare_valoare_retinere BEFORE INSERT ON detalii_retineri
FOR EACH ROW EXECUTE PROCEDURE calculare_valoare_retinere();

INSERT INTO detalii_retineri VALUES (date'2022-12-05', null, 'VH04', 'RE003');

SELECT * FROM detalii_retineri;

---- calcul valoare contributie ----


CREATE OR REPLACE FUNCTION calculare_valoare_contributii() 
	RETURNS TRIGGER AS $calculare_valoare_contributii$
DECLARE
	v_contributie detalii_contributii.valoare%TYPE;
BEGIN
    SELECT salarii * procent INTO v_contributie FROM detalii_contributii 
		INNER JOIN contracte ON detalii_contributii.marca = contracte.marca
		INNER JOIN contributii ON detalii_contributii.cod_contributii = contributii.cod_contributii
        WHERE contracte.marca = NEW.marca AND contributii.cod_contributii = NEW.cod_contributii LIMIT 1;
		
	NEW.valoare := v_contributie;
	
	RETURN NEW;
END;
$calculare_valoare_contributii$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS calculare_valoare_contributii ON detalii_contributii CASCADE;
CREATE TRIGGER calculare_valoare_contributii BEFORE INSERT ON detalii_contributii
FOR EACH ROW EXECUTE PROCEDURE calculare_valoare_contributii();

INSERT INTO detalii_contributii VALUES ('SS01', 'CAS', date'2022-12-05', null);

SELECT * FROM detalii_contributii;



		  --- adaug cod spor ---
		  
  CREATE OR REPLACE FUNCTION cod_bef_row()
	RETURNS TRIGGER AS $cod_bef_row$
DECLARE
	count_cod_spor sporuri.cod_spor%TYPE;
Begin
	SELECT COUNT(*) + 1 INTO count_cod_spor FROM sporuri;
	NEW.cod_spor := CONCAT('SP00', count_cod_spor);
		RETURN NEW;
END ;
$cod_bef_row$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS cod_bef_row on sporuri CASCADE;
CREATE TRIGGER cod_bef_row BEFORE INSERT ON sporuri
FOR EACH ROW Execute PROCEDURE cod_bef_row(); 
						   
--SELECT * FROM sporuri
--INSERT INTO sporuri VALUES ('e', 'Spor de smecher', 1) ;

--select * from sporuri 
--- adaug cod retinere --- 

CREATE OR REPLACE FUNCTION reti_bef_row()
	RETURNS TRIGGER AS $reti_bef_row$
DECLARE
	count_cod_retinere retineri.cod_retinere%TYPE;
Begin
	SELECT COUNT(*) + 1 INTO count_cod_retinere FROM retineri;
	NEW.cod_retinere := CONCAT('RE00', count_cod_retinere);
		RETURN NEW;
END ;
$reti_bef_row$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS reti_bef_row on retineri CASCADE;
CREATE TRIGGER reti_bef_row BEFORE INSERT ON retineri
FOR EACH ROW Execute PROCEDURE reti_bef_row(); 

--select * from retineri
--INSERT INTO retineri VALUES (1, 'Retinere de freaier', 1) ;



-- adaug cod concediu --

CREATE OR REPLACE FUNCTION con_bef_row()
	RETURNS TRIGGER AS $con_bef_row$
DECLARE
	count_cod_concedii concedii.cod_concedii%TYPE;
Begin
	SELECT COUNT(*) + 1 INTO count_cod_concedii FROM concedii;
	NEW.cod_concedii := CONCAT('CON00', count_cod_concedii);
		RETURN NEW;
END ;
$con_bef_row$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS con_bef_row on retineri CASCADE;
CREATE TRIGGER con_bef_row BEFORE INSERT ON concedii
FOR EACH ROW Execute PROCEDURE con_bef_row(); 

-- select * from concedii;
-- INSERT INTO concedii VALUES (1, 'Concediu de smecher') ;
--Andrei--


CREATE OR REPLACE FUNCTION pon_bef_row()
	RETURNS TRIGGER AS $pon_bef_row$
DECLARE
	count_cod_pontaj pontaje.cod_pontaj%TYPE;
Begin
	SELECT COUNT(*) + 1 INTO count_cod_pontaj FROM pontaje;
	NEW.cod_pontaj := CONCAT('P0', count_cod_pontaj);
		RETURN NEW;
		
END ;
$pon_bef_row$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS pon_bef_row on pontaje CASCADE;
CREATE TRIGGER pon_bef_row BEFORE INSERT ON pontaje
FOR EACH ROW Execute PROCEDURE pon_bef_row();


--select * from pontaje;
--INSERT INTO pontaje VALUES (1, date'2022-12-02', 'DC10', 'CON3', null, 173, 1, 0, 0) ;

-- adauga data de incepere --


CREATE OR REPLACE FUNCTION introducere_data_incepere_contract() 
	RETURNS TRIGGER AS $introducere_data_incepere_contract$
DECLARE
	d_incepere contracte.data_incepere%TYPE;
BEGIN
	SELECT data_contract INTO d_incepere FROM CONTRACT
	WHERE data_contract = NEW.data_contract
	
	IF NEW.data_incepe = null Then NEW.data_incepe := d_incepere;
		EXIT;	
	END IF;
	RETURN NEW;
END;
$introducere_data_incepere_contract$ LANGUAGE plpgsql;	
	
DROP TRIGGER IF EXISTS introducere_data_incepere_contract ON contracte CASCADE;
CREATE TRIGGER introducere_data_incepere_contract BEFORE INSERT ON contracte
FOR EACH ROW EXECUTE PROCEDURE introducere_data_incepere_contract();


-- adauga data de incepere a concediului --


CREATE OR REPLACE FUNCTION introducere_data_incepere_concediu() 
	RETURNS TRIGGER AS $introducere_data_incepere_concediu$
DECLARE
	d_incepere detalii_concedii.data_inceperii%TYPE;
BEGIN
	SELECT data_solicitare INTO d_incepere FROM detalii_concedii
	WHERE data_solicitare = NEW.data_solicitare
	
	IF NEW.data_inceperii = null Then NEW.data_inceperii:= d_incepere;
		EXIT;	
	END IF;
	RETURN NEW;
END;
$introducere_data_incepere_concediu$ LANGUAGE plpgsql;	
	
DROP TRIGGER IF EXISTS introducere_data_incepere_concediu ON detalii_concedii CASCADE;
CREATE TRIGGER introducere_data_incepere_concediu BEFORE INSERT ON detalii_concedii
FOR EACH ROW EXECUTE PROCEDURE introducere_data_incepere_concediu();





