with voiture; use voiture;
with parking; use parking;
package actions_parking is
	-- fonction qui calcul le nombre de place disponible dans le parking
   function nb_place_disponible (p : in Type_Parking)return integer;
  
   -- fonction qui calcule la tarif que le parking devrait appliquer à une durée de stationnement d
   function obtenir_tarif (d : in integer) return float;
   
   -- procedure qui  lit les informations du parking 
   -- p de type Type Parking à partir d’un fichier filename 
   procedure lire_parking_from_file (p : in Type_Parking);
   
   -- fonction qui retourne la voiture qui a la plus longue durée de stationnement.
   function obtenir_voiture_plus_longue_duree (p : in Type_Parking) return Type_Voiture;
   
   -- fonction qui retourne la voiture qui a le plus grand numéro de place
   function obtenir_plus_grand_num_place (p : in Type_Parking) return Type_Voiture;
end actions_parking;
