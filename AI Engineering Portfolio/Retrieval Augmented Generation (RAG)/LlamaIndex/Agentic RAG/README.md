# Building Agentic RAG with LlamaIndex
One of the applications are : Autonomous Research Data Agent

## Router Query Engine
A router that can perform summarization and question/answering. Below are the steps to build a router query engine:
1. Define summary and vector index: A vector index holds most similar nodes whereas a summary index returns all nodes in an index.
2. Query tool = Query Engine + Metadata
3. Selectors: Few of the selectors are a) LLM Selectors: Use the LLM to output a JSON that is parsed, and corresponding indexes are queried. b) Pydantic selectors: OpenAI function calling API
to produce pydantic selection objects rather than parsing raw JSON

## Tool Calling
Enables LLM to interact with external environments through a dynamic interface, where they not only choose an appropriate tool but also necessary arguments for execution. Under standard RAG, LLMs are only used for 
synthesis. 

## Building an Agent Reasoning Loop
LlamaIndex Agent has two parts 
1. Agent Runner: a) overall task dispatcher b) Creating a task and orchestrating runs of agent workers on top of a task c) ables to return the final answer
2. Agent Worker: Execute the next step of a given agent. 
