package voiture is
   MAX_LENGTH : constant Integer := 9;
   type CharArray is array (1..MAX_LENGTH) of Character;
   
   type Type_Voiture is record
      num : CharArray; -- Plaque d'immatriculation de la voiture
      place : Integer; -- Numéro de la place où s'est garée la voiture
      heureEntree : Integer; --Heure d'arrivée de la voiture (0h = 0; 1h = 3600)
   end record;
   
   -- Procedure qui enregistre une voiture
   procedure lire_voiture(v : out Type_Voiture);
   
   -- Procedure qui affiche les informations de la voiture
   procedure afficher_voiture(v : in Type_Voiture);
   
   -- Function vérifiant que deux voitures n'ont pas la meme plaque d'immatriculation
   -- Retourne True si ils n'ont pas la meme plaque et False s'ils ont la meme plaque
   function egalite (v1 : in Type_Voiture; v2 : in Type_Voiture) return Boolean;
   
   -- Procedure qui permet d'obtenir la plaque d'immatriculation de la voiture
   procedure obtenir_matricule(v : in Type_Voiture);
   
   -- Procédure qui permet d'obtenir le numéro de la place de la voiture
   procedure obtenir_num_place(v : in Type_Voiture; p : out Integer);
   
   -- Function qui permet de calculer le temps de stationnement d'une voiture
   -- Retourne en seconde le temps reste et -1 si les valeurs ne sont pas possibles
   function calculer_duree_stationnement(v : in Type_Voiture; heureSortie_h : in Integer ; heureSortie_m : in Integer) return Integer;
end voiture;
