# AI Agent
An AI model capable of planning, reasoning, and interacting with its environment in order to achieve a user defined objective. An Agent has two main parts
1) Brain (AI model) : Reasoning & Planning, and what actions to take.
2) Body (Capability & Tool) : What are they equipped with

## Agent Workflow
Think --> Act --> Observe
1) Thought: LLM part of the Agent decides what the next step should be.
2) Action: Agent takes action by calling tools with associated arguements.
3) Observation: Model reflects on response from the tool.

Agents iterate through a loop until the objective is fulfilled.

## The Spectrum of Agency
1. Agent output has no impact on program flow --> Simple processor
2. Agent output determines basic control flow --> Router
3. Agent output determines function execution --> Tool Caller
4. Agent output controls iteration and program continuation --> Multi-Step Agent
5. One agentic workflow can start another agentic workflow --> Multi-Agent

An agent can perform any task via TOOLS to complete ACTIONS

## LLMs
AI model that excels in understanding & generating human language. It's principle is to predict the next token given a sequence of next token. Some key terms related to LLMs are 
1) System Messages: Define how the model should behave
2) Conversation User and Assistant Messages: Alternating messages between a Human (User) and an LLM (Assitant)
3) Chat templates: Structuring conversations between human and assistant
4) Base Model + Chat Template = Instruct Model

## Tools
A tool should contain
1) Textual description of what the function does
2) A callable (something to perform an action)
3) Arguments with typings

Model context protocol (MCP): An open protocol that standardizes how applications provide tools to LLMs. 

## Smolagent
The framework we'll be using for creating our first AI Agent. This framework is provided by Huggingface. This library provides framework for developing agents with ease.
