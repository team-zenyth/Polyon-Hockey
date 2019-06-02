-- Elements Jeu
Fond =Image.load("gfx/jeu/Fond.png")
Bar = Image.load("gfx/jeu/pausebar.png")
Rouge = Image.load("gfx/jeu/rouge.png")
Bleu = Image.load("gfx/jeu/bleu.png") 
Vert = Image.load("gfx/jeu/vert.png") 
Jaune = Image.load("gfx/jeu/jaune.png") 
blanc = Color.new(255,255,255)
Joueur1 = { x = 0, y = 111, vit = 3, score = "0", image = Image.load("gfx/jeu/C1.png") }
Joueur2 = { x = 430, y = 111, vit = 3, score = "0", image = Image.load("gfx/jeu/C2.png") }
Balle = { x = 240 , y = 136 , vitessex = 3.5, vitessey = -3.5 , image = Image.createEmpty(4,4) }
Balle.image:clear(blanc)

-- Elements Crédits
Production = { x = 125, y = 280, texte = "Une production de la Team Zenyth" }
Projet = { x = 126, y = 320, texte = "Projet propose par Samir88Nasri" }
Codeur = { x = 155, y = 360, texte = "Code par Samir88Nasri" }
Son = { x = 158, y = 400, texte = "Son par psgaresenal" }
IA = { x = 154, y = 440, texte = "Aide IA de psgaresenal" }
Graphisme = { x = 118, y = 480, texte = "Graphisme realise par Samir88Nasri" }
Aide = { x = 118, y = 520, texte = "Avec l'aide des membres de la Team" }
Remerci = { x = 95, y = 560, texte = "Merci aux personnes qui nous soutiennent" }
Conclusion = { x = 105, y = 600, texte = "En esperant que cet beta vous plaira" }
monte = 1

 
-- Elements Menus
Fondmenu = Image.load("gfx/menu/Fondmenu.png")
selecteur = { x = 0, y = 116, c = 1, icon = "X          X"}
selecteurp = { x = 0, y = 116, c = 1, icon = "X               X"}
digital = Font.load ("digital.ttf")
digital:setPixelSizes(20, 20)
Pauseactive = false
PauseIAactive = false
status = "Menu"
niv = 0
oldpad = Controls.read()

--son
sonactive = false
System.oaenable()
son = Sound.load("sfx/son.wav",sonactive)

function Menu()
-- Affichage et curseur menu	
screen:blit(0,0,Fondmenu)
screen:fontPrint( digital,20,20,"v1.00",blanc)
screen:fontPrint( digital,208,116,"J1 vs J2",blanc)
screen:fontPrint( digital,210,136,"J1 vs IA",blanc)
screen:fontPrint( digital,210,156,"Credits",blanc)
screen:fontPrint( digital,210,176,"Quitter",blanc)
screen:fontPrint( digital,200,selecteur.y,selecteur.icon,blanc)

-- reinitialise les positions et score lors du retour au menu principale
Joueur1.x = 0
Joueur1.y = 111
Joueur1.score = "0"
Joueur2.x = 430
Joueur2.y = 111
Joueur2.score = "0"
Balle.x = 240
Balle.y = 136
Pauseactive = false

-- deplacement curseur
	if pad:up() and not oldpad:up() then
		selecteur.c = selecteur.c - 1 
	elseif pad:down() and not oldpad:down() then 
		selecteur.c = selecteur.c + 1 
	end
  
	if selecteur.c > 4 then 
		selecteur.c = 1 
	elseif selecteur.c < 1 then 
		selecteur.c = 4
	end  
  
-- position curseur
	if selecteur.c == 1 then 
		selecteur.y = 116
	elseif selecteur.c == 2 then 
		selecteur.y = 136
	elseif selecteur.c == 3 then 
		selecteur.y = 156
	elseif selecteur.c == 4 then 
		selecteur.y = 176
	end  
 
-- choix curseur
	if pad:cross() and not oldpad:cross() then
		if selecteur.c == 1 then
			status = "Jeu"
		elseif selecteur.c == 2 then 
			status = "Menuniv"
		elseif selecteur.c == 3 then 
			status = "Credits"
		elseif selecteur.c == 4 then 
			System.Quit()   -- Quitte le jeu --
		end
	end
end

function Menuniv()
-- Affichage et curseur menu	
screen:blit(0,0,Fondmenu)
screen:fontPrint( digital,214,126,"Facile",blanc)
screen:fontPrint( digital,212,146,"Normal",blanc)
screen:fontPrint( digital,212,166,"Expert",blanc)
screen:fontPrint( digital,200,selecteur.y,selecteur.icon,blanc)

-- deplacement curseur
	if pad:up() and not oldpad:up() then
		selecteur.c = selecteur.c - 1 
	elseif pad:down() and not oldpad:down() then 
		selecteur.c = selecteur.c + 1 
	end
  
	if selecteur.c > 3 then 
		selecteur.c = 1 
	elseif selecteur.c < 1 then 
		selecteur.c = 3
	end  
  
-- position curseur
	if selecteur.c == 1 then 
		selecteur.y = 126
	elseif selecteur.c == 2 then 
		selecteur.y = 146
	elseif selecteur.c == 3 then 
		selecteur.y = 166
	end  
 
	if pad:circle() then
		status = "Menu"
	end
	
-- choix curseur
	if pad:cross() and not oldpad:cross() then
		if selecteur.c == 1 then
			status = "VsIA"
			niv = 1
		elseif selecteur.c == 2 then 
			status = "VsIA"
			niv = 2
		elseif selecteur.c == 3 then 
			status = "VsIA"
			niv = 2.5
		end
	end
end

function Credit()
-- Affichage 
screen:blit(0,0,Fondmenu)
screen:fontPrint( digital, Production.x, Production.y, Production.texte, blanc) 
screen:fontPrint( digital, Projet.x, Projet.y, Projet.texte, blanc)
screen:fontPrint( digital, Codeur.x, Codeur.y, Codeur.texte, blanc) 
screen:fontPrint( digital, Son.x, Son.y, Son.texte, blanc) 
screen:fontPrint( digital, IA.x, IA.y, IA.texte, blanc)
screen:fontPrint( digital, Graphisme.x, Graphisme.y, Graphisme.texte, blanc) 
screen:fontPrint( digital, Aide.x, Aide.y, Aide.texte, blanc) 
screen:fontPrint( digital, Remerci.x, Remerci.y, Remerci.texte, blanc) 
screen:fontPrint( digital, Conclusion.x, Conclusion.y, Conclusion.texte, blanc)
 
-- Variables defilement texte 
  Production.y = Production.y - monte
  Projet.y = Projet.y - monte
  Codeur.y = Codeur.y - monte
  Son.y = Son.y - monte
  IA.y = IA.y - monte
  Graphisme.y = Graphisme.y - monte
  Aide.y = Aide.y - monte
  Remerci.y = Remerci.y - monte
  Conclusion.y = Conclusion.y - monte

  
-- Position de depart lorsque le texte est hors de l'ecran
	if Production.y < -400 then
		Production.y = 273
	elseif Projet.y < -400 then
		Projet.y = 273
	elseif Codeur.y < -400 then
		Codeur.y = 273
	elseif Graphisme.y < -400 then
		Graphisme.y = 273
	elseif Remerci.y < -400 then
		Remerci.y = 273
	elseif Conclusion.y < -400 then
		Conclusion.y = 273
	end

-- Rond pour retourner au menu
	if pad:circle() then
		status = "Menu"
	end
end

function afficherlejeu()
screen:blit(0,0,Fond)
screen:fontPrint( digital,225,35,Joueur1.score.." - "..Joueur2.score,blanc)  --Scores
Neoncoll()
screen:blit(Joueur1.x,Joueur1.y,Joueur1.image)
screen:blit(Joueur2.x,Joueur2.y,Joueur2.image)
screen:blit(Balle.x,Balle.y,Balle.image)
end

function deplacementjoueur1()
-- Joueur 1
	if pad:down() then 
		Joueur1.y = Joueur1.y + 3 
	end
	
	if pad:up() then 
		Joueur1.y = Joueur1.y -  3
	end
	
	if pad:right() then 
		Joueur1.x = Joueur1.x + 3
	end
	
	if pad:left() then 
		Joueur1.x = Joueur1.x -  3
	end


		-- Cadre de déplacement Joueur 1
		if Joueur1.y >= 250-Joueur1.image:height() then 
			Joueur1.y = 250-Joueur1.image:height() 
		elseif Joueur1.y <= 22 then 
			Joueur1.y = 22 
		end
		
		if Joueur1.x >= 240-Joueur1.image:width() then 
			Joueur1.x = 240-Joueur1.image:width() 
		elseif Joueur1.x <= 27 then 
			Joueur1.x = 27 
		end
end

function deplacementjoueur2()
-- Joueur 2
	if pad:cross() then 
		Joueur2.y = Joueur2.y + 3
	end
	
	if pad:triangle() then 
		Joueur2.y = Joueur2.y - 3
	end
	
	if pad:circle() then 
		Joueur2.x = Joueur2.x + 3
	end
	
	if pad:square() then 
		Joueur2.x = Joueur2.x - 3
	end

		-- Cadre de déplacement Joueur 2
		if Joueur2.y >= 250-Joueur2.image:height() then 
			Joueur2.y = 250-Joueur2.image:height() 
		elseif Joueur2.y <= 22 then 
			Joueur2.y = 22 
		end
		
		if Joueur2.x >= 453-Joueur2.image:width() then 
			Joueur2.x = 453-Joueur2.image:width() 
		elseif Joueur2.x <= 240 then 
			Joueur2.x = 240 
		end
		
end

function deplacementIA()
-- Joueur IA
	if Balle.x > 240 and Balle.x < Joueur2.x then
		Joueur2.x = Joueur2.x - niv
	else
		Joueur2.x = Joueur2.x + niv
	end
	
	if Balle.y < Joueur2.y then
		Joueur2.y = Joueur2.y - niv
	elseif Balle.y > Joueur2.y + Joueur2.image:height() then
		Joueur2.y = Joueur2.y + niv
	end
	
	if Balle.x > 443 and Balle.y < 32 then
		Joueur2.x = Joueur2.x - niv
		Joueur2.y = Joueur2.y + niv
	elseif Balle.x > 453 and Balle.y > 240  then
		Joueur2.x = Joueur2.x - niv
		Joueur2.y = Joueur2.y - niv
	end

		-- Cadre de déplacement Joueur IA
		if Joueur2.y >= 250-Joueur2.image:height() then 
			Joueur2.y = 250-Joueur2.image:height() 
		elseif Joueur2.y <= 22 then 
			Joueur2.y = 22 
		end
		
		if Joueur2.x >= 453-Joueur2.image:width() then 
			Joueur2.x = 453-Joueur2.image:width() 
		elseif Joueur2.x <= 240 then 
			Joueur2.x = 240 
		end
		
end

function deplacementballe()
-- Depart de la balle
Balle.x = Balle.x + Balle.vitessex
Balle.y = Balle.y + Balle.vitessey
 

-- Joueur 1
-- Colision coté droit
if Balle.x <= Joueur1.x + 30 and Balle.x >= Joueur1.x + 20 and Balle.y + Balle.image:height() >= Joueur1.y + 10 and Balle.y + Balle.image:height() <= Joueur1.y + 20 then
	Balle.x = Joueur1.x + 30
	Balle.vitessex = 3.5
	sonactive = true
-- Colision coté haut
elseif Balle.x <= Joueur1.x + 20 and Balle.x + Balle.image:width() >= Joueur1.x + 10 and Balle.y + Balle.image:height() >= Joueur1.y and Balle.y + Balle.image:height() <= Joueur1.y + 10 then
	Balle.y = Joueur1.y - 4
	Balle.vitessey = -3.5
	sonactive = true
-- Colision coté bas
elseif Balle.x <= Joueur1.x + 20 and Balle.x + Balle.image:width() >= Joueur1.x + 10 and Balle.y >= Joueur1.y + 20 and Balle.y <= Joueur1.y + 30 then
	Balle.y = Joueur1.y + 30
	Balle.vitessey = 3.5
	sonactive = true
-- Colision coté gauche
elseif Balle.x + Balle.image:width() >= Joueur1.x and Balle.x + Balle.image:width() <= Joueur1.x + 10 and Balle.y + Balle.image:height() >= Joueur1.y + 10 and Balle.y + Balle.image:height() <= Joueur1.y + 20 then
	Balle.x = Joueur1.x - 4
	Balle.vitessex = -3.5
	sonactive = true
-- Colision coté haut droit
elseif Balle.x + Balle.image:width() >= Joueur1.x + 20 and Balle.x <= Joueur1.x + 30 and Balle.y + Balle.image:height() >= Joueur1.y and Balle.y + Balle.image:height() <= Joueur1.y + 10 then
	Balle.vitessey = -3.5
	Balle.vitessex = 3.5
	sonactive = true
-- Colision coté haut gauche
elseif Balle.x + Balle.image:width() >= Joueur1.x and Balle.x <= Joueur1.x + 10 and Balle.y + Balle.image:height() >= Joueur1.y and Balle.y + Balle.image:height() <= Joueur1.y + 10 then
	Balle.vitessey = -3.5
	Balle.vitessex = -3.5
	sonactive = true
-- Colision coté bas droit
elseif Balle.x + Balle.image:width() >= Joueur1.x + 20 and Balle.x <= Joueur1.x + 30 and Balle.y + Balle.image:height() >= Joueur1.y + 20 and Balle.y + Balle.image:height() <= Joueur1.y + 30 then
	Balle.vitessey = 3.5
	Balle.vitessex = 3.5
	sonactive = true
-- Colision coté bas gauche
elseif Balle.x + Balle.image:width() >= Joueur1.x and Balle.x <= Joueur1.x + 10 and Balle.y + Balle.image:height() >= Joueur1.y + 20 and Balle.y + Balle.image:height() <= Joueur1.y + 30 then
	Balle.vitessey = 3.5
	Balle.vitessex = -3.5
	sonactive = true
-- Joueur 2
-- Colision coté droit
elseif Balle.x <= Joueur2.x + 30 and Balle.x >= Joueur2.x + 20 and Balle.y + Balle.image:height() >= Joueur2.y + 10 and Balle.y + Balle.image:height() <= Joueur2.y + 20 then
	Balle.x = Joueur2.x + 30
	Balle.vitessex = 3.5
	sonactive = true
-- Colision coté haut
elseif Balle.x <= Joueur2.x + 20 and Balle.x + Balle.image:width() >= Joueur2.x + 10 and Balle.y + Balle.image:height() >= Joueur2.y and Balle.y + Balle.image:height() <= Joueur2.y + 10 then
	Balle.y = Joueur2.y - 4
	Balle.vitessey = -3.5
	sonactive = true
-- Colision coté bas
elseif Balle.x <= Joueur2.x + 20 and Balle.x + Balle.image:width() >= Joueur2.x + 10 and Balle.y >= Joueur2.y + 20 and Balle.y <= Joueur2.y + 30 then
	Balle.y = Joueur2.y + 30
	Balle.vitessey = 3.5
	sonactive = true
-- Colision coté gauche
elseif Balle.x + Balle.image:width() >= Joueur2.x and Balle.x + Balle.image:width() <= Joueur2.x + 10 and Balle.y + Balle.image:height() >= Joueur2.y + 10 and Balle.y + Balle.image:height() <= Joueur2.y + 20 then
	Balle.x = Joueur2.x - 4
	Balle.vitessex = -3.5
	sonactive = true
-- Colision coté haut droit
elseif Balle.x + Balle.image:width() >= Joueur2.x + 20 and Balle.x <= Joueur2.x + 30 and Balle.y + Balle.image:height() >= Joueur2.y and Balle.y + Balle.image:height() <= Joueur2.y + 10 then
	Balle.vitessey = -3.5
	Balle.vitessex = 3.5
	sonactive = true
-- Colision coté haut gauche
elseif Balle.x + Balle.image:width() >= Joueur2.x and Balle.x <= Joueur2.x + 10 and Balle.y + Balle.image:height() >= Joueur2.y and Balle.y + Balle.image:height() <= Joueur2.y + 10 then
	Balle.vitessey = -3.5
	Balle.vitessex = -3.5
	sonactive = true
-- Colision coté bas droit
elseif Balle.x + Balle.image:width() >= Joueur2.x + 20 and Balle.x <= Joueur2.x + 30 and Balle.y + Balle.image:height() >= Joueur2.y + 20 and Balle.y + Balle.image:height() <= Joueur2.y + 30 then
	Balle.vitessey = 3.5
	Balle.vitessex = 3.5
	sonactive = true
-- Colision coté bas gauche
elseif Balle.x + Balle.image:width() >= Joueur2.x and Balle.x <= Joueur2.x + 10 and Balle.y + Balle.image:height() >= Joueur2.y + 20 and Balle.y + Balle.image:height() <= Joueur2.y + 30 then
	Balle.vitessey = 3.5
	Balle.vitessex = -3.5
	sonactive = true
else
	sonactive = false
end 
 
-- Cadre de déplacement balle
if Balle.y <= 22 then 
	Balle.vitessey = 3.5
	sonactive = true
elseif Balle.y + Balle.image:height() >= 250 then 
	Balle.vitessey = -3.5
	sonactive = true
elseif Balle.x <= 27 and Balle.y >= 0 and Balle.y <= 68 or Balle.x <= 27 and Balle.y >= 200 and Balle.y <= 272 then
	Balle.vitessex = 3.5
	sonactive = true
elseif Balle.x+Balle.image:width() >= 453 and Balle.y >= 0 and Balle.y <= 68 or Balle.x+Balle.image:width() >= 453 and Balle.y >= 200 and Balle.y <= 272 then
	Balle.vitessex = -3.5
	sonactive = true
elseif Balle.x <= 20 then
	Joueur2.score = Joueur2.score + 1
	Balle.x = 240
	Balle.y = 136
	Balle.vitessex = -3.5
	Balle.vitessey = -3.5
elseif Balle.x+Balle.image:width() >= 460 then
	Joueur1.score = Joueur1.score + 1
	Balle.x = 240
	Balle.y = 136
	Balle.vitessex = 3.5
	Balle.vitessey = -3.5
end
end

function Neoncoll()
-- Affichage Neon flash
	if Balle.y >= 0 and Balle.y <= 68 and Balle.x <= 32 or Balle.y <= 27 and Balle.x >= 0 and Balle.x <= 148 then
		screen:blit(10,5,Rouge)
	elseif Balle.y >= 0 and Balle.y <= 68 and Balle.x+Balle.image:width() >= 448 or Balle.y <= 27 and Balle.x >= 332 and Balle.x <= 480 then
		screen:blit(323,5,Bleu)
	elseif Balle.y >= 204 and Balle.y <= 270 and Balle.x+Balle.image:width() <= 32 or Balle.y + Balle.image:height() >= 245 and Balle.x >= 0 and Balle.x <= 148 then
		screen:blit(10,194,Jaune)
	elseif Balle.y >= 204 and Balle.y <= 272 and Balle.x+Balle.image:width() >= 448 or Balle.y + Balle.image:height() >= 245 and Balle.x >= 332 and Balle.x <= 480 then
		screen:blit(323,194,Vert)
	end	
end

function Jeu()
afficherlejeu()
deplacementjoueur1()
deplacementjoueur2()	
deplacementballe()	

	if Joueur1.score == "0" + 8 then
		status = "VictoireJ1"
	elseif Joueur2.score == "0" + 8 then
		status = "VictoireJ2"
	end
	if 	sonactive == true then
		son:play()
	end
	
	if pad:select() then
		status ="Menu"
	end
	
	if pad:start() and not oldpad:start() and Pauseactive == false then
		Pauseactive = true
	elseif Pauseactive == true then	
		status = "Pause"
	end 
end

function VsIA()
afficherlejeu()
deplacementjoueur1()
deplacementIA()	
deplacementballe()	

	if Joueur1.score == "0" + 8 then
		status = "VictoireJ1IA"
	elseif Joueur2.score == "0" + 8 then
		status = "VictoireJ2IA"
	end
	
	if 	sonactive == true then
		son:play()
	end
	
	if pad:select() then
		status ="Menu"
	end
	
	if pad:start() and not oldpad:start() and PauseIAactive == false then
		PauseIAactive = true
	elseif PauseIAactive == true then	
		status = "PauseIA"
	end 
end

function PauseIA()
afficherlejeu()
screen:blit(0,0,Bar)
screen:fontPrint( digital,211,126,"Continuer",blanc)
screen:fontPrint( digital,203,146,"Recommencer",blanc)
screen:fontPrint( digital,216,166,"Quitter",blanc)
screen:fontPrint( digital,195,selecteurp.y,selecteurp.icon,blanc)

-- deplacement curseur
	if pad:up() and not oldpad:up() then
		selecteurp.c = selecteurp.c - 1 
	elseif pad:down() and not oldpad:down() then 
		selecteurp.c = selecteurp.c + 1 
	end
  
	if selecteurp.c > 3 then 
		selecteurp.c = 1 
	elseif selecteurp.c < 1 then 
		selecteurp.c = 3
	end  
  
-- position curseur
	if selecteurp.c == 1 then 
		selecteurp.y = 126
	elseif selecteurp.c == 2 then 
		selecteurp.y = 146
	elseif selecteurp.c == 3 then 
		selecteurp.y = 166
	end  
-- choix curseur
	if pad:cross() and not oldpad:cross() and PauseIAactive == true then
		if selecteurp.c == 1 then
			PauseIAactive = false
		elseif selecteurp.c == 2 and PauseIAactive == true then
			Joueur1.x = 0
			Joueur1.y = 111
			Joueur1.score = "0"
			Joueur2.x = 430
			Joueur2.y = 111
			Joueur2.score = "0"
			Balle.x = 240
			Balle.y = 136
			PauseIAactive = false
		elseif selecteurp.c == 3 and PauseIAactive == true then 
			status = "Menu"
		end
	end
	
	if pad:start() and not oldpad:start() and PauseIAactive == true then
		PauseIAactive = false
	elseif PauseIAactive == false then
		status = "VsIA"
	end
end

function Pause()
afficherlejeu()
screen:blit(0,0,Bar)
screen:fontPrint( digital,211,126,"Continuer",blanc)
screen:fontPrint( digital,203,146,"Recommencer",blanc)
screen:fontPrint( digital,216,166,"Quitter",blanc)
screen:fontPrint( digital,195,selecteurp.y,selecteurp.icon,blanc)

-- deplacement curseur
	if pad:up() and not oldpad:up() then
		selecteurp.c = selecteurp.c - 1 
	elseif pad:down() and not oldpad:down() then 
		selecteurp.c = selecteurp.c + 1 
	end
  
	if selecteurp.c > 3 then 
		selecteurp.c = 1 
	elseif selecteurp.c < 1 then 
		selecteurp.c = 3
	end  
  
-- position curseur
	if selecteurp.c == 1 then 
		selecteurp.y = 126
	elseif selecteurp.c == 2 then 
		selecteurp.y = 146
	elseif selecteurp.c == 3 then 
		selecteurp.y = 166
	end  
-- choix curseur
	if pad:cross() and not oldpad:cross() and Pauseactive == true then
		if selecteurp.c == 1 then
			Pauseactive = false
		elseif selecteurp.c == 2 and Pauseactive == true then
			Joueur1.x = 0
			Joueur1.y = 111
			Joueur1.score = "0"
			Joueur2.x = 430
			Joueur2.y = 111
			Joueur2.score = "0"
			Balle.x = 240
			Balle.y = 136
			Pauseactive = false
		elseif selecteurp.c == 3 and Pauseactive == true then 
			status = "Menu"
		end
	end
	
	if pad:start() and not oldpad:start() and Pauseactive == true then
		Pauseactive = false
	elseif Pauseactive == false then
		status = "Jeu"
	end
end

function Victoire()
if status == "VictoireJ1" then
	afficherlejeu()
	screen:fontPrint( digital,210,130,"Bleu gagne",blanc)
	screen:fontPrint( digital,210,150,"Rouge perd",blanc)
	screen:fontPrint( digital,170,170,"Croix pour recommencer",blanc)
elseif status == "VictoireJ2" then
	afficherlejeu()
	screen:fontPrint( digital,205,130,"Rouge gagne",blanc)
	screen:fontPrint( digital,210,150,"Bleu perd",blanc)
	screen:fontPrint( digital,170,170,"Croix pour recommencer",blanc)
end	
	
if pad:cross() and status == "VictoireJ1" or pad:cross() and status == "VictoireJ2" then
			Joueur1.x = 0
			Joueur1.y = 111
			Joueur1.score = "0"
			Joueur2.x = 430
			Joueur2.y = 111
			Joueur2.score = "0"
			Balle.x = 240
			Balle.y = 136
			Balle.vitessex = 3
			Balle.vitessey = -3
			status = "Jeu"
end
end

function VictoireIA()
if status == "VictoireJ1IA" then
	afficherlejeu()
	screen:fontPrint( digital,210,130,"Bleu gagne",blanc)
	screen:fontPrint( digital,210,150,"Rouge perd",blanc)
	screen:fontPrint( digital,170,170,"Croix pour recommencer",blanc)
elseif status == "VictoireJ2IA" then
	afficherlejeu()
	screen:fontPrint( digital,205,130,"Rouge gagne",blanc)
	screen:fontPrint( digital,210,150,"Bleu perd",blanc)
	screen:fontPrint( digital,170,170,"Croix pour recommencer",blanc)
end	
	
if pad:cross() and status == "VictoireJ1IA" or pad:cross() and status == "VictoireJ2IA" then
			Joueur1.x = 0
			Joueur1.y = 111
			Joueur1.score = "0"
			Joueur2.x = 430
			Joueur2.y = 111
			Joueur2.score = "0"
			Balle.x = 240
			Balle.y = 136
			Balle.vitessex = 3
			Balle.vitessey = -3
			status = "VsIA"
end
end

while true do 
pad = Controls.read()
screen:clear()
Victoire()
VictoireIA()

if status == "Menu" then
Menu()
elseif status == "Menuniv" then 
Menuniv()
elseif  status == "Jeu" then
Jeu()
elseif status == "VsIA" then
VsIA()
elseif  status == "Credits" then
Credit()
elseif status == "Pause" then
Pause()
elseif status == "PauseIA" then
PauseIA()
end
 
oldpad = pad
screen.waitVblankStart()
screen.flip()
end
