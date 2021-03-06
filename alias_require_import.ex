# O Elixir provê três maneiras de importarmos módulos externos / reutilizarmos código
defmodule Um do
    
    def func_um do
        "um"
    end

    def other_func do
        "other func"
    end

end

#
# Alias
#
# Um Alias no elixir é um identificador capitalizado (como String, Keyword e etc) que é
# convertido para um :atom durante a compilação
# Por exemplo, o alias String é traduzido para :"Elixir,String"
# Alias se transformam em atoms porque na BEAM modulos são sempre representados por atoms.
#
defmodule Dois do
    
    # A palavra chave alias serve para importar um Módulo/Alias e renomea-lo dentro de um escopo
    alias Um ,as: U
    # É interessante para simplificar/encurtar chamadas de módulos
    # alias Math.List, as: List

    def main do
        U.func_um()
    end

end

defmodule Quatro do 

    # Podemos também simplificar a importação de vários módulos internos de um determinado módulo através da sintaxe abaixo
    alias Tres.{DentroTres, OutroDentroTres}
end

#
# Import
#
defmodule Tres do
    
    # Importa as funções do módulo um, dessa forma não precisamos chama-las com o prefixo Um
    # Você pode usar o import limitando-o a qualquer escopo, seja em um módulo ou em uma função
    #import Um

    # Podemos importar também apenas algumas funções de um determinado módulo
    # Passando a função e sua ariedade para o argumento only:
    import Um, only: [other_func: 0]

    def main do
        other_func() # other func
    end

    defmodule DentroTres do

        def main do
            "dentrotres"
        end
    end

    defmodule OutroDentroTres do

        def main do
            "outrodentrotres"
        end
    end

end