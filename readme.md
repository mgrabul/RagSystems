

## Visual studio setup
https://code.visualstudio.com/docs/python/python-quick-start

## Setup conda
* https://conda.io/projects/conda/en/latest/user-guide/getting-started.html

## use conda
* conda create -n <environmentName>
* conda activate .conda/ 
* conda deactivate

## Jupiter notebook
* https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter

## VS Commands
* Command Palette  Cmd+Shift+P

## install exporter
* conda install nbconvert
* install https://tug.org/mactex/ for conversion to pdf

## Diagrams
* https://marketplace.visualstudio.com/items?itemName=vstirbu.vscode-mermaid-preview
* https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio
* https://support.typora.io/Draw-Diagrams-With-Markdown/ - tutorial

## Latex
* https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop

## Spelling check
* https://marketplace.visualstudio.com/items?itemName=ban.spellright
* https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker

## to pdf
```bash
jupyter nbconvert --to pdf Retrieval-Augmented\ Generation.ipynb

jupyter nbconvert --to pdf Retrieval-Augmented\ Generation.ipynb --output Retrieval-Augmented\ Generation_v2.pdf

```
In visual studio code
```
>Markdown-pdf: Export ...
```

.md export
```
pandoc notes.md -o notes.pdf
```