----
title: AI-assisted onboarding
subtitle: mbuzz
cute_description: Teaching a sceptical audience to trust a new tool.
description: A repeatable AI content engine for onboarding a technically dense SaaS.
date: 2024 - 2025
category: AI Workflow | Content Systems
image: mbuzz_header.png
----
*Case study · AI Workflow · Content Systems*

# Building an AI-Assisted Onboarding System

## The problem

mbuzz is a server-side multi-touch attribution SaaS — technically complex, early-stage, aimed at performance marketers spending serious money on paid acquisition. The onboarding copy needed to do something hard: make a sceptical, data-literate audience trust a new tool fast, without dumbing down the product or losing them in the infrastructure. And it needed to be produced quickly, consistently, and at scale as the product evolved.

## The build

* Created a structured markdown knowledge base — brand voice, customer personas, product positioning, edge cases, objections — and used it as injected context for every generation pass

* Built a closed feedback loop: generate, stress-test against the hardest-to-convince user type, identify where output went probabilistic or vague, and iterate until it held up

* Ran models directly in terminal rather than through a UI — working closer to the output to maintain control over tone, specificity and strategic intent

* Developed prompt libraries and context-injection systems to generate on-brand content at scale without losing the nuance the audience required

* Applied deliberate edge-case testing: if the copy couldn't convince the most sceptical reader, it wasn't ready

## What it produced

Onboarding sequences that held brand voice consistently across a technically dense product at a speed that wouldn't have been possible manually. The more important output was the system itself: repeatable, transferable, and built around clocking what the reader actually needs to feel at each stage of onboarding. The workflow is now a reusable content engine, not a one-off production run.

***

![](/images/mbuzz_header.png)

![](/images/mbuzz_dashboard.png)
