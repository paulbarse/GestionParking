with voiture; use voiture;

package parking is
   -- un tableau qui permet de stoker 100 voitures du type Type_Voitures
   NB_MAX : constant Integer := 100;
   type Tab_Parking is array (1..NB_MAX) of Type_Voiture;

   type Type_Parking is record
      voitures : Tab_Parking;
      nb_voitures : Integer;
   end record;
   -- procedure qui remplis les places d'un parking
   procedure remplir_parking (p : out Type_Parking);
   -- procedure qui affiche toutes les informations des voitures stationnées dans le parking 
   procedure afficher_parking(p : in Type_Parking);
   -- procedure permettant de trouver une voiture dans un parking 
   procedure trouver_voiture (v : in Type_Voiture; p : in Type_Parking; trouve : out Boolean; indice : out Integer);
   -- procedure qui permet d'insérer une voiture dans le parking 
   procedure ajouter_voiture (p : in out type_parking);
   --procedure qui vérifie si une voiture peut être insérer à une position précise et la posititionne 
   procedure ajouter_voiture_pos (v : in Type_Voiture; pos : in Integer; p : in out Type_Parking);
   --procedure qui permet de supprimer la dernière voiture ajouté dans le parking
   procedure supprimer_voiture (p : in out type_parking);
   -- procedure qui permet de supprimer une voiture précise
   procedure supprimer_voiture_pos (p : in out type_parking);
     
end parking; 
