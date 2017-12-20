#lang racket


(require rackunit
         "index.rkt")

(define whatever-remains '(whatever remains))

;; we call a the formatted string
;; b the string to be formatted

(test-case
    "b does not contain spaces"
  (let ([a '(#\1 #\space #\space #\2 #\newline)]
        [b '(#\4 #\5 #\newline)])
    (check-equal? (format a b #f) '(#\4 #\space #\space #\5 #\newline #\newline))))

(test-case
    "a is on multiple lines"
  ;;;; a:
  ;; 1
  ;;  2
  ;;   3
  (let ([a '(#\1 #\newline #\space #\2 #\newline #\space #\space #\3 #\newline)]
        [b '(#\4 #\5 #\6 #\newline)])
    (check-equal? (format a b #f) '(#\4 #\newline #\space #\5 #\newline #\space #\space #\6 #\newline #\newline))))

(test-case
    "b is formatted in a wrong fashion"
  ;;;; a:
  ;; 1
  ;;  2
  ;;   3
  ;;;; b:
  ;; 4 5
  ;;  6
  (let ([a '(#\1 #\newline #\space #\2 #\newline #\space #\space #\3 #\newline)]
        [b '(#\4 #\space #\5 #\newline #\space #\6 #\newline)])
    (check-equal? (format a b #f) '(#\4 #\newline #\space #\5 #\newline #\space #\space #\6 #\newline #\newline))))

(test-case
    "a contains a comment"
  ;;;; a:
  ;; 1
  ;;  2 // here is a test
  ;;;; b:
  ;; 45
  (let ([a '(#\1 #\newline #\space #\space #\2 #\space (#\/ #\/ #\space #\t #\e #\s #\t) #\newline)]
        [b '(#\4 #\5 #\newline)])
    (check-equal? (format a b #f) '(#\4 #\newline #\space #\space #\5 #\space #\/ #\/ #\space #\t #\e #\s #\t #\newline #\newline))))
