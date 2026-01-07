with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture; use voiture;
with parking; use parking;
package body actions_parking is

   -- fonction qui calcul le nombre de place disponible dans le parking 
	function nb_place_disponible (p : in Type_Parking) return integer is
	begin
		return(NB_MAX-p.nb_voitures); -- on retourne le nombre max de place - le nombre de voitures
	end nb_place_disponible;

   -- fonction qui calcule la tarif que le parking devrait 
   -- appliquer à une durée de stationnement d
  function obtenir_tarif (d : in integer) return float is
	begin
      if d <= 3600 then  -- pour une durée inférieur à 3600 secondes le prix est de 0,16
			return(0.16);
		elsif d > 3600 and d <= 7200 then
			return(0.20);
		elsif d > 7200 and d <= 10800 then
			return(0.32);
		elsif d > 7200 and d <= 10800 then
			return(0.6);
		elsif d > 10800 then
			return(0.6);
		end if;
	end obtenir_tarif;
 
   -- procedure qui  lit les informations du parking 
   -- p de type Type Parking à partir d’un fichier filename 
   procedure lire_parking_from_file (p : in Type_Parking) is
   fichier:File_type; --fichier 
	car : Character; --caractère 
	begin
      open (fichier,in_file, "parking.txt");
      while not end_of_file( fichier ) loop -- tant que ce n'est pas la fin du fichier faire
         while not end_of_line( fichier ) loop -- tant que ce n'est la fin de la ligne faire
            get(fichier,car);
            put(car);
         end loop;
         New_Line;
         skip_line(fichier);
      end loop;
      close(fichier);
   end lire_parking_from_file;
   
   -- fonction qui retourne la voiture qui a la plus longue durée de stationnement.
   function obtenir_voiture_plus_longue_duree (p : in Type_Parking) return Type_Voiture is
      compteur : Integer; --compteur 
      maxTemps : Integer; --temps maximum
      maxTempsVoiture : Integer; -- indice de la voiture qui a le temps maximum
   begin
      compteur := 1;

      maxTemps := 999999;

      while compteur <= p.nb_voitures loop --boucle qui regarde le temps de chaque voiture 
         if maxTemps > p.voitures(compteur).heureEntree then
            maxTemps := p.voitures(compteur).heureEntree;
            maxTempsVoiture := compteur;
         end if;
         compteur := compteur + 1;
      end loop;

      return p.voitures(maxTempsVoiture);
   end obtenir_voiture_plus_longue_duree;

  -- fonction qui retourne la voiture qui a le plus grand numéro de place 
   function obtenir_plus_grand_num_place (p : in Type_Parking) return Type_Voiture is
      compteur : Integer; --compteur
      maxPlace : Integer; --la place la plus grande
      maxPlaceVoiture : Integer; --indice de la voiture qui a la plus grande place
      place : Integer; --place
   begin
      place := 0;
      maxPlace := 0;
      maxPlaceVoiture := 0;
      compteur := 1;
         while compteur <= p.nb_voitures loop --boucle qui permet de trouver la voiture qui a le plus grand numéro de place
         obtenir_num_place(p.voitures(compteur), place);
         if maxPlace <= place then
            maxPlace := place;
            maxPlaceVoiture := compteur;
         end if;
         compteur := compteur + 1;
      end loop;
      return p.voitures(maxPlaceVoiture);
   end obtenir_plus_grand_num_place;
   
end actions_parking;
