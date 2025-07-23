CREATE TABLE campanhas_ads (
    canal VARCHAR(25) NOT NULL,
    campanha VARCHAR(100) NOT NULL,
    grupo_de_anuncio VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    impressoes INT DEFAULT NULL,
    cliques INT DEFAULT NULL,
    leads DECIMAL(10,2) DEFAULT NULL,
    valor_gasto DECIMAL(10,2) DEFAULT NULL,
    
    
    INDEX idx_data (data),
    INDEX idx_canal (canal),
    INDEX idx_campanha (campanha),
    INDEX idx_grupo (grupo_de_anuncio)
);



SELECT
    campanha,
    SUM(leads) AS total_leads
FROM
    campanhas_ads
GROUP BY
    campanha
ORDER BY
    total_leads DESC
LIMIT 1;





SELECT
    campanha,
    CASE
        WHEN leads > 0 THEN ROUND(SUM(`valor gasto`) * 1.0 / SUM(leads), 2)
        ELSE NULL
    END AS CPL
FROM
    campanhas_ads
GROUP BY
    campanha
ORDER BY CPL ASC
LIMIT 1;

DESCRIBE campanhas_ads;
