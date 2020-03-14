;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise-29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; Exercise 29.
;; After studying the costs of a show, the owner discovered several ways of lowering the cost.
;; As a result of these improvements, there is no longer a fixed cost;
;; a variable cost of $1.50 per attendee remains.
;; Modify both programs to reflect this change.
;; When the programs are modified,
;; test them again with ticket prices of $3, $4, and $5 and compare the results.

;; Definitions
(define BASE-PRICE 5.0)
(define BASE-ATTENDEES 120)

(define PRICE-CHANGE 0.1)
(define ATTENDEES-CHANGE 15)

(define ATTENDEE-COST 1.5)

(define (attendees ticket-price)
  (- BASE-ATTENDEES (* (- ticket-price BASE-PRICE) (/ ATTENDEES-CHANGE PRICE-CHANGE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* ATTENDEE-COST (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (profit2 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (* 1.5
        (+ 120
           (* (/ 15 0.1)
              (- 5.0 price))))))

;; Application
(profit 3)
(profit 4)
(profit 5)

(profit2 3)
(profit2 4)
(profit2 5)
