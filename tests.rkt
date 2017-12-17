#lang racket


(require rackunit
         "4matter.rkt")

(define whatever-remains '(whatever remains))

;; we call a the formatted string
;; b the string to be formatted

(test-case
    "b does not contain spaces"
  (let ([a '(#\1 #\space #\space #\2 #\newline)]
        [b '(#\4 #\5 #\newline)])
    (check-equal? (format a b #f) '(#\4 #\space #\space #\5 #\newline))))

(test-case
    "a is on multiple lines"
  ;; 1
  ;;  2
  ;;   3
  (let ([a '(#\1 #\newline #\space #\2 #\newline #\space #\space #\3 #\newline)]
        [b '(#\4 #\5 #\6 #\newline)])
    (check-equal? (format a b #f) '(#\4 #\newline #\space #\5 #\newline #\space #\space #\6 #\newline))))
