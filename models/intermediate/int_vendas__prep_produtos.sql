with
    /* Chamada dos modelos necessários */
    categorias as (
        SELECT *
        FROM {{ ref('stg_erp__categorias') }}
    )

    , fornecedores as (
        SELECT *
        FROM {{ ref('stg_erp__fornecedores') }}
    )

    , produtos as (
        SELECT *
        FROM {{ ref('stg_erp__produtos') }}
    )

    , enriquecer_produtos as (
        SELECT 
            produtos.PK_PRODUTO
            , produtos.NM_PRODUTO
            , produtos.QUANTIDADE_POR_UNIDADE
            , produtos.PRECO_POR_UNIDADE
            , produtos.UNIDADE_EM_ESTOQUE
            , produtos.UNIDADE_POR_PEDIDO
            , produtos.NIVEL_DE_PEDIDO
            , produtos.EH_DISCONTINUADO
            , categorias.nome_categoria
            , fornecedores.nome_fornecedor
            , fornecedores.cidade_fornecedor
            , fornecedores.pais_fornecedor
        FROM produtos
        LEFT JOIN categorias ON produtos.fk_categoria = categorias.pk_categoria
        LEFT JOIN fornecedores ON produtos.fk_fornecedor = fornecedores.pk_fornecedor
    )

SELECT *
FROM enriquecer_produtos