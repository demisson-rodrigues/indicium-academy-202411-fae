with
    dim_funcionarios as (
        SELECT *
        FROM {{ ref('int_vendas__self_join_funcionarios') }}
    )

SELECT *
FROM dim_funcionarios