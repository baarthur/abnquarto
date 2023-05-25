# abnquarto v0.1.0 (alpha)

Template para escrever em Quarto seguindo o mínimo de regras ABNT.

> Criado por Arthur Bazolli com base [neste reposiotório](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) e nas [orientações LaTeX da UFJF](https://www2.ufjf.br/biblioteca/servicos/).

No futuro: criar um arquivo que reproduza 100% o padrão para monografias, dissertações e teses.
...



## Como baixar esse template

### Alternativa 1
Baixar tudo e inserir manualmente no seu computador: `<> Code` > `Download ZIP`

### Alternativa 2
Basta clonar este repositório, copiando o link acima.

Pelo `Terminal` (do RStudio ou do seu computador):
```bash
git clone https://github.com/baarthur/abnquarto.git nome_da_pasta
```

> Dica: 
> Garanta que você está na pasta certa usando o comando `pwd` (print work directory); caso contrário, digite cd e o caminho da pasta onde vai ficar o projeto.

Isso vai criar uma pasta no diretório que você excolheu com os arquivos necessários. Os mais importantes são `_quarto.yml` (definições globais de margens, recuos, bibliografia etc) e tudo na pasta `src`, onde há um template e os arquivos necessários na subpasta `yaml`.



## Uso básico

1. Edite o arquivo `_quarto.yml` seguindo as instruções que estão lá.
2. Use o template em `src` (ou crie um arquivo do zero onde quiser).