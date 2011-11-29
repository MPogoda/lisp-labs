; links === list of pairs (A . B)
; add-link
; rm-link
; rm-node
; link?
; in-node
; out-node

(defun equal-link? (link1 link2)
  (and (eq (car link1) (car link2))
       (eq (cdr link1) (cdr link2))
  )
)

(defun link?-helper (link links)
  (if (null links)
    nil
    (if (equal-link? link (car links))
      T
      (link?-helper link (cdr links))
    )
  )
)

(defun link? (a b links)
  (link?-helper (cons a b) links)
)

(defun add-link (a b links)
  (if (link? a b links)
    links
    (cons (cons a b) links)
  )
)

(defun rm-link-helper (link links)
  (if (null links)
    nil
    (if (equal-link? link (car links))
      (cdr links)
      (cons (car links) (rm-link-helper link (cdr links)))
    )
  )
)

(defun rm-link (a b links)
  (rm-link-helper (cons a b) links)
)

(defun rm-node (a links)
  (if (null links)
    nil
    (if
      (or (eq a (car (car links)))
          (eq a (cdr (car links)))
      )
      (rm-node a (cdr links))
      (cons (car links) (rm-node a (cdr links)))
    )
  )
)

(defun in-node (a links)
  (if (null links)
    nil
    (if (eq a (car (car links)))
      (cons (car links) (in-node a (cdr links)))
      (in-node a (cdr links))
    )
  )
)

(defun out-node (a links)
  (if (null links)
    nil
    (if (eq a (cdr (car links)))
      (cons (car links) (out-node a (cdr links)))
      (out-node a (cdr links))
    )
  )
)
