with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture; use voiture;
with parking; use parking;
with actions_parking; use actions_parking;

procedure test_actions_parking is
parking: Type_Parking;

begin
   remplir_parking(parking);

   parking.nb_voitures := 2;

   afficher_voiture(obtenir_voiture_plus_longue_duree(parking));

   afficher_voiture(obtenir_plus_grand_num_place(parking));
   
end test_actions_parking;
