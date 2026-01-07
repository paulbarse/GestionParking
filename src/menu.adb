with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.float_Text_IO; use Ada.float_Text_IO;
with voiture; use voiture;
with parking; use parking;
with actions_parking; use actions_parking;
procedure menu is
   n : integer; -- menu
   p : Type_Parking; --parking
   v: Type_Voiture; -- voiture
   t : Boolean; -- trouve
   indice : Integer;
begin
   Put_Line("******************************************************************************");
   Put_Line("**********************************   MENU   **********************************");
   Put_Line("******************************************************************************");
   Put_Line("***0  :  Remplissage du parking manuellement à partir du clavier           ***");
   Put_Line("***1  :  Affichage de la liste de voitures du parking                      ***");
   Put_Line("***2  :  Trouver une voiture dans le parking                               ***");
   Put_Line("***3  :  Ajouter une voiture dans le parking                               ***");
   Put_Line("***4  :  Ajouter une voiture dans le parking dans une position donnée      ***");
   Put_Line("***5  :  Supprimer une voiture dans le parking                             ***");
   Put_Line("***6  :  Supprimer une voiture dans le parking dans une position donnée    ***");
   Put_Line("***7  :  Calculer le nombre de places disponibles                          ***");
   Put_Line("***8  :  Obtenir la voiture avec la plus longue durée                      ***");
   Put_Line("***9  :  Obtenir la tarif pour une durée                                   ***");
   Put_Line("***10 :  Obtenir le numero de la place la plus grande                      ***");
   Put_Line("******************************************************************************");
   Put_Line("******************************************************************************");
   loop
      new_line;
      put("quelle operation effectuer ?");
      get(n);
      case n is -- quel option choisir
         when 0 =>
            remplir_parking(p => p);
         when 1 =>
            afficher_parking(p);
         when 2 =>
            lire_voiture(v);
            trouver_voiture(v, p, t, indice);
            if t then
               put("La voiture est présent à l'indice : ");
               put(indice);
            else
               put("La voiture n'est pas présent dans le parking");
            end if;
         when 3 =>
            ajouter_voiture(p);
         when 4 =>
            lire_voiture(v);
            ajouter_voiture_pos(v, 2, p);
         when 5 =>
            supprimer_voiture(p);
         when 6 =>
            supprimer_voiture_pos(p);
         when 7 =>
            put(nb_place_disponible(p));
         when 8 =>
            afficher_voiture(obtenir_voiture_plus_longue_duree(p));
         when 9 =>
            put(obtenir_tarif(calculer_duree_stationnement(v,20,20)));
         when 10 =>
            afficher_voiture(obtenir_voiture_plus_longue_duree(p));
         when others =>
            put("shutdown");
            exit;
      end case;
   end loop;
end menu;
