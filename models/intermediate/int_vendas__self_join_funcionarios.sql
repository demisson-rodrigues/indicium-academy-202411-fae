with
    /* Chamada dos modelos necessários */
    funcionarios as (
        SELECT *
        FROM {{ ref('stg_erp__funcionarios') }}
    )
    , self_joined as (
        SELECT 
            funcionarios.PK_FUNCIONARIO
            , funcionarios.NOME_FUNCIONARIO
            , funcionarios.CARGO_FUNCIONARIO
            , gerentes.NOME_FUNCIONARIO as nome_gerente
            , funcionarios.DT_NASCIMENTO_FUNCIONARIO
            , funcionarios.DT_CONTRATACAO
            , funcionarios.CIDADE_FUNCIONARIO
            , funcionarios.REGIAO_FUNCIONARIO
            , funcionarios.PAIS_FUNCIONARIO
        FROM funcionarios
        LEFT JOIN funcionarios AS gerentes
            ON funcionarios.fk_gerente = gerentes.pk_funcionario
    )

SELECT *
FROM self_joined