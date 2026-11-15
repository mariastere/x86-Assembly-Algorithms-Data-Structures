x86 Assembly Algorithms & Data Structures

📌 Overview

This repository showcases a collection of algorithms and data structure manipulations implemented purely in 32-bit x86 Assembly (NASM syntax). The project emphasizes direct memory manipulation, stack frame management, adherence to the x86 calling convention (cdecl), and interoperability with standard C libraries.

🚀 Features & Modules

1. Linked List Sorting (sortari.asm)

Dynamically builds and reverses a linked list in memory based on a set of target values.

Demonstrates low-level pointer manipulation over a structure (struct node { int val; struct node* next; }).

Implements in-place list reversal without allocating new nodes.

2. String Tokenization & Advanced Sorting (operatii.asm)

Tokenization (get_words): Implements a custom string parsing function (similar to strtok) that iterates byte-by-byte to separate words based on multiple delimiters directly in memory.

Custom Comparator (comparator_sort): A custom callback function written in Assembly and passed to the C standard library's qsort. It sorts strings first by length (calling strlen) and then lexicographically (calling strcmp).

3. Recursive K-Fibonacci (kfib.asm)

Computes elements of a generalized K-Fibonacci sequence using a purely recursive approach in Assembly.

Highlights proper stack frame management for local variables.

Demonstrates context preservation (caller/callee-saved registers) across deep recursive calls.

4. Palindrome Checker (composite_palindrome.asm)

Evaluates strings to check if they are palindromes using an efficient in-place dual-pointer traversal strategy (comparing start and end bytes converging towards the center).

🛠️ Key Technical Learnings

Stack Management: Manual management of the call stack using prologue (enter) and epilogue (leave) instructions.

C/ASM Interoperability: Linking and calling external C standard library functions (qsort, strcmp, strlen) seamlessly from within Assembly code.

Register Management: Efficient usage of x86 registers and protecting data using push and pop sequences.

Byte-level Manipulation: Direct memory addressing and byte-level string mutations.

⚙️ Requirements & Compilation

Architecture: 32-bit x86

Assembler: NASM

Linker: GCC (for linking with libc)
