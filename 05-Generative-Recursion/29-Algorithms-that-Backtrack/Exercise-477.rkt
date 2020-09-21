;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Exercise-477) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; Exercise 477.
;; Explain the design of the generative-recursive version of arrangements.


;; [List-of X] -> [List-of [List-of X]]
;; Creates a list of all rearrangements of the items in w.
(define (arrangements w)
  (cond
    [(empty? w) '(())]
    [else
      (foldr (lambda (item others)
               (local ((define without-item (arrangements (remove item w)))
                       (define add-item-to-front
                         (map (lambda (a) (cons item a)) without-item)))
                 (append add-item-to-front others)))
        '()
        w)]))

(define (all-words-from-rat? w)
  (and (member (explode "rat") w)
       (member (explode "art") w)
       (member (explode "tar") w)))

(check-satisfied (arrangements '("r" "a" "t"))
                 all-words-from-rat?)


;;; What is a trivially solvable problem?
;; The problem is trivially solvable
;; if the given list is an empty or a one-item list.

;;; How are trivial solutions solved?
;; If the given list is empty, arrangements is an empty list.
;; If one-item list is given, arrangements produces a list
;; containing a given list only.

;;; How does the algorithm generate new problems
;;; that are more easily solvable than the original one?
;;; Is there one new problem that we generate or are there several?
;; The new problem is generated by reducing the given list by one item
;; and adding the first item of the given list to all arrangements
;; of the reduced list.

;;; Is the solution of the given problem
;;; the same as the solution of (one of) the new problems?
;;; Or, do we need to combine the solutions
;;; to create a solution for the original problem?
;;; And, if so, do we need anything from the original problem data?
;; We need to combine the solutions by appending them into one list.

;;; Does arrangements in figure 171 create the same lists
;;; as the solution of Word Games, the Heart of the Problem?
;; The lists contain the same items but in different order.
