with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture; use voiture;

package body parking is
  -- procedure pour remplir le parking 
   procedure remplir_parking(p : out Type_Parking) is
      compteur : Integer; -- compteur pour ajouter des voitures 
      reponse : Character; -- savoir si on veut continuer à mettre des voitures 
      v : Type_Voiture; -- indice voiture 
  
   begin
      reponse := 'o';
      compteur := 1;
      while compteur <= NB_MAX and reponse = 'o' loop -- boucle servant à rentrer les voitures dans le parking
         lire_voiture(v);
         p.voitures(compteur) := v;
         compteur := compteur + 1;
         put("Voulez-vous continuer ? ");
         get(reponse);
      end loop;
      p.nb_voitures := compteur - 1;
   end remplir_parking;
  
   -- procedure qui affiche toutes les informations des voitures stationnées dans le parking 
   procedure afficher_parking(p : in Type_Parking) is

      compteur : Integer; --compteur de voiture
      compteurPlaque : Integer; --compteur de plaque d'immatriculation 

   begin
         compteur := 1;
      while compteur <= p.nb_voitures loop -- boucle servant à afficher les informations 
         New_Line;
            put("##########################################");
            New_Line;
            put("##           INFORMATION                ##");
            New_Line;
            put("##########################################");
            New_Line;
            put("La voiture avec le numero d'immatriculation :");
            compteurPlaque := 1;
            while compteurPlaque <= 9 loop
               put(p.voitures(compteur).num(compteurPlaque));
               compteurPlaque := compteurPlaque + 1;
            end loop;
            New_Line;
            put("est stationne sur la place :");
            put(p.voitures(compteur).place);
            New_Line;
            put("et son heure d'arrivee :");
            put(p.voitures(compteur).heureEntree / 3600); --minutes
            put('h');
            put((p.voitures(compteur).heureEntree / 60) mod 60); --secondes
            compteur := compteur + 1;
      end loop;
   end afficher_parking;
   
   --procedure permettant de trouver une voiture sur un parking 
   procedure trouver_voiture (v : in Type_Voiture; p : in Type_Parking; trouve : out Boolean; indice : out Integer) is
      compteur : Integer; --compteur pour faire passer les voitures une par une 
   begin
      trouve := False;
      compteur := 1;
      while compteur <= p.nb_voitures and trouve = False loop --savoir si la voiture est déjà dans le parking 
         if egalite(v, p.voitures(compteur)) then --savoir si les voitures sont les mêmes
             trouve := True;
         end if;

         compteur := compteur + 1;
      end loop;

      if trouve then -- voiture trouvée
         indice := compteur - 1;
      end if;
   end trouver_voiture;

    
   --procedure pour ajouter une voiture dans le parking 
   procedure ajouter_voiture (p : in out type_parking) is
   begin
      lire_voiture(p.voitures(P.nb_voitures+1));
      p.nb_voitures:= p.nb_voitures +1; 
   end ajouter_voiture;
   
   --procedure qui vérifie si une voiture peut être insérer à une position précise et la posititionne 
   procedure ajouter_voiture_pos (v : in Type_Voiture; pos : in Integer; p : in out Type_Parking) is
      compteur : Integer; --compteur de voiture 
      begin

         if pos <= NB_MAX then
            compteur := p.nb_voitures;
            while compteur >= pos loop -- on se déplace jusqu'à trouver la position donnée
               p.voitures(compteur + 1) := p.voitures(compteur);
               compteur := compteur - 1;
            end loop;
         p.voitures(pos) := v;
         p.nb_voitures := p.nb_voitures + 1;
         else
            put("Ce n'est pas possible");
         end if;
      end ajouter_voiture_pos;
   
   --procedure qui permet de supprimer la dernière voiture ajouté dans le parking
   procedure supprimer_voiture (p : in out type_parking) is
   begin
      if P.nb_voitures /=0 then --vérifie s'il y a des voitures dans le parking et pouvoir la supprimer 
         P.nb_voitures:=P.nb_voitures-1;
      end if;
   end supprimer_voiture;
   
   -- procedure qui permet de supprimer une voiture précise 
   procedure supprimer_voiture_pos (p : in out type_parking) is
      pos : Integer ; -- position de voiture
   begin
      put("supprimer la voture a quelle position ?");
      loop
         get(pos);
         if pos < P.nb_voitures then 
            while pos /= P.nb_voitures loop -- continuer jusqu'à trouver la position donnée
               p.voitures(pos):=p.voitures(pos+1);
               pos := pos + 1;
            end loop;
         elsif pos = P.nb_voitures then
            P.nb_voitures:=P.nb_voitures-1;
         else
            put("la voiture n'existe pas");
         end if;
         exit when pos <= P.nb_voitures; 
         end loop;
      end supprimer_voiture_pos;
end parking;
