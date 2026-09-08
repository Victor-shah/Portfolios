# Building and Evaluating Advanced RAG using LlamaIndex
The techniques covered are Sentence Window retrieval & Auto Merging Retrieval

**Basic RAG Pipeline**
Below is the RAG Pipeline <br>
<img width="488" height="353" alt="image" src="https://github.com/user-attachments/assets/7a5391fd-3182-483a-a7db-94e6688ac577" />



**The RAG Triad**

First step to evaluation is creating a set of questions. 
To improve metrics we incorporate better retrieval methods. These metrics follow the function known as Feedback Function. This provides a score after reviewing on LLM app's input, output, and intermediate results. 

<img width="482" height="448" alt="image" src="https://github.com/user-attachments/assets/e09266df-81f5-4727-8e35-4d4ad3c5f449" />

1. **Sentence Window Retrieval**: We retrieve a single sentence, which then gets replaced by a larger window of sentences around the original retrieved sentence. This ideally improves the retrieval and synthesis process.
Few functions covered are: Post processor, and Reranker

2. **Auto Merging Retrieval**: Create a hierarchy with larger parent nodes with smaller child nodes. How this works, if a bunch of child nodes are being retrieved under a parent node, the parent node will get retrieved instead.
