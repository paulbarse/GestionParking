with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture; use voiture;
with parking; use parking;

procedure Main is

   parking : Type_Parking;
   voiture : Type_Voiture;
   t : Boolean;
   indice : Integer;
begin

   remplir_parking(p => parking);
   afficher_parking(parking);

   lire_voiture(voiture);
        trouver_voiture(voiture, parking, t, indice);
   if t then
      put("La voiture est présent à l'indice : ");
      put(indice);
   else
      put("La voiture n'est pas présent dans le parking");
   end if;

   lire_voiture(voiture);
   ajouter_voiture_pos(voiture, 2, parking);

   lire_parking_from_file(parking);
   afficher_parking(parking);
end Main;
