
## Abstract
The primary goal of this research is educational.
This research aims to enhance the capabilities of Large Language Models (LLMs) using Retrieval-Augmented Generation (RAG) techniques. 
I have developed a simple RAG and will compare the accuracy of question-answering between standard LLMs and RAG enhance LLMS, this study explores the potential improvements in performance and robustness that a RAG system can offer.

## Introduction

Let's start with a real world analogy.


- Let's assume I'm a LLM. If you ask me a question, let's say "What's the biggest city in Europe?"
The quality of my answer will depend on my knowledge of the subject, or for a neural network the number of parameters it contains. The knowledge of the neural network is stored in its parameters, so it is said that it has **Parametric-memory**.


- Let's say I'm an RAG system. If you asked me a question "what's the biggest city in Europe?", first I will search Wikipedia and find the article related to the question and then give you an answer.


LLMs are great, but as almost everything  in our life, they can be improved.


Current problems in LLMs are:


1. **Limitation in memory**, once the network is trained it will not be able to learn new things.
2. **Hardware requirements and cost**, Useful LLMS require extremely powerful hardware
3. **Privacy**, useful models are owned and managed by extremely wealthy companies as they are expensive, this is a serious privacy problems and some companies don't allow usage of this kind of models, especially because of GDPR.


## What is RAG Retrieval Augmented Generation

*Retrieval-augmented generation (RAG) is an advanced artificial intelligence (AI) technique that combines information retrieval with text generation, allowing AI models to retrieve relevant information from a knowledge source and incorporate it into generated text.*


### The basic idea around a RAG system is extending the capabilities of an already trained machine learning model (MLM), in particular an LLM.


Technical problems that LLMs have:

* Under fitted, high bias - meaning the number of parameters is not big enough to correctly approximate all input, not powerful enough to correctly answer to the input. 

* Tightly correlated to the type of data they are trained on - If a model is trained on the subject of history it will not be able to answer questions from mathematics, also their knowledge might not be up to date. 


Rag systems do not suffer as much as other models from this problem, their memory can be extended without the need for training or adding additional parameters.


They contain so called **Non-parametric memory** that can be extended.


**This is the core idea or property in the RAG systems. Without any additional training new knowledge can be made available to the LLMs.**


Rag system is build of two subsystems:

* Retriever and Augmenter
* Generative AI Component


Phases:

- Phase 1 Retrieval, Knowledge retrieval, When asked a question the RAG retrieval system will retrieve all known information by submitting an appropriate query to the non-parametric memory. 

- Phase 2 Augmentation, with the retrieved information, a context around the question is created, the context should contain all information for answering the question. 

- Phase 3 Generation, The context and question will be passed to an LLM that will generate an answer. 



```
Question 
   |
    ---> | Retrieval and |
         | Augmentation  |
                |
                 --> (context + question)
                              |
                               ---> | Generative |
                                    |     AI     |
                                    |  Component | --> Answer            
            
```


## Generative AI component or a LLM transformer


It is an LLM transformer.


The transformer's quality depends on the number of parameters or the size of the parametric memory.

Property of LLM:
Regardless of the quality of the output, every LLM for a given input is expected to generate grammatically correct text and semantically related to the input.


Requirement of RAG generative component:

**The generative component of the RAG system needs to be able for a given input and context to generate grammatically correct sentences related to the given context.**
**This is exactly what is achieved with the LLM transformers and that is why they are ideal to be used in the generation phase of the RAG system.**

---

## Retriever system

### Components

* Sentence Embedding Model
* Non-parametric memory

### Retriever phases 

**Storing Phase:**

```
Text block -> Sentence Embedder -> Embedding -> Non-Parametric memory
```


**Retrieval Phase:**

```
Question
  |
   -> | Sentence Embedder |
  |            |
  |             -> Embedding
  |                 |
  |                  -> | Non-Parametric memory |
  |                         |
  |                          -> Retrieved Documents
  |                                   |
  |                                    -> Context
  |                                          |
  |                                           -->| Generative |
   --------------------------------------------->| Component  |
                                                       |
                                                        -> Answer
                                          
```

### Non-parametric memory - vector databases

Usually Dense vector databases
Need to have the following properties:

* Store embeddings
* Query for similar vectors, for an input vector, by distance
* Fast retrieval
* Possibility to store data on disk

Current databases: 
* Redis Vector Similarity Search (VSS) - open sourced
* Pinecone - exclusively managed, closed source
* Weaviate - open source
* Milvus - open source
* Qdrant - open source
* Vespa - open source
* Cloudflare Vectorize - exclusively managed, closed source
* MongoDB Atlas - fully managed, closed source
* Postges, pgvector - open-sourced

For demonstration purposes Faiss is chosen

---

### Sentence embedding models


Based on the transformers model encoder. Created by adding additional layer of pooling.

**LLM Transformer's encoder**

```
Sentence
|
 -> Tokenization
     |
      -> Embedded Vectors
          |
           -> Contextual Vectors
```

**Sentence embedding model**


```
Sentence
|
 -> Tokenization
     |
      -> Embedded Vectors
          |
           -> Contextual Vectors
               |
                -> | Mean Pooling            | 
                   | Max Pooling             |
                   | CLS Token               |
                   | Attention-based Pooling |
                      |
                       -> Sentence embedding
```


### Pooling

Is a function $F:E^n->E$, where E is the set of contextual embeddings
$F(e1,e2,..en)->e$, $e$ in $E$


Most popular is **MEAN** pool, it returns the "average vector"

### Technical requirements the Embedder

The requirement of the sentence embedding model is the follows:

**For every three blocks of text $A$, $P$, $N$,
the model $SE$ is to provide three embeddings $SE(A)$, $SE(P)$, $SE(N)$, 
such that:
if $A$ and $P$ are semantically more similar $A$ and $N$, then the distance $distance(SE(A), SE(P))$ < $distance(SE(A), SE(N))$.**



**The simple interpretation is that the sentence embedding model takes a block of text and captures its meaning or semantics by describing it as a vector.**

!!!!
**This is an extremely useful feature because it allows for representing the meaning and information of sentences in a way that enables the measurement of semantic information.**
!!!!

### Siamese training network and loss function
The input and output of the sentence embeddings is in the correct format but needs to be fine-tuned in order to meet the semantic requirement Embedders are trained with Siamese networks.

*Siamese network with Contrastive Loss function*
```
 Anchor                        Positive/Negative
  Input                            Input
    |                                |
 Shared Network                Shared Network 
    |                                |
 Anchor Embedding          Positive/Negative Embedding
       \                           /
        \                         /
         \                       /
              Contrastive Loss
                 Function

```
The networks end's with a contrastive loss function that is given with the following formula:
$$
Loss =  \frac{1}{2} (y*D(A,C)^2 + (1-y)*max(0,m-D(A,C))^2)
$$

**Triplet loss function**

Activates if the distance between the anchor and the negative is bigger than the distance between the anchor and the negative.


```
                 
Anchor           Positive           Negative
Input             Input             Input
  |                 |                |
Shared            Shared            Shared
Network           Network           Network
  |                 |                |
Anchor           Positive           Negative
Embedding        Embedding          Embedding
     \              |               /
      \             |              / 
       \            |             /
        \           |            /
            Triplet Distance
              Loss function    
```
$$
Loss = \max(0, D(A,P) - D(A,N) + \text{margin})
$$
Guarantees that
$$ D(A,P) + margine < D(A,N) $$

## Related work

General RAG systematization

* Naive RAG 

Is the type of RAG described in this document.

* Advanced RAG 
  * **pre-retrieval** phase 
      * Query optimization
      * Storage optimization and retrieval
      * Extending the stored data with metadata
  * **post-retrieval** phase
     * generate higher quality context
      * re-ranked and compressed, cleaned up

* Modular RAG 



## Different RAG methods and models

#### RAG-Sequence Model
Retrieves k embeddings. Iterates over all of them generating the next token, and it measures the probability for the generated token. The next token is the one with the heights probability.

#### RAG-Token Model
Retrieves new documents on every generated token.

### Iterative and Recursive RAG

#### Speculative RAG 
Groups the embeddings using k-mean algorithm and tests the results using 
* Self-Consistency Score - probability of the answer and the rational been generated from the question.
* Self-Reflection Score - Probability of positive answer, "Yes" been generated given the question, rational and the answer.

#### Recursive rag
 As any recursive algorithm it repeats its self until the results satisfies certain criteria. In case of the retrieval, a naive RAG system performs good when all the information required for answering the question is in the retrieved embeddings.


## Conclusion

- **Horizontally Scalable**: RAG systems can efficiently scale by distributing the retrieval process across multiple nodes, allowing for handling larger datasets and more complex queries.
- **Distributive**: The modular nature of RAG systems enables distribution of tasks across different components, enhancing robustness and flexibility.
- **Mitigates Under fitting and High Bias**: By integrating external knowledge retrieval, RAG systems reduce the need for extremely large models with numerous parameters, thus avoiding issues related to under fitting and high bias.
- **Performance Enhancement**: RAG systems can surpass the performance of their base generative models by leveraging external knowledge, resulting in more accurate and contextually relevant responses.
