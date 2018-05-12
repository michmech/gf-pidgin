--A miniature resource grammar for a kind of "pidgin" English with no inflection.
--Generates sentences such as "the man arrive", "you be big", "me love you not".
--Every category is linearized as just a single string. All strings are built as concatenations of other strings.
--Negative polarity is linearized by adding "not" to the end of the sentence.
--The perfect tense is linearized by adding "in the past" to the end of the sentence.
--You can adapt this for your language by gradually adding more detail.

--Michal Boleslav Měchura, http://www.lexiconista.com/gf
--Last updated: 14 September 2014

concrete MiniresourcePidg of Miniresource = open Prelude in {
	flags coding = utf8;

	

	--SENTENCE:
	lincat S  = {s : Str};
	
	--Build a sentence from a tense, a polarity and a clause:
	lin UseCl t p cl = { --UseCl : Tense -> Pol -> Cl -> S
		s = cl.s ++ t.s ++ p.s
	};
	
	--Build a new sentence by connecting two existing sentences with a conjunction:
	lin ConjS co sx sy = { --ConjS : Conj -> S  -> S  -> S
		s = sx.s ++ co.s ++ sy.s
	};
	
	
	
	--TENSE:
	lincat Tense = {s : Str};
	
	--Two prefabricated tenses:
	lin Pres = {s = ""};
	lin Perf = {s = "in the past"};
	
	
	
	--POLARITY:
	lincat Pol = {s : Str};
	
	--Two prefabricated polarities:
	lin Pos = {s = ""};
	lin Neg = {s = "not"};
	

	
	--CLAUSE:
	lincat Cl = {s : Str};
	
	--Build a clause from a noun phrase (= the subject) and a verb phrase:
	lin PredVP np vp = { --PredVP : NP -> VP -> Cl
		s = np.s ++ vp.s
	};
	
	

	--VERB PHRASE:
	lincat VP = {s : Str};
	
	--Build a verb phrase by elevating a verb:
	lin UseV v = { --UseV : V -> VP
		s = v.s
	};
	
	--Build a verb phrase from a two-place verb and a noun phrase (= the object):
	lin ComplV2 v2 np = { --ComplV2 : V2 -> NP -> VP
		s = v2.s ++ np.s
	};
	
	--Build a verb phrase from an adjective phrase, using the verb 'to be' ("big" --> "is big"):
	lin CompAP ap = { --CompAP : AP -> VP
		s = "be" ++ ap.s
	};
	
	
	
	--VERB:
	lincat V = {s : Str};
	
	--Some prefabricated verbs:
	lin walk_V = {s = "walk"};
	lin arrive_V = {s = "arrive"};
	
	
	
	--TWO-PLACE VERB:
	lincat V2 = {s : Str};
	
	--Some prefabricated two-place verbs:
	lin love_V2 = {s = "love"};
	lin please_V2 = {s = "please"};


	
	--NOUN PHRASE:
	lincat NP = {s : Str};
	
	--Some prefabricated noun phrases:
	lin i_NP = {s = "me"};
	lin youSg_NP = {s = "you"};
	lin he_NP = {s = "him"};
	lin she_NP = {s = "her"};
	lin we_NP = {s = "us"};
	lin youPl_NP = {s = "you"};
	lin they_NP = {s = "them"};
	
	--Build a noun phrase from a determiner and a common noun:
	lin DetCN det cn = { --DetCN : Det -> CN -> NP
		s = det.s ++ cn.s
	};
	
	--Build a new noun phrase by connecting two existing noun phrases with a conjunction:
	lin ConjNP co nx ny = { --ConjNP : Conj -> NP -> NP -> NP
		s = nx.s ++ co.s ++ ny.s
	};
	
	
	
	--DETERMINER:
	lincat Det = {s : Str};
	
	--Some prefabricated determiners:
    lin a_Det = {s = "a"};
	lin the_Det = {s = "the"};
	lin every_Det = {s = "every"};
    lin this_Det = {s = "this"};
	lin these_Det = {s = "these"};
    lin that_Det = {s = "that"};
	lin those_Det = {s = "those"};
	
	
	
	--COMMON NOUN:
	lincat CN = {s : Str};
	
	--Build a common noun by elevating a noun:
	lin UseN n = { --UseN : N -> CN
		s = n.s
	};
	
	--Build a new common noun by adding an adjective phrase to an existing common noun:
	lin ModCN ap cn = { --ModCN : AP -> CN -> CN
		s = cn.s ++ ap.s
	};
	
	
	
	--NOUN:
	lincat N = {s : Str};
	
	--Some prefabricated nouns:
	lin man_N = {s = "man"};
	lin woman_N = {s = "woman"};
	lin house_N = {s = "house"};
	lin tree_N = {s = "tree"};
	
	
	
	--ADJECTIVE PHRASE:
	lincat AP = {s : Str};
	
	--Build an adjective phrase by elevating an adjective:
	lin UseA a = { --UseA : A -> AP
		s = a.s
	};
	
	--Build a new adjective phrase by adding an ad-adjective to an existing adjective phrase:
	lin AdAP ad ap = { --AdAP : AdA -> AP -> AP
		s = ad.s ++ ap.s
	};
	
	
	
	--ADJECTIVE:
	lincat A = {s : Str};
	
	--Some prefabricated adjectives:
	lin big_A = {s = "big"};
	lin small_A = {s = "small"};
	lin green_A = {s = "green"};
	
	
	
	--AD-ADJECTIVE:
	lincat AdA = {s : Str};
	
	--A prefabricated ad-adjective:
	lin very_AdA = {s = "very"};
	
	
	
	--CONJUNCTION:
	lincat Conj = {s : Str};
	
	--Two prefabricated conjunctions:
	lin and_Conj = {s = "and"};
	lin or_Conj = {s = "or"};
	
}