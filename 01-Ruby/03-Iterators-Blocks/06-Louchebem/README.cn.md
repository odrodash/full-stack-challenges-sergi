## 背景与目标

你正在和一个法国企业家一起喝酒，她/他告诉你：“我有一个好主意：我想让人们重新开始说louchebem语！”现在你必须帮助她/他😊

### 一些背景研究

* Louchébem是一种法国俚语，最初是巴黎的屠夫在讲这种语言。阅读[这篇文章](https://en.wikipedia.org/wiki/Louch%C3%A9bem) (需要VPN 🛡 )了解更多相关内容。
* 非常简单，你用一个正常的法语单词，例如**"PATRON"**。你把第一个辅音组（第一个元音之前的字母）换成"L"。然后把这个辅音组放在单词的末尾。然后再在末尾加一个louchebem后缀，例如-EM。**因此"PATRON"变成了"LATRONPEM"。**很简单，对吗？😉
* 问问自己，构建你的翻译器的主要问题是什么？（选择最后的后缀，如何处理单词的开头，输入的给定单词有哪些不同情景...）

### 写出伪代码（pseudo-code）

伪代码（Pseudocode）是不用代码交代算法的本质。一个好的程序员可以将写得很好的伪代码，然后再把伪代码变成编程语言里的功能性代码。

* 为你的louchebem翻译器写出伪代码。
* 从小处着手，编写一个只能将一个法语单词翻译成louchebem语的程序
* 然后尝试将其扩展到句子。

你知道吗？那些流行的法语表达，例如"larfeuille", "loufiah", "loucedé", 或者 "loufoque"，实际上都是louchebem语。

## 详细说明

- **约束条件**：一个字母的单词不应该被翻译，例如“a”，
- **约束条件**：对于以辅音开头的单词（"chat", "trou"），你将必须拿走第一个*辅音组*（第一个元音之前的所有辅音字母）并把它当在最后，在单词开头加上一个`l`，并在最后加上后缀（"chat"应该给出"latchem", 或者 "latchoc"）
- **约束条件**：以元音开始的单词不变，但是你应该仍然在单词开头加上一个`l`并在结尾加上一个后缀（"atout"应该给出"latoutoc"或者"latoutic"）
- **约束条件**：随机的后缀应该是下列选项之一：`["em", "é", "ji", "oc", "ic", "uche", "ès"]`
- **强化版**：理想情况下，你的程序应该能够翻译任何复杂句子，不考虑标点符号。

## 进一步建议 & 资源

- 我们现在都知道`#split`方法了，但你知道你也能传递一个字符串格式作为`split`方法的参数吗？别担心，我们将很快在正则表达式（Regular Expression）中看到。但是现在，让我们在irb中试试`"hello, friend!!".split(/\b/)` 你能看出为什么它会在本练习的强化部分变得很有用吗？
- 你的伪代码应该遵循[这些原则](http://www.cs.cornell.edu/courses/cs211/2000fa/materials/using_pseudo_code.htm)


