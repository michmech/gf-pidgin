# Pidgin mini-resource grammar for Grammatical Framework

This is a [Grammatical Framework](http://www.grammaticalframework.org/) miniature resource grammar for a kind of "pidgin" English with no inflection and no variations in word order. It generates sentences such as "the man arrive", "you be big", "me love you not". Every category is linearized as just a single string. All strings are built as concatenations of other strings. Negative polarity is linearized by adding "not" to the end of the sentence. The perfect tense is linearized by adding "in the past" to the end of the sentence.

You may find this useful as a starting point for writing a miniature resource grammar in a new language. Start by translating the lexical items, then continue by gradually adding more detail to the structure building functions.

This grammar is compatible with the other miniature resource grammars found in the GF [contributions repository](https://github.com/GrammaticalFramework/gf-contrib/tree/master/miniresource) on GitHub.
