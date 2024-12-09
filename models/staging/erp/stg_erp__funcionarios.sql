 with
    fonte_funcionarios as (
        select *
        from {{ source('erp_northwind', 'employee') }}
    )

    , renomeacao as (
        select 
            cast(ID as int) as pk_funcionario
            , cast(REPORTSTO as int) as fk_gerente         
            , FIRSTNAME || ' ' || LASTNAME as nome_funcionario
            , cast(TITLE as varchar) as cargo_funcionario
            , cast(BIRTHDATE as date) as dt_nascimento_funcionario
            , cast(HIREDATE as date) as dt_contratacao
            , cast(CITY as varchar) as cidade_funcionario
            , cast(REGION as varchar) as regiao_funcionario
            , cast(COUNTRY as varchar) as pais_funcionario
            --, cast(POSTALCODE as varchar) as 
            --, cast(ADDRESS as varchar) as            
            --, cast(TITLEOFCOURTESY as varchar) as 
            --, cast(HOMEPHONE as varchar) as 
            --, cast(EXTENSION as varchar) as 
            --, cast(PHOTO as varchar) 
            --, cast(NOTES as varchar) as 
            --, cast(PHOTOPATH as varchar) as 
        from fonte_funcionarios
    )

select *
from renomeacao