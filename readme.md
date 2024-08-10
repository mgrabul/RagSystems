

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
```

-------

Data about vector databases:
* https://medium.com/@mutahar789/optimizing-rag-a-guide-to-choosing-the-right-vector-database-480f71a33139, Mutahar Ali Medium
* https://developers.cloudflare.com/vectorize/best-practices/insert-vectors/,  Cloudflare Docs
* https://www.aporia.com/learn/best-vector-dbs-for-retrieval-augmented-generation-rag/, Kristen Kehrer, Aporia
* https://www.databricks.com/glossary/retrieval-augmented-generation-rag, databricks
* https://www.mongodb.com/docs/atlas/cli/current/atlas-cli-deploy-local/, mongo db 
* https://medium.com/@if-21062/rag-with-atlas-vector-search-mongodb-0d2420e00b64, Vincent Benedict M.W
* https://neo4j.com/developer-blog/neo4j-langchain-vector-index-implementation/, Tomaž Bratanič, Graph ML and GenAI Research, Neo4j

* about retreaval granularity, https://arxiv.org/pdf/2312.10997
* about retreavel startegies iterative, recursive, adaptive
* about training:
Siamese Network with Contrastive Loss:

This method also involves pairs of sentences but uses contrastive loss instead of triplet loss. Here, the goal is to learn sentence representations such that pairs of similar sentences have a smaller distance between them than pairs of dissimilar sentences in the embedding space. This approach is particularly useful when you have a binary label indicating whether the pair of sentences are similar or not.

Supervised Learning with Cross-Entropy Loss:
If there is a dataset with labeled sentence pairs (e.g., semantic textual similarity tasks), a model can be fine-tuned using a supervised approach where the objective is to predict the similarity score directly. This typically involves using a cross-entropy loss if the scores are categorical or a regression loss if the scores are continuous.
Using Pretrained Language Models:

Another common approach is leveraging large pretrained models like BERT, RoBERTa, or GPT, which are initially trained on a large corpus of text using tasks like masked language modeling. These models can then be fine-tuned on specific sentence embedding tasks to adapt the general language understanding to more specialized sentence comparisons or classifications.
Self-Supervised Learning: https://chatgpt.com/c/1777d44a-b49a-474f-aa85-eff630e93785

Rag with metadata:
* https://chatgpt.com/c/1777d44a-b49a-474f-aa85-eff630e93785
* https://arxiv.org/abs/2406.13213
* https://arxiv.org/abs/2407.01219
* https://www.clarifai.com/
* https://pareto.ai/
* https://www.appen.com/

Rag with typoes acording the tetreave:
* interative - https://arxiv.org/abs/2407.08223 

queru -> Retreaved data -> Generate  answer, -> analyze answer, look for gaps 
                                                                    |
                                                                    |
                        <- Generate  answer <- Retreave data <- generate new query 


* recursive - https://arxiv.org/abs/2312.04282
* adaptive - https://arxiv.org/abs/2009.09139
https://www.youtube.com/watch?v=IVYwLLDABzI
flare, self-rag

other interesting paper- interactive rag: https://arxiv.org/abs/2305.13246

* Graph rag,
microsofts aproach: https://www.youtube.com/watch?v=vX3A96_F3FU, really good!!!!
microsoft graph rag:
lama index, knolage graph rag: 
neofor4 graph rag: 




### future work 
concept for rag:

* tag the text with specialised LLMs creating summary or tag for searches:
https://chatgpt.com/c/1777d44a-b49a-474f-aa85-eff630e93785, this will generate a summary for a text that will be stored and searched later in the database as an embeding. so this is new artificial generated content it actually adds new information the database that will give the rag system new perspective.v Interesting idea to expolre for an original document

* create summaries for texts and index tehem
* combine two or three different texts chunks or embedings with one generated summaryt. This will allow continuity between the chuncks. Then using the kmeans and some method of optimization a graph can be created. The procees can be like this, on the first retreavel for example 10 chumcks will be retreaverd and then for this 10 chuunkjs new 10 chunjks can be retreaved separately, this will result in generation of a knolage graph. It will be realy interesing to see the corelation between the embedings of this knolage graph and the distance between the embedigs from different retreavels. Maybe the enought infomations for the generation of the answers are reached when the difference between the embedings is smaller than a trashoald or maube it is the opozite when a diffference is bigger than some trashoald than maube the information in the next embeding is not related to the question. Kmeans can be used to determen the different information that is stored in the retreaved embedings. For example if the answeer requres combinng two embedings, than this would emply that the answer needs to define/exmain two terms so then making 2-3 retreavels with 10 items and then grouping them in classes the algoritham might be able to determen the different terms or clusters of infomrations that are needed to answer the queestion.