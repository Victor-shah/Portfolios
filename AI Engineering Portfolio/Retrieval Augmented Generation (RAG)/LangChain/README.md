# Retrieval Augmented Generation (RAG)
A RAG is an AI framework that improves reliability and accuracy of LLMs by fetching data from external sources before generating a response. 

## How a RAG works
It is a 3-step process
1. **Retrieval (look it up)**: When you ask a question, the system searches from an external database (vector database) and finds documents related to your query.
2. **Augmented (add context)**: The documents we found are wrapped into the prompt alongside your question.
3. **Generation (answer the question)**: The LLM reads the question and generates a context aware response provided the reference data. 

We'll be implementing RAG using a popular open-source framework known as Langchain.

## Langchain
An open source framework used for building LLM applications. It has modular components --> Prompts, Models, Indexes, Chains, and Agents. 
Below is the block diagram for the RAG process
<img width="725" height="220" alt="image" src="https://github.com/user-attachments/assets/05fc056b-08f6-40cb-bcc1-13f35ccaaf12" />

1. **Document Loader**: Accessing and converting data --> returns a list of 'Document' objects. Each document consists of context and meta data (file name, and directory). Langchain supports 80+ types of document loaders. This is because there are a variety of sources data can be extracted from. For example, data can be extracted from sources such as, YouTube URL, PDF, websites, notion (database), etc.
2. **Document Splitting**: We split data on the basis of chunk size, and chunk overlap.
3. **Vectors and Embedding**: Where Embedding is the process where we convert text into numerical values, also known as vectors. Text with similar content will have similar vectors.
4. **Retrieval**: Few methods for retrieval are a) Maximum marginal relevance (MMR): better than similarity search, and gives a more diverse output (removes duplicates) b) LLM Aided Retrieval: Filter + Search c) Compression
5. **Question Answering**: Few methods are a) Map Reduce b) Refine c) Map ReRank
6. **Memory**: Without memory the LLM won't be able to answer follow-up questions. Few methods are a) Conversational Retrieval Change
