with
    fonte_categorias AS (
        SELECT *
        FROM {{ source('erp', 'category') }}
    ),
    renomeado AS (
        SELECT
            CAST(ID AS int) AS pk_categoria
            , CAST(CATEGORYNAME AS string) AS nome_categoria
            , CAST(DESCRIPTION AS string) AS descricao_categoria
        FROM fonte_categorias
    )

SELECT *
FROM renomeado