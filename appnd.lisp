; appnd :: appends an element to the end of list
; rvrs  :: inverts the list

(defun rvrs-helper (xs ys)
  (if (null (car xs))
    ys
    (rvrs-helper
      (cdr xs)
      (cons
        (car xs)
        ys
      )
    )
  )
)

(defun rvrs (xs)
  (rvrs-helper xs nil)
)

(defun appnd (xs y)
  (rvrs (cons
          y
          (rvrs xs)
        )
  )
)
