(load "graph.lisp")

(defconstant graph1 (list (cons 'a 'b) (cons 'b 'c) (cons 'c 'a)))
(defconstant graph2 (list (cons 'a 'b) (cons 'b 'a) (cons 'a 'c) (cons 'c 'a) (cons 'b 'c) (cons 'c 'b)))
