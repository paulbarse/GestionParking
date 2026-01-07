with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body voiture is
   
   procedure lire_voiture(v : out Type_Voiture) is
      heureEntree_h : Integer; -- Heure d'arrivee d'une voiture
      heureEntree_m : Integer; -- Minute d'arrivee d'une voiture
      compteur : Integer; -- compteur pour le nombre de caracteres de la plaque
   
   begin
      put("Introduire les 9 caracteres correspondant au numero d'immatricule : ");
      compteur := 1;
      while compteur <= MAX_LENGTH loop
         get(v.num(compteur));
         compteur := compteur + 1;
      end loop;
      
      New_Line;
      put("Introduire la place de parking : ");
      get(v.place);
      New_Line;
      put("Introduire l'heure d'arrivee : ");
      get(heureEntree_h);
      while heureEntree_h < 0 or heureEntree_h > 23 loop
         New_Line;
         put("La valeur saisie n'est pas valide");
         New_Line;
         put("Introduire l'heure d'arrivee : ");
         get(heureEntree_h);
      end loop;
       
      New_Line;
      put("Introduire la minute d'arrivee : ");
      get(heureEntree_m);
      while heureEntree_m < 0 or heureEntree_m > 59 loop
         New_Line;
         put("La valeur saisie n'est pas valide");
         New_Line;
         put("Introduire les minutes d'arrivee : ");
         get(heureEntree_m);
      end loop;
      
      v.heureEntree := 60*heureEntree_m + heureEntree_h * 3600;
             
      
   end lire_voiture;
   
   procedure afficher_voiture(v : in Type_Voiture) is
      compteur : Integer; -- compteur pour le nombre de caracteres de la plaque
   begin
      New_Line;
      put("###########   Information   ###########");
      New_Line;
      put("La voiture avec le numero d'immatriculation :");
      compteur := 1 ;
      while compteur <= MAX_LENGTH loop
          put(v.num(compteur));
          compteur := compteur + 1;
      end loop;
      New_Line;
      put("est stationnee a la place de parking : ");
      put(v.place);
      New_Line;
      put("et son heure d'arrivee est : ");
      put(v.heureEntree / 3600);
      put("h");
      put((v.heureEntree /60) mod 60);
      put("min");
   end afficher_voiture;
   
   function egalite (v1 : in Type_Voiture; v2 : in Type_Voiture) return Boolean is
      compteur : Integer; -- compteur pour vérifier la plaque
      egal : Integer; -- une sorte de boulean 1 = true 0 = false
   begin
      egal := 1;
      compteur := 1;
      while compteur <= MAX_LENGTH and egal = 1 loop
         if v1.num(compteur) /= v2.num(compteur) then
            egal := 0;
         end if;
         compteur := compteur + 1;
      end loop;
      return egal = 1;
   end egalite;

   procedure obtenir_matricule(v : in Type_Voiture) is
      compteur : Integer; -- compteur pour le nombre de caracteres de la plaque
   begin
      
      compteur := 1 ;
      while compteur <= MAX_LENGTH loop
          put(v.num(compteur));
          compteur := compteur + 1;
      end loop;
   end obtenir_matricule;
   
   procedure obtenir_num_place(v : in Type_Voiture; p: out Integer) is
     
   begin
      p:=v.place;
   end obtenir_num_place;
   
   function calculer_duree_stationnement(v : in Type_Voiture; heureSortie_h : in Integer ; heureSortie_m : in Integer) return Integer is
      heureSortie : Integer; -- heure de sortie d'une voiture en seconde
      heureReste : Integer; -- le temps resté sur le parking en seconde
   begin
      heureSortie := 60*heureSortie_m + heureSortie_h * 3600 ;
      
      if heureSortie < v.heureEntree then 
         heureReste := -1;
      else
         heureReste := heureSortie - v.heureEntree;
      end if;
      
      return heureReste;
   end calculer_duree_stationnement;
      
      
   
end voiture;
