(defrule SEARCH-HEURISTICS::complete-missing-synergies
    "This heuristic finds a missing synergy and adds the necessary instrument" 
    ?arch0 <- (MANIFEST::ARCHITECTURE (bitString ?orig) (num-sats-per-plane ?ns) (improve addSynergy))
    =>
	;(printout t complete-missing-synergies crlf)
    (bind ?N 1)
    (for (bind ?i 0) (< ?i ?N) (++ ?i) 
		(bind ?arch ((new rbsa.eoss.Architecture ?orig ?ns) addSynergy))
    	(assert-string (?arch toFactString)))
	(modify ?arch0 (improve no))
    )
	
	(deffacts DATABASE::add-missing-synergies-list-of-improve-heuristics
(SEARCH-HEURISTICS::improve-heuristic (id addSynergy))
)

