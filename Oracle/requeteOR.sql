-- Pour chaque vol, donner le nombre de personnes de l’équipage, par fonction.
SELECT
    NumVol,
    COUNT(*) AS nb_personnes,
    Equipage.fonction
  FROM
    Vol
    CROSS JOIN TABLE(Equipage) Equipage
  GROUP BY
    NumVol, Equipage.fonction
  ORDER BY
    NumVol ASC;

-- Pour chaque pilote, indiquer combien des vols lui sont associées.
SELECT
    Equipage.nom, Equipage.prenom,
    COUNT(*) AS nb_vols
  FROM
    Vol
    CROSS JOIN TABLE(Equipage) Equipage
  WHERE
    Equipage.fonction = 'Pilote'
  GROUP BY
    Equipage.nom, Equipage.prenom;

--L’impact d’un indice de qualitée est donnée par le produit de sa valeur et du poids que lui est attribuée. Pour chaque vol, indiquer l’impact de chaque indice de qualitée.

SELECT
    NumVol,
    IQ.nom AS indice_qualite,
    IQ.poids,
    IQ.poids_actuel,
    IQ.poids * IQ.poids_actuel AS impact
  FROM
    Vol
    CROSS JOIN TABLE(IndiceQualite) IQ
  ORDER BY
    NumVol ASC;

    
-- Pour chaque indice de qualitée, calculer son impact moyen.
SELECT
    IQ.nom AS indice_qualite,
    AVG(IQ.poids * IQ.poids_actuel) AS impact_moyen
  FROM
    Vol
    CROSS JOIN TABLE(IndiceQualite) IQ
  GROUP BY
    IQ.nom;
