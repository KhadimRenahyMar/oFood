-- Deploy ofood:2.add.seeding to pg

BEGIN;

INSERT INTO public.users(
	id, email, password)
	VALUES (1, 'test1','$2b$10$6AnJf3.f8bYM7Gb8LkFqXOkZWgYdyPeW6hCYSAx19Ima6NOEVW.bu'),
	(2, 'test2','$2b$10$HicdyKNGWKlmlqf2dA2T4.97y187P2EkGuW2j0gCu/nbuuetus31i');


INSERT INTO public.recipes(
	id, name, photo_link, meal_time, max_imc, type, steps_desc, ingredient_desc, "createdAt", "updatedAt")
	VALUES  (0, 'Bircher soja aux fruits rouges', 'imgRecette_0', 5, 35, 0, '<ol><li>Placer les flocons d’avoine dans un bol puis verser le lait de soja.</li><li>Laver puis découper les fraises en morceaux et déguster frais</li></ol>', '<ul><li>250 g de flocons d/avoine</li><li>50 g de fraise</li><li>1 yaourt au soja</li><li>25 g de myrtille</li><li>20 cl de lait de soja</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(1, 'Pâte à tartiner chocolat noisette', 'imgRecette_1', 4, 25, 0, '<ol><li>Thermomix : Mettre le sucre dans le bol et les noisettes décortiquées et mixer 15sec vitesse 9.</li><li>Ajouter le chocolat et mixer 15sec vitesse 9</li><li>Verser le lait et ajouter le beurre, faire fondre 3min/50°C/vitesse 2, ensuite mixer 5sec/vitesse 9.</li><li> Verser la préparation dans un bocal en verre et placer le au réfrigérateur environ 2h. Déguster froid accompagné de crêpes par exemple !</li></ol>', '<ul><li>60g de tablette de chocolat noir</li><li>100g de lait demi-écrémé</li><li>70g de beurre doux</li><li>90g de noisettes décortiquées</li><li>90g de sucre blanc</li></ul>','2022-04-01 08:00:00', '2022-04-01 18:01:00'), --1 ptidej
			(2, 'Porridge à la banane', 'imgRecette_2', 10, 35, 0, '<ol><li>Dans une casserole, mettre les flocons d/avoine, le sucre et le lait (de votre choix). Fouetter doucement pour que ça n/adhère pas dans le fond.</li><li>Quand la texture est épaisse, retirer du feu et déposer le mélange dans un bol.</li><li>Découper des rondelles de banane, ajouter une cuillère du beurre de cacahuète et recouvrer le tout avec des noisettes concassées.</li></ol>', '<ul><li>1 cs de crunchy peanut butter</li><li>1 cs sucre daddy</li><li>4 cs flocons d/avoines</li><li>150g de lait demi écrémé</li><li>100g de bananes</li><li>10g de noisette</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(3, 'Biscottes à la pâte à tartiner aux noisettes', 'imgRecette_3', 5, 25, 0, '<ol><li>Sur vos biscottes, étaler de la pâte à tartiner et disposer vos noisettes</li></ol>','<ul><li>3 biscottes</li><li>3 cc pâte à tartiner</li><li>15g de noisette</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(4, 'Pancakes faciles et rapides pour le petit déjeuner', 'imgRecette_4', 15, 35, 0, '<ol><li>Verser dans un saladier l/oeuf et le sucre, puis mélanger le tout.</li><li>Après avoir fait fondre le beurre, l/ajouter dans le saladier, puis tout en mélangeant, ajouter la levure, la farine et le lait tout en délayant progressivement afin d/éviter de créer des grumeaux.</li><li>Après avoir fait chauffer votre poêle, déposer des petites louches de pâte afin de créer vos pancakes.</li><li>Lors de l/apparition de petites bulles, retourner le pancakes.</li><li>Servir tiède ou froid en fonction des goûts, avec de la confiture, du sucre ou quelques fruits.</li></ol>','<ul><li>75g farine de blé bio</li><li>0.50 cs sucre en poudre</li><li>100ml de lait de montagne</li><li>5g beurre allégé</li><li>0.50 oeufs </li><li>0.50 cc levure</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(5, 'Pancakes maison', 'imgRecette_5', 15, 30, 0, '<ol><li>Mélanger la farine le sucre et la levure.</li><li>Ajouter le lait, le beurre fondu et les 3 œufs. Fouetter énergiquement.</li><li>Dans une poêle chaude, déposer un peu de beurre et un tas de pâte. Retourner le pancake dès qu/il commence à crépiter.</li><li>Cette recette vous fera environ 13-15 pancakes à déguster au petit déjeuner avec du caramel au beurre salé/pate à tartiner ou des fruits</li></ol>', '<ul><li>62.50g farine semi complète</li><li>1 oeuf</li><li>0.50 cs sucre blond pure canne</li><li>12.50g beurre demi-sel</li><li>6.25cl lait 1/2 écrémé</li><li>0.25cc levure</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'), --5
			(6, 'Beurre de kaki paleo', 'imgRecette_6', 25, 30, 0, '<ol><li>Épluchez et équeutez les kakis</li><li>Dans une casserole moyenne à feu moyen-doux, cuire les kakis avec le reste des ingrédients jusqu’à ce qu’ils soient tendres, environ 30 minutes. Remuez de temps en temps pour vous assurer que le fond ne brûle pas</li><li>Versez le tout dans un mixeur ou un robot culinaire. Mélanger jusqu’à consistance lisse comme du beurre</li></ol>', '<ul><li>6 kakis mûrs</li><li>60mL de jus de pomme</li><li>1 bâton de cannelle</li><li>1 càc de vanille</li><li>Une pincée de sel</li><li>1 càc de jus de citron</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(7, 'Smoothie bowl vitaminé kiwi', 'imgRecette_7', 5, 35, 0, '<ol><li>Éplucher le kiwi, la banane et la mangue puis rincer les feuilles d/épinards à l/eau froide.</li><li>Dans un Blender ou un petit mixeur, déposer le tout avec les flocons d/avoine et le jus de citron. Mixer jusqu/à l/obtention d/une cosistance homogène.</li><<li>Verser le tout dans un bol et dresser avec des morceaux de fruits, de graines au choix ou encore de muesli...puis déguster !</li><</ol>', '<ul><li>1 kiwi</li><li>1 banane</li><li>100g de mangue</li><li>1 poignée d/épinards frais</li><li>30g de flocons ou son d/avoine</li><li>1/2 jus de citron</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(8, 'Muffins noisette coeur chocolat', 'imgRecette_8', 25, 25, 0, '<ol><li>Préchauffer le four à 180° (chaleur traditionelle).</li><li>Dans un saladier, mélanger les oeufs, le lait, la purée de noisette et le sirop d/agave à l/aide d/un fouet.</li><li>Ajouter ensuite la farine, la levure chimique et la pincée de sel. Mélanger jusqu/à l/obtention d/une pâte bien lisse.</li><li>Verser la pâte aux 3/4 des moules à muffins. Insérer un ou deux carré(s) de chocolat au centre de chaque muffins, puis pousser délicatement le chocolat pour le recouvrir légèrement de pâte.</li><li>Parsemer les muffins avec les pépites de chocolat et enfourner pendant 20 à 25 minutes !</li><li>Enfourner pendant 20 minutes. A la fin de la cuisson, bien laisser tiédir avant de démouler. </li><li>Pendant que les muffins cuisent, faire fondre un peu de chocolat noir dans un bol. Une fois les muffins cuits et bien refroidis, recouvrir leur surface avec un peu de chocolat fondu et de noisettes concassées !</li></ol>', '<ul><li>2 oeufs</li><li>100g de lait</li><li>100g purée de noisette</li><li>30g de sirop d/agave</li><li>110g de farine de blé au choix</li><li>1/2 sachet de levure chimique</li><li>1 pincée de sel</li><li>80g de chocolat noir</li><li>une poignée de noisettes concassées</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(9, 'Porridge spéculoos sans whey', 'imgRecette_9', 5, 30, 0, '<ol><li>Commencer à préparer au moins 6 heures plus tôt ou la veille : réduire les spéculoos en poudre.</li><li>Dans une verrine, ajouter les flocons d/avoine, les graines de chia, les spéculoos en poudre, la cannelle, le miel, le skyr et enfin le lait demi-écrémé.</li><li>Mélanger le tout afin que les flocons d/avoine soient bien imbibés du liquide.</li><li> </li></ol>', '<ul><li>2 spéculoos</li><li>40g de flocons d’avoine (fins de préférence)</li><li>100g de skyr nature (ou fromage blanc 0% ou yaourt grec 0%)</li><li>100ml de lait demi-écrémé</li><li>5g de miel (ou sirop d’érable ou sirop de coco)</li><li>5g de graines de chia</li><li>De la cannelle en poudre</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			
			(10, 'Omelette aux pommes de terre et jambon', 'imgRecette_10', 15, 25, 2,'<ol><li>Éplucher, couper en morceaux vos pommes de terre et les faire revenir à lhuile dolive. Saler et poivrer.</li><li>Casser et battre vos œufs, verser la préparation sur les pommes de terres cuites et déposer des morceaux de jambons sec. Laisser cuire à feu doux avec un couvercle.</li></ol>', '<ul><li> </li></ul>','2022-04-01 08:00:00', '2022-04-01 18:01:00'), --10 dej
			(11, 'Rillettes de thon et chorizo', 'imgRecette_11', 10, 25, 2, '<ol><li>Couper en rondelles le chorizo puis le hacher. Égoutter le thon.</li><li>Dans un récipient, mélanger le chorizo, le thon et la crème fraîche (vous pouvez mettre du fromage frais à la place).</li><li>Verser la préparation dans un ramequin et servez lors d''un apéritif ou sur des tartines de pains chauds.</li></ol>', '<ul><li>70g de thon entier naturel</li><li>2 cuillère à soupe de crème faîche épaisse légère 15%mg</li><li>10 tranches de chorizo fort supérieur pur porc</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(12, 'Couronne aux légumes d''été', 'imgRecette_12', 25, 30, 2, '<ol><li>Dérouler la pâte feuilletée sur une plaque allant au four. Au centre de la pâte, découper 10 parts égales en veillant à laisser une bande de pâte d''environ 10 cm de largeur tout autour.</li><li>Mélanger la ricotta avec le basilic ciselé, puis l''étaler sur la bande.</li><li>Disposer des tranches fines de courgette ainsi que des moitiés de tomates cerises. Mettre le restant de feuilles de basilics autour de la pâte.</li><li>Rabattre les pointes de pâte de chaque part vers l''extérieur afin de former le centre de la couronne. A l''aide d''un pinceau, dorer les pointes avec le jaune d''oeuf.</li><li>Enfourner 15 minutes à 210°C. Servir chaud ou froid lord d''un apéro à partager.</li></ol>', '<ul><li>100g de Ricotta 11% mat. gr.</li><li>235g de pâte feuilletée</li><li>8 feuilles de basilic frais</li><li>200g de courgette, pulpe et peau, crue</li><li>8 tomates cerise</li><li>1 oeufs jaune</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(13, 'Spaghetti aux champignons et à la crème', 'imgRecette_13', 25, 25, 2, '<ol><li>Dans une casserole d''eau bouillante, faire cuire les spaghetti pendant environ 8 minutes.</li><li>Dans une poêle, faire dégorger les champignons, puis y ajouter la crème fraiche, le sel et le poivre. Remuer environ 2-3 minutes.</li><li>Égouttez les spaghetti et les verser dans la poêle et mélanger le tout. Servir chaud.</li></ol>', '<ul><li>30g de crème fraîche épaisse</li><li>100g spaghetti</li><li>70g assortiment de champignon</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(14, 'Galette bretonne à la courgette', 'imgRecette_14', 25, 30, 2, '<ol><li>Eplucher, couper en cube la courgette. Verser une cuillère à soupe d''huile d''olive dans une poêle pour faire cuire la courgette.</li><li>Une fois cuit, chauffer la galette dans un poêle plate. Placer la tranche de jambon dessus, puis les courgettes. Refermer la galette puis laisser chauffer quelques minutes. (Possibilité de rajouter de l''emmental par dessus ainsi qu''un oeuf).</li></ol>', '<ul><li>1 galette</li><li>70g de courgette, pulpe et peau crue</li><li>1 tranche de jambon de poulet ou blanc de poulet en tranche</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(15, 'Wrap de tomate et avocat', 'imgRecette_15', 5, 35, 2, '<ol><li>Découper la tomate et un demi avocat en morceaux.</li><li>Laver et égoutter le mais.</li><li>Dans une assiette déposer 2 wraps, puis les morceaux de tomates, d''avocats et le maïs. Assaisonner à votre gout.</li></ol>', '<ul><li>30g de maïs</li><li>2 wraps souples</li><li>100g d''avocat</li><li>1 tomate</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'), --15
			(16, 'Riz complet aux courgettes et oeuf mollet', 'imgRecette_16', 20, 25, 2, '<ol><li>Mettre de l''eau à bouillir, puis y ajouter le riz complet. Comptez entre 10 et 12 minutes de cuisson. Vous pouvez utiliser cette eau pour faire cuire votre œuf mollet avant, environ 5 minutes de cuisson puis le mettre dans l''eau froide pour stopper la cuisson.</li><li>Dans une poêle, verser un peu d''huile d''olive, puis y ajouter environ 80g de courgette coupée en morceaux.</li><li>Égoutter le riz, puis disposer le dans votre assiette. Vous pouvez le mélanger dans la poele avec les courgettes si vous le désirez.</li></ol>', '<ul><li>100g de riz complet</li><li>1 oeufs frais calibres gros</li><li>1 cuillère à café d''huile d''olive vierge extra</li><li>80g de courgette, pulpe et peau crue</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(17, 'Pâtes complètes aux champignons', 'imgRecette_17', 25, 25, 2, '<ol><li>Faire cuire vos pâtes complètes dans leau bouillante, pendant environ 12 minutes.</li><li>Dans une poêle, faire revenir les champignons avec un filet dhuile dolive, puis y ajouter la crème fraiche et la moutarde. Mélanger doucement et assaisonner de poivre et sel à votre convenance.</li><li>Une fois les pâtes cuites, les égoutter et les verser dans la préparation à base de champignons. Mélanger le tout et ajouter le gruyère râpé. Servir chaud.</li></ol>', '<ul><li> </li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(18, 'Toasts d’avocats à l’oeuf poché', 'imgRecette_18', 10, 25, 2, '<ol><li>Retirer la peau des avocats et mettre la chair dans un récipient. Écraser les avocats à la fourchette.</li><li>Toaster les tranches de pain et placer-les sur votre plan de travail. Ajouter le fromage frais puis les avocats écraser, et assaisonner à votre goût.</li><li>Enfin, faire cuire un œuf poché (dans une casserole porter l''eau à ébullition. Casser un œuf dans une louche et immerger doucement la louche. Ramener le blanc autour de l’œuf. Laisser cuire environ 3 min) et déposer le sur les tartines.</li></ol>', '<ul><li> </li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(19, 'Poulet au curry', 'imgRecette_19', 15, 30, 2,'<ol><li>Etape 1 : Versez le riz dans un grand volume d''eau bouillante et suivez le temps de cuisson recommandé sur l''emballage.</li><li>Etape 2: coupez les filets de poulet en lamelles.</li><li>Etape 3Faites revenir le poulet dans une pôele 2 minutes avec un filet d''huile d''olive, salez et poivrez.</li><li>Etape 4: Une fois bien dorés, ajoutez le curry en poudre. Faite revenir 3 minutes supplémentaires à feu moyen.</li><li>Etape 5 :Versez le lait de coco et 5cl d''eau par personne. Couvrez et laissez cuire 5 minutes.</li><li>Etape 6 : Salez, poivrez. Servez le curry avec le riz.(Optionnel: ajoutez de la coriandre frîche).</li></ol>','<ul><li>1 Poulet (escalope), 1/7 càc Curry (poudre),2 càs Lait de coco, 70 g Riz, 1/2 bouquet de Coriandre (frais) </li></ul>','2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			
			(20, 'Burger montagnard au morbier', 'imgRecette_20', 25, 18, 2, '<ol><li>Laver et tailler en petites tranches un demi poivron et une petite tomate (ou une demie).</li>Faire cuire votre steak à la cuisson souhaitée. Une fois celui-ci prêt à votre convenance, déposer la tranche de morbier dessus et couvrir à feu doux.<li>Trancher votre pain, vous pouvez le réchauffer au four quelques minutes avant la suite de la préparation. Tartiner la sauce au poivre sur les 2 tranches. Déposer vos feuilles de salade, les tranches de tomate et de poivron. Déposer le steak avec le morbier fondu dessus. Redéposer la salade, les tomates et les tranches de poivron avant de refermer le tout. Servir tiède avec des frites.</li></ol>', '<ul><li>Steak haché 5%</li><li>Morbier</li><li>4 maxi pains hamburger</li><li>Sauce au poivre</li><li>1 Tomate</li><li>Salade verte</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'), --20 diner
			(21, 'Croque-monsieur au cheddar', 'imgRecette_21', 10, 20, 2, '<ol><li>Sur les tranches de pain de mie, étaler le beurre.</li><li>Placer la tranche de jambon sur une des tranche de pain de mie. Redécouper celle-ci si nécessaire.</li><li>Placer une tranche de cheddar sur le jambon et refermer le sandwich. Placer au four 10 minutes à 200°C jusqu''à ce que le pain de mie soit doré.</li></ol>', '<ul><li>2 tranches de pain de mie</li><li>10g de beurre doux</li><li>1 tranche de jambon supérieur</li><li>20g de cheddar</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(22, 'Mini pizza blanche à la crème fraiche et chorizo', 'imgRecette_22', 25, 20, 2, '<ol><li>Étaler la pâte à pizza sur une plaque huilée (ou avec du papier sulfurisé) et recouvrir de crème fraîche.</li><li>Saupoudrer de fromage râpé (de l''emmental dans cette recette, mais vous pouvez varier en fonction des goûts) et répartir les tranches de chorizo et quelques tranches de tomate.</li><li>Après avoir préchauffé le four à 200°C, enfourner pour environ 10 à 15 minutes jusqu''à ce que la pâte soit bien cuite (croustillante) et le fromage doré.</li></ol>', '<ul><li>60g de fromage rapé</li><li>1 cuillière à soupe d''huile d''olive</li><li>100g de chorizo</li><li>2 cuillière à soupe de crème fraîche épaisse</li><li>50g de tomate</li><li>0.5 rouleau de pâte à pizza</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(23, 'Pâtes à la sauce tomate et basilic', 'imgRecette_23', 20, 36, 2, '<ol><li> </li></ol>', '<ul><li> </li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(24, 'Pâtes bolognaises carottes et céléri', 'imgRecette_24', 25, 18, 2, '<ol><li>Découpez les carottes et le céléri en petits morceaux, puis épluchez l''oignon et la gousse d''ail.</li><li>Faire revenir l''ail et l''oignon hachés dans une poêle avec un fond d''huile d''olive.</li><li>Ajouter le céleri et les carottes et faire revenir pendant quelques minutes. Ajoutez la viande de bœuf haché et laissez cuire jusqu’à ce que la viande soit cuite. Laisser mijoter à petit feu le temps de la cuisson des pâtes.</li><li>Faire cuire les spaghetti environ 7-8 minutes (en fonction des spaghetti).</li><li>Egoutez les spaghetti puis mélanger la sauce bolognaise avec les pâtes. Saupoudrer de fromage râpé.</li></ol>', '<ul><li>200g de spaghetti bio</li><li>2 cuillière à soupe de double concentré de tomate</li><li>60g de râpé aux 3 fromages</li><li>1 gousse ail</li><li>40g carotte crue</li><li>40g de céleri branche cru</li><li>100g oignon cru</li><li>230g de viande hachée pur boeuf</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(25, 'Poêlée de pommes de terre aux champignons frais', 'imgRecette_25', 18, 22, 2, '<ol><li>Après avoir épluchez les pommes de terre, les couper en morceaux grossiers. Faire de même avec les champignons.</li><li>Hachez lail et l''échalote. Faire revenir les champignons dans une poêle/sauteuse avec du beurre.</li><li>Ajoutez y les pommes de terre, l''ail et l''échalote puis assaisonner à votre convenance.</li><li>Une fois les pommes de terre dorées et les champignons bien cuits, servir chaud dans une assiette.</li></ol>', '<ul><li>10g de beurre doux</li><li>1 gousse dail cru</li><li>120g de champignon de paris ou champignon de couche, cru</li><li>1 échalote crue</li><li>300g de pomme de terre, sans peau, crue</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'), --25
			(26, 'Tagliatelles aux lardons', 'imgRecette_26', 20, 25, 2,'<ol><li>Faire bouillir de l''eau avec une pincée de sel.</li><li>Faire cuire les pâtes environ 12 minutes (cela peut varier en fonction des marques), égouttez puis réserver.</li><li>Hachez votre demi oignon et le faire revenir dans une poêle chaude avec un filet d''huile d''olive. Y ajoutez les lardons et laisser cuire jusqu''à obtention d''une belle couleur. Vous pouvez les faire grillez plus longtemps, en fonction des goûts.</li><li>Verser ensuite les tagliatelles dans la poêle et remuez pour ne pas qu''elles collent. Déposer le tout dans une assiette et dressez. Assaisonner à votre convenance avec du poivre.</li></ol>', '<ul><li>1 cuillière à café d''huile d''olive</li><li>50g de lardons</li><li>60g de tagliatelles</li><li>30g d''oignon cru</li></ul>','2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(27, 'Bruschetta au bacon, tomates et champignons accompagné d’un oeuf', 'imgRecette_27', 25, 21, 2,'<ol><li>Pré-chauffer votre four à 180°. Sur une tartine de bruschetta, étaler le st môret.</li><li>Déposer une tranche de bacon, quelques rondelles de tomates et champignons. Pour finir, ajouter du fromage râpé.</li><li>Enfourner les bruschettas. Faire cuire l’oeuf au plat dans une poêle. Préparer votre assiette de salade assaisonnée, puis servir chaud.</li></ol>', '<ul><li>15g d''emmental</li><li>30g de St môret - format famillial</li><li>100g de pains bruschetta</li><li>20g de bacon fumé</li><li>50g de tomate crue</li><li>30g champignon de paris ou champignon de couche, crus</li><li>50g d''oeuf au plat sans matière grasse</li><li>40g de salade verte, crue, sans assaisonement</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(28, 'Poêlée de pommes de terre aux champignons frais', 'imgRecette_28', 25, 28, 2, '<ol><li>Après avoir épluchez les pommes de terre, les couper en morceaux grossiers. Faire de même avec les champignons.</li><li>Hachez lail et léchalote. Faire revenir les champignons dans une poêle/sauteuse avec du beurre.</li><li>Ajoutez y les pommes de terre, lail et léchalote puis assaisonner à votre convenance.</li><li>Une fois les pommes de terre dorées et les champignons bien cuits, servir chaud dans une assiette.</li></ol>', '<ul><li> 10g de Beurre doux</li><li>1 gousse Ail</li><li>120g de Champignons de paris</li><li>1 echalotte</li><li>300g de pomme de terre</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(29, 'Tagliatelle au pesto', 'imgRecette_29', 15, 23, 2, '<ol><li>Préparation du pesto : pelez la gousse dail et hachez la très finement. Mixer lail, le basilic, les pignons de pain et le parmesan.</li><li>Ajouter lhuile dolive et mixer à nouveau. Vous devez avoir obtenu une mixture homogène.</li><li>Faire cuire les tagliatelle dans de leau bouillante et salée, environ 8 à 10 minutes.</li><li>Une fois les pâtes cuites, les égouter et mélanger le pesto. Servir chaud et saupoudrez de parmesan à votre gout.</li></ol>', '<ul><li>75g Tagliatelles aux oeufs</li><li> 2cs cuillères à soupes huilde dolive</li><li>Parmigiano reggiano bio</li><li>Pignons de pin</li><li>Ail</li><li>Basilic</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			
			(30, 'Amandes caramélisées', 'imgRecette_30', 11, 20, 3, '<ol><li>Etape 1: Dans une casserole, ajoutez: le sucre(20g par personne) et la même quantité d''eau (2g par personne). Faites chauffer à feu vif jusqu''à ce que le mélange fasse des bulles.</li><li>Etape 2: Ajoutez les amandes et les mélangez sans cesse avec une cuillère en bois le temps qu''un caramel se forme et qu''il cristalise autour des amendes (environ 10 à 15 minutes).</li><li>Etape 3 : Etalez les amandes sur une plaque de cuisson anti-adhésive ou sur une feuille de papier sulfurisé préalablement huilée et laissez refroidir. </li><li>Etape 4 : Decollez les amandes caramélisées les unes des autres et hachez-les grossièrement si vous le souhaitez, c''est prêt !</li></ol>','<ul><li> 20 g de suscre en poudre, 30g Amandes (entières)</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'), --30 (min) 3 desserts et 3 entrées
 			(31, 'Bananes caramélisée', 'imgRecette_31',7, 20, 3,'<ol><li> Etape 1 : Coupez les bananes en deux dans la longueur avec ou sans peau. Etape 2: Dans une pôele chaude , ajoutez le beurre et laissez le fondre. Saupoudrez de sucre.Etape 3 : Ajoutez les bananes. Laissez cuire à feu moyen 5 minutes un caramel va se former autour de la babane. Etape 4: Servez les bananes avec le cramel. C''est prêt! </li></ol>','<ul><li>1 banane, 1 càc sucre (en poudre), 10g de beurre</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(32, 'Panna cotta à la fraise', 'imgRecette_32', 9, 30, 3,'<ol><li>Etape 1: Lavez puis équeutez les fraises. Coupez-les en 2 ou en 4. Etape 2: Deposez les fraises dans un bol et ajoutez une demi cuill. à soupe de sucre par portion. Mélangez et réservez au frais.Etape 3 :Faites ramollir la gélatine dans un bol d''eau froide. Réservez. Etape 4 : Égrainez la gousse de vanille en la coupant en deux dans le sens de la longueur puis en glissant la lame de couteau tout en raclant les grains. Gardez le reste de la gousse.Etape 5 : Dans une casserole, versez la crème liquide et le reste du sucre (soit 1 cuill. à soupe par portion). Faites chauffer sur feu doux.Etape 6 :Ajoutez les grains puis la gousse de vanille égrainée. Mélangez à l''aide d''un fouet.Etape 7 :Dès le début de l''ébullition, retirez la casserole du feu. Enlevez la gousse de vanille et ajoutez la gélatine égouttée. Fouettez.Etape 8 : Versez votre préparation dans des ramequins ou dans un moule. (Si vous souhaitez démouler les panna cotta, mouillez vos récipients sous un filet d''eau froide).Etape 9 : Réservez au minimum 3 heures au réfrigérateur.Etape 10 : Avant de dégustez vos panna cotta, ajoutez les fraises avec leur jus sur le dessus, c''est prêt ! <li></ol>','<ul><li> 80 gr Fraise, 10 cl Crème liquide, 2 càs Suvre (enpoudre), 1/4 Vanille (gousse), 1/2 gélatine </li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(33, 'Salade betterave, avocat é chèvre frais', 'imgRecette_33', 5, 25, 1,'<ol></li>Etape 1 : Réalisez la vinaigrette en mélangeant 1 cuillère à café de vinaigre pour 1 cuillère à soupe d''huile d''olive et ajoutez la moutarde à l''ancienne. Salez et poivrez.Etape 2 : Coupez l''avocat en deux et ôtez le noyaux. Taillez ensuite des fines lamelles.Etape 3 Dans un saladier, ajoutez la salade, les betteraves coupées en cubes, le chèvre émietté, l''avocat et la vinaigrette, mélangez. C''est prêt !</li></ol>','<ul><li>150 gr betterave (cuite), 2 poignées salade (mâche), 30 gr chèvre frais, 1/2 càc Moutarde à l''ancienn, 1 càc vinaigre de cidre, 1/2 avocat</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(34, 'Saint-Jacques poêlées ', 'imgRecette_34', 10, 28, 1,'<ol></li>Etape 1 : Si besoin, décongelez les noix de Saint-Jacques en les plaçant dans un sac hermétique puis en plaçant ce sac dans de l''eau à température ambiante. Retirez le corail de chaque noix de Saint-Jacques en tirant légèrement.Etape 2 : Faites chauffer un filet d''huile dans une poêle bien chaude. Salez les noix de Saint-Jacques et ajoutez-les dans la poêle. Attention il ne faut surtout pas les remuer ! Faites cuire environ une minute. Etape 3 :Quand les noix de Saint-Jacques sont bien dorées sous le dessous on peut les retourner, elles vont se détacher toutes seules.Etape 4 :Une fois les noix de Saint-Jacques retournées, ajoutez une noisette de beurre dans la poêle. Continuez la cuisson pendant une minute tout en arrosant. Servez les noix de Saint-Jacques. C''est prêt ! </li></ol>','<ul><li> 100 gr Noix de Saint-Jacques, 20 gr Beurre</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(35, 'Salade d''hivers Silicienne', 'imgRecette_35', 10, 30,1, '<ol><li> Etape 1 :Lavez le fenouil et les radis.Etape 2 : Coupez le fenouil (gardez les feuilles pour la déco) finement.Etape 3 :Coupez les radis en tranches fines. Etape 4 : Coupez les oignons en tranches fines. Etape 5 : Retirez la peau des oranges, puis couper-les en tranches d’un demi centimètre environ.Etape 6 : Dans un plat disposez les tranches d''orange, le fenouil, les oignons et les radis.Etape 7 : Ajoutez un filet d''huile d''olive, le vinaigre de cidre sur le dessus, salez et poivrez. C''est prêt !</li></ol>','<ul><li> 1/2 Fenouille, 1 orange, 1/4 oignon rouge 30 gr Radis , 1 càs Vinaigre de cidre</li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'), --35 (si possible)
			(36, 'Cabillaud poilée légumes au curry', 'imgRecette_36', 20, 35, 2, '<ol><li>Etape 1 : Lavez, épluchez puis coupez les courgettes et les carottes en petits dés. Émincez l''ail finement.Etape 2 : Dans une poêle à feu vif, ajoutez un filet d''huile d''olive, l''ail et le curry, puis les carottes et courgettes. Faites revenir 7 à 10 minutes en remuant fréquemment, jusqu''à ce que les légumes soient fondants.Etape 3 :Dans une poêle chaude, ajoutez un peu de beurre (ou d''huile d''olive), le cabillaud, faire revenir à feu moyen 4 minutes de chaque côté. Salez poivrez en fin de cuisson. Servir avec les légumes poêlés. Ajoutez la coriandre ciselée, si vous en avez. C''est prêt ! </ol></li>', '<ul><li>1 Cabillaud (frais), 1/2 Courgette, 2 carottes (frais), 1 càc Curry (poudre); 1/2 gou. d''ail. </li></ul>', '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(37, 'Cabillaud petits pois& lard', 'imgRecette_37', 13, 35, 2,'<ol><li>Etape 1 : Dans une casserole d''eau bouillante salée, faites cuire les petits pois pendant 8 minutes.Etape 2 : Pendant ce temps, dans une poêle, ajoutez les tranches de lard et le cabillaud.Etape 3 :Retirez le lard de la poêle une fois qu''il est bien doré.Etape 4 : Faites cuire le cabillaud 4 minutes de chaque côté. Ajoutez un filet d''huile d''olive si besoin.Etape 5 : Une fois la cuisson des petits pois terminée égouttez-les puis assaisonnez-les: sel, poivre, jus de citron, fin filet d''huile d''olive,mélangez. Etape 6 : Servez-les avec le poisson et le lard une fois leur cuisson terminée.Etape 7 : Râpez le zeste du citron sur le dessus, salez, poivrez, ajoutez un fin filet d''huile d''olive, c''est prêt !  </li></ol>','<ul><li>1 cabillaud (frais), 200 g Petits pois (frais), 1 tran. Lard ,1/4 citron jaune.</li></ul>','2022-04-01 08:00:00', '2022-04-01 18:01:00');

INSERT INTO public.meals(
	id, start_date, users_id, recipes_id, "createdAt", "updatedAt")
	VALUES  (1, '2022-05-09', 1, 0,'2022-05-05', '2022-05-05'),
			(2, '2022-05-09',1, 0, '2022-05-05', '2022-05-05'),
			(3, '2022-05-09', 1,0, '20022-05-05', '20022-05-05'),
			(4, '2022-05-17', 1, 0, '2022-05-17', '2022-05-17'),
			(5, '2022-05-17', 1, 0, '2022-05-17', '2022-05-17'), --5
			(6, '2022-05-17', 1, 0, '2022-05-17','2022-05-17'),
			(7, '2022-05-25',1, 0, '2022-05-25','2022-05-25'),
			(8, '2022-05-25',1, 0,'2022-05-25' ,'2022-05-25' ),
			(9, '2022-05-25', 1, 0, '2022-05-25', '2022-05-25'),
			(10, '2022-06-03',1, 0, '2022-06-03', '2022-06-03'), --10
			(11, '2022-06-03', 1, 0, '2022-06-03', '2022-06-03'),
			(12, '2022-06-03', 1, 0, '2022-06-03', '2022-06-03'),
			(13, '2022-06-11', 1, 0, '2022-06-11', '2022-06-11'),
			(14, '2022-06-11', 1, 0, '2022-06-11', '2022-06-11'),
			(15, '2022-06-11', 1, 0, '2022-06-11', '2022-06-11'), --15
			(16, '2022-09-20', 1, 0, '2022-09-20', '2022-09-20'),
			(17, '2022-09-20', 1, 0, '2022-09-20', '2022-09-20'),
			(18, '2022-09-20', 1, 0, '2022-09-01', '2022-09-20'),
			(19, '2022-09-01', 1, 0, '2022-09-01', '2022-09-01'),
			(20, '2022-09-01', 1, 0, '2022-09-01', '2022-09-01'),--20 
			(21, '2022-09-01', 1, 0, '2022-09-01', '2022-09-01');


INSERT INTO public.users_create_recipes(
	id, users_id, recipes_id, "createdAt", "updatedAt")
	VALUES  (1, 1, 1, '2022-04-01', '2022-04-01'),
			(2, 1, 2, '2022-02-02','2022-02-02'),
			(3, 1, 3, '2022-06-01','2022-06-01'),
			(4, 1, 4, '2022-07-01','2022-07-01'),
			(5, 1, 5, '20022-03-03', '20022-03-03'),
			(4, 1, 6, '2022-09-01', '2022-09-01'),
			(5, 1, 7, '2022-04-01', '2022-04-01');

INSERT INTO public.specific_diet(
	id, name, "createdAt", "updatedAt")
	VALUES (1,'sans lactose','2022-04-01','2022-04-01'),
		   (2,'sans gluten','2022-04-01','2022-04-01'),
		   (3,'vegetarien','2022-04-01','2022-04-01'),
		   (4,'vegetalien','2022-04-01','2022-04-01'),
		   (5,'sans porc','2022-04-01','2022-04-01');



INSERT INTO public.specific_diet_has_recipes(
	id, specific_diet_id, recipes_id, "createdAt", "updatedAt")
	VALUES  (1, 1, 10, '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(2, 2, 16, '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(3, 3, 13, '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(4, 3, 23, '2022-04-01 08:00:00', '2022-04-01 18:01:00'),
			(5, 4, 14, '2022-04-01 08:00:00', '2022-04-01 18:01:00');
			
INSERT INTO public.users_choose_specific_diet(
	id, users_id, specific_diet_id)
	VALUES (1, 1, 1);

COMMIT;