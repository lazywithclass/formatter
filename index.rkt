#lang racket

(provide read-chars)
(provide format)
(provide print-as-string)
(provide clean-whitespace)

(define (read-chars newline-seen)
  (let ([c (read-char)])
    (cond
      ((and (equal? c #\newline) newline-seen) '())
      (else (cons c (read-chars (equal? c #\newline)))))))

(define (format a b newline-seen)
  ;; bleah, clearly there's a better way
  (set! b (clean-whitespace b))
  (cond
    ((null? a) b)
    ((null? b) '())
    ((equal? (car a) #\space)
     (cons #\space (format (rest a) b newline-seen)))
    ((equal? (car a) #\newline)
     (cons #\newline (format (rest a) b #t)))
    (else (cons (car b) (format (rest a) (rest b) newline-seen)))))

(define (clean-whitespace lat)
  (cond
    ;; put newline back if we're done
    ((null? lat) '(#\newline))
    ((equal? (car lat) #\space) (clean-whitespace (cdr lat)))
    ((equal? (car lat) #\newline) (clean-whitespace (cdr lat)))
    (else (cons (car lat) (clean-whitespace (cdr lat))))))

(define (print-as-string lat)
  (void (map display lat)))
